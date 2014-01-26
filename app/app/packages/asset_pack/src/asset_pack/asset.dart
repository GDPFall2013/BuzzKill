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

/// The [Asset] class holds the metadata for an imported asset. The imported
/// object can be accessed via the [imported] property. Assets belong to a
/// [pack]. They have a [name]. Assets loaded from a [url] have a
/// [loader] and [importer].
class Asset {
  final AssetPack pack;
  /// The name of the asset.
  final String name;
  /// The type of the asset.
  final String type;
  /// The loader for the asset.
  final AssetLoader loader;
  /// The importer for the asset.
  final AssetImporter importer;

  final Map loaderArguments;
  final Map importerArguments;

  final String url;

  String _status = '';
  /// Status string.
  String get status => _status;

  dynamic _imported;

  /// The imported object.
  dynamic get imported => _imported;
  set imported(dynamic import) {
    _imported = import;
    _status = 'OK';
    // TODO(johnmccutchan): Fire event into stream.
  }

  /// Is [imported] a pack file?
  bool get isPack => type == 'pack';

  Asset(this.pack, this.name, this.url, this.type,
        this.loader, this.loaderArguments, this.importer,
        this.importerArguments);

  /// Path to this asset.
  String get path => '${pack.path}.${name}';

  void _delete() {
    if (importer != null) {
      importer.delete(_imported);
    }
  }

  void reload() {
  }
}
