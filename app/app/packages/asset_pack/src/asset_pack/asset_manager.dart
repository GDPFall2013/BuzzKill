/*
  Copyright (C) 2013 John McCutchan <john@johnmccutchan.com>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

part of asset_pack;

class AssetManager {
  /** A map from asset type to importers. Add your own importers. */
  final Map<String, AssetImporter> importers = new Map<String, AssetImporter>();
  /** A map from asset type to loader. Add your own loaders. */
  final Map<String, AssetLoader> loaders = new Map<String, AssetLoader>();

  final AssetPackTrace tracer;

  AssetManager([tracer0]) :
    tracer = (tracer0 == null) ? new NullAssetPackTrace() : tracer0 {
    _root = new AssetPack(this, 'root');
    importers['json'] = new JsonImporter();
    importers['text'] = new TextImporter();
    importers['pack'] = new PackImporter(this);
    importers['textmap'] = new NoopImporter();
    importers['imagemap'] = new NoopImporter();
    importers['image'] = new NoopImporter();
    loaders['textmap'] = new MapLoader(new TextLoader());
    loaders['imagemap'] = new MapLoader(new ImageLoader());
    loaders['json'] = new TextLoader();
    loaders['text'] = loaders['json'];
    loaders['pack'] = loaders['json'];
    loaders['image'] = new ImageLoader();
  }

  void _supportedTypeCheck(String type) {
    AssetImporter importer = importers[type];
    if (importer == null) {
      throw new ArgumentError('Cannot find importer for ${type}.');
    }
    AssetLoader loader = loaders[type];
    if (loader == null) {
      throw new ArgumentError('Cannot find loader for ${type}.');
    }
  }

  AssetPack _root;
  /// The root pack.
  AssetPack get root => _root;

  /// Forwarded to root.
  dynamic getImportedAtPath(String path) => root.getImportedAtPath(path);

  /// Forwarded to [getImportedAtPath].
  dynamic operator[](String path) => getImportedAtPath(path);

  /// Forwarded to root.
  Asset getAssetAtPath(String assetPath) => root.getAssetAtPath(assetPath);

  /// Forwarded to root. See [AssetPack] for method documentation.
  Future<Asset> loadAndRegisterAsset(String name, String type, String url,
                                     Map loaderArguments,
                                     Map importerArguments) {
    return root.loadAndRegisterAsset(name, type, url, loaderArguments,
                                     importerArguments);
  }

  /// Forwarded to root. See [AssetPack] for method documentation.
  AssetPack registerPack(String assetPackName, String url) {
    return _root.registerPack(assetPackName, url);
  }

  /// Forwared to root. See [AssetPack] for method documentation.
  void deregisterPack(String name) {
    return _root.deregisterPack(name);
  }

  /// Forwarded to root. See [AssetPack] for method documentation.
  Future<AssetPack> loadPack(String name, String url) {
    return _root.loadPack(name, url);
  }

  /// Forwarded to root. See [AssetPack] for method documentation.
  Future loadPacks(List<List<String>> packs) {
    return _root.loadPacks(packs);
  }

  Future<Asset> _loadAndImport(Asset asset) {
    if (asset.loader == null) {
      tracer.assetLoadError(asset, 'no loader registered for ${asset.type}');
      return new Future.value(asset);
    }
    if (asset.importer == null) {
      tracer.assetLoadError(asset, 'no importer registered for ${asset.type}');
      return new Future.value(asset);
    }
    asset._status = 'Loading';
    return asset.loader.load(asset, tracer).then((payload) {
      asset._status = 'Importing';
      return asset.importer.import(payload, asset, tracer);
    });
  }
}
