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

part of asset_pack_file;

class AssetPackFileAsset {
  /** The name of the asset. */
  final String name;
  /** The url of the asset. */
  final String url;
  /** The type of the asset. */
  String type;
  /** Arguments passed to the loader */
  final Map<String, dynamic> loadArguments;
  /** Arguments passed to the importer */
  final Map<String, dynamic> importArguments;

  /** Convert to JSON (doesn't include the name)*/
  Map toJson() {
    Map assetMap = new Map();
    assetMap['url'] = url;
    assetMap['type'] = type;
    if (loadArguments != null && !loadArguments.isEmpty) {
      assetMap['loadArguments'] = loadArguments;
    }
    if (importArguments != null && !importArguments.isEmpty) {
      assetMap['importArguments'] = importArguments;
    }
    return assetMap;
  }

  /** Construct a new instance with no load or import arguments */
  AssetPackFileAsset(this.name, this.url, this.type, this.loadArguments,
                     this.importArguments);

  /** Construct a new instance from a [map] and a [name] */
  static AssetPackFileAsset fromJson(String name, Map map) {
    String url = map['url'];
    String type = map['type'];
    Map loadArguments = map['loadArguments'];
    Map importArguments = map['importArguments'];
    AssetPackFileAsset asset = new AssetPackFileAsset(name, url, type,
                                                      loadArguments,
                                                      importArguments);
    return asset;
  }
}

class AssetPackFile {
  /** Returns true if [name] is valid. Some names, for example, "assets",
   * are not allowed.
   */
  static bool validAssetName(String name) {
    return name != '';
  }

  /** Assets in the pack file */
  final Map<String, AssetPackFileAsset> assets =
      new Map<String, AssetPackFileAsset>();

  void _add(AssetPackFileAsset asset) {
    assets[asset.name] = asset;
  }

  void _copyMetadata(AssetPackFileAsset newAsset, AssetPackFileAsset asset) {
    // Copy load arguments.
    asset.loadArguments.forEach((k,v) {
      newAsset.loadArguments[k] = v;
    });
    // Copy import arguments.
    asset.importArguments.forEach((k,v) {
      newAsset.importArguments[k] = v;
    });
    // Copy type.
    newAsset.type = asset.type;
  }

  /** Each pack file asset is added to the pack file. If an asset with the
   * same name already exists, its load and import arguments are copied.
   */
  void merge(List<AssetPackFileAsset> parsed) {
    parsed.forEach((asset) {
      AssetPackFileAsset existingAsset = assets[asset.name];
      if (existingAsset != null) {
        _copyMetadata(asset, existingAsset);
        assets.remove(existingAsset.name);
        _add(asset);
      } else {
        _add(asset);
      }
    });
  }

  /** Each pack file asset is added to the pack file. If an asset with the
   * same name already exists, it is replaced.
   */
  void replace(List<AssetPackFileAsset> parsed) {
    parsed.forEach((asset) {
      AssetPackFileAsset existingAsset = assets[asset.name];
      if (existingAsset != null) {
        assets.remove(asset.name);
      }
      _add(asset);
    });
  }

  /** Clear all pack file assets. */
  void clear() {
    assets.clear();
  }

  /** Convert the pack file to JSON. */
  Map<String, Map> toJson() {
    Map<String, Map> json = new Map<String, Map>();
    assets.forEach((name, asset) {
      json[asset.name] = asset.toJson();
    });
    /*
     * Output sorted keys.
    List<String> sortedKeys = json.keys;
    sortedKeys.sort((a,b) => a.compareTo(b));
    Map<String, Map> sortedJson = new Map<String, Map>();
    sortedKeys.forEach((k) {
      print(k);
      sortedJson[k] = json[k];
    });
    return sortedJson;
    */
    return json;
  }

  /** Parse the packFile string into a list of pack file assets. */
  static List<AssetPackFileAsset> parse(String packFile) {
    var parsed = JSON.decode(packFile);
    return new AssetPackFile.fromJson(parsed).assets.values.toList();
  }

  AssetPackFile();

  AssetPackFile.fromJson(Map<String, Map> json) {
    if (json == null) {
      return;
    }
    json.forEach((k, v) {
      AssetPackFileAsset packFileAsset = AssetPackFileAsset.fromJson(k, v);
      assets[k] = packFileAsset;
    });
  }
}
