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

class PackImporter extends AssetImporter {
  final AssetManager manager;
  PackImporter(this.manager);

  void initialize(Asset asset) {
    asset.imported = new AssetPack(manager, asset.name);
    asset.imported._parent = asset.pack;
  }

  Future<Asset> import(dynamic payload, Asset asset, AssetPackTrace tracer) {
    tracer.packImportStart(asset);
    tracer.assetImportStart(asset);
    if (payload == null) {
      tracer.assetImportError(asset, "A pack asset was not available.");
      tracer.assetImportEnd(asset);
      tracer.packImportEnd(asset);
      return new Future.value(asset);
    }
    var baseUri = Uri.parse(asset.url);
    var parsed;
    if (payload is String) {
      try {
        parsed = JSON.decode(payload);
      } on FormatException catch (e) {
        tracer.assetImportError(asset, e.message);
        tracer.assetImportEnd(asset);
        tracer.packImportEnd(asset);
        return new Future.value(asset);
      }
    }
    AssetPack pack = asset.imported;
    AssetPackFile packFile = new AssetPackFile.fromJson(parsed);
    List<Future<Asset>> futureAssets = new List<Future<Asset>>();
    packFile.assets.values.forEach((packFileAsset) {
      String url = baseUri.resolve(packFileAsset.url).toString();
      String name = packFileAsset.name;
      String type = packFileAsset.type;

      // TODO: Add proper "ignore" flag in asset pack file.
      // HACK: For now, use an empty type string.
      if (type == '') {
        return;
      }

      // Register asset.
      Asset childAsset = pack.registerAsset(name, type, url,
                                       packFileAsset.loadArguments,
                                       packFileAsset.importArguments);
      // Mark the asset status.
      var futureAsset = manager._loadAndImport(childAsset).then((_) {
        // Mark the asset status.
        childAsset._status = 'Ok';
      });
      futureAssets.add(futureAsset);
    });
    return Future.wait(futureAssets).then((loaded) {
      tracer.assetImportEnd(asset);
      tracer.packImportEnd(asset);
      return new Future.value(pack);
    });
  }

  void delete(dynamic imported) {
    if (imported == null) {
      return;
    }
  }
}