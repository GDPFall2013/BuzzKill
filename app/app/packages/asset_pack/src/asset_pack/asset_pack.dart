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


/**
 * A set of assets. The importer property of an asset can be accessed as if
 * it were a property on the pack with the name of the asset. Metadata for
 * an asset can be accessed via the [assets] map. That means that the
 * following is true:
 *
 * pack.assets["assetName"].imported == pack.assetName
 *
 * Asset packs can contain other asset packs.
 *
 * You can determine the path of an asset pack by getting it's path variable.
 *
 */
class AssetPack {
  final AssetManager manager;
  final String name;
  final Map<String, Asset> assets = new Map<String, Asset>();

  AssetPack _parent;
  /// Parent pack or null.
  AssetPack get parent => _parent;

  /// Path to this pack.
  String get path {
    if (parent == null) {
      return '';
    }
    String parentPath = parent.path;
    if (parentPath == '') {
      return name;
    } else {
      return '$parentPath.$name';
    }
  }

  AssetPack(this.manager, this.name);

  /// Returns the type of [assetName].
  String type(String assetName) {
    Asset asset = assets[assetName];
    if (asset != null) {
      return asset.type;
    }
    return null;
  }

  /// Returns the url of [assetName].
  String url(String assetName) {
    Asset asset = assets[assetName];
    if (asset != null) {
      return asset.url;
    }
    return null;
  }

  /// Add asset to this pack.
  Asset registerAsset(String name, String type, String url,
                      Map loaderArguments, Map importerArguments) {
    if (AssetPackFile.validAssetName(name) == false) {
      throw new ArgumentError('$name is an invalid name.');
    }
    Asset asset = assets[name];
    if (asset != null) {
      throw new ArgumentError('$name already exists.');
    }
    var loader = manager.loaders[type];
    var importer = manager.importers[type];
    // Create asset.
    asset = new Asset(this, name, url, type, loader,
                      loaderArguments, importer, loaderArguments);
    if (importer != null) {
      importer.initialize(asset);
    }
    if (importer == null) {
      asset._status = 'No importer available.';
    } else if (loader == null) {
      asset._status = 'No loader available.';
    } else {
      asset._status = 'OK';
    }
    // Register asset in pack.
    assets[name] = asset;
    return asset;
  }

  /// Adds and loads an [Asset] to this pack.
  Future<Asset> loadAndRegisterAsset(String name, String type, String url,
                                     Map loaderArguments,
                                     Map importerArguments) {
    Asset asset = registerAsset(name, type, url, loaderArguments,
                                importerArguments);
    return manager._loadAndImport(asset);
  }

  /// Remove an asset from this pack.
  void deregisterAsset(String name) {
    final asset = assets[name];
    if (asset == null) {
      throw new ArgumentError('$name does not exist.');
    }
    // Unregister asset in pack.
    assets.remove(name);
  }

  /// Get asset's imported property at [path].
  dynamic getImportedAtPath(String path) {
    List<String> splitPath = path.split(".");
    Asset asset = _getAssetAtPath(path, splitPath, false);
    if (asset != null) {
      return asset.imported;
    }
    return null;
  }

  /// Get asset metadata at [path]. Returns the [Asset] not the imported value
  Asset getAssetAtPath(String path) {
    List<String> splitPath = path.split(".");
    return _getAssetAtPath(path, splitPath, true);
  }

  /// Forwarded to [getImportedAtPath].
  dynamic operator[](String path) => getImportedAtPath(path);

  Asset _getAssetAtPath(String fullAssetPath, List<String> assetPath,
                        bool throwOnNotFound) {
    if (assetPath.length == 0) {
      if (throwOnNotFound == false) {
        return null;
      }
      throw new ArgumentError('$fullAssetPath does not exist.');
    }
    String name = assetPath.removeAt(0);
    Asset asset = assets[name];
    if (asset == null) {
      if (throwOnNotFound == false) {
        return null;
      }
      throw new ArgumentError('$fullAssetPath does not exist.');
    }
    if (asset.isPack && assetPath.length > 0) {
      AssetPack pack = asset.imported;
      return pack._getAssetAtPath(fullAssetPath, assetPath, throwOnNotFound);
    }
    if (assetPath.length > 0) {
      if (throwOnNotFound == false) {
        return null;
      }
      throw new ArgumentError('$fullAssetPath does not exist.');
    }
    return asset;
  }

  /// Add a child asset pack to this asset pack.
  AssetPack registerPack(String name, String url) {
    Asset asset = registerAsset(name, 'pack', url, {}, {});
    asset.imported._parent = this;
    return asset.imported;
  }

  /// Remove a child pack from this asset pack.
  void deregisterPack(String name) {
    Asset asset = assets[name];
    if (asset == null) {
      throw new ArgumentError('$name does not exist.');
    }
    if (asset.isPack == false) {
      throw new ArgumentError('$name is not an asset pack.');
    }
    AssetPack pack = asset.imported;
    pack._parent = null;
    deregisterAsset(name);
    pack._delete();
  }

  /// Load the pack at [url] and add it as a child pack named [name].
  Future<AssetPack> loadPack(String name, String url) {
    Asset asset = registerAsset(name, 'pack', url, {}, {});
    asset.imported._parent = this;
    return manager._loadAndImport(asset).then((_) =>
        new Future.value(asset.imported));
  }

  /// Load many packs, adding each one as a child pack.
  /// [['packName', 'packUrl'], ['packName2', 'packUrl2']]
  Future loadPacks(List<List<String>> packs) {
    if (packs == null) {
      return new Future.value(null);
    }
    var futurePacks = new List<Future<AssetPack>>();
    packs.forEach((pack) {
      String name = pack[0];
      String url = pack[1];
      var futurePack = loadPack(name, url);
      futurePacks.add(futurePack);
    });
    return Future.wait(futurePacks);
  }

  /// Number of assets in pack.
  int get length => assets.length;

  /// Clear all assets from this pack.
  void clear() {
    _delete();
  }

  void _delete() {
    assets.forEach((name, asset) {
      asset._delete();
    });
    assets.clear();
  }

  /// Reloads all assets in the pack. Does not reload the .pack file.
  void reload() {
    assets.forEach((name, asset) {
      asset.reload();
    });
  }
}
