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

class MapLoader extends AssetLoader {
  AssetLoader _loader;

  MapLoader(this._loader);

  Future<Map<String, String>> load(Asset asset, AssetPackTrace tracer) {
    TextLoader textLoader = new TextLoader();
    Future<String> futureMap = textLoader.load(asset, tracer);
    return futureMap.then((map) {
      Map parsed;
      try {
        parsed = JSON.decode(map);
      } on FormatException catch (e) {
        tracer.assetLoadError(asset, e.message);
        return new Future.value(null);
      }
      Map<String, dynamic> loadedMap = {};
      List<Future> futures = [];
      var baseUri = Uri.parse(asset.url);
      parsed.forEach((name, requestUrl) {
        var url = baseUri.resolve(requestUrl).toString();
        Asset request = new Asset(null, name, url,
                                  '', null, {}, null, {});
        futures.add(_loader.load(request, tracer).then((payload) {
          loadedMap[name] = payload;
        }));
      });
      return Future.wait(futures).then((_) {
        return loadedMap;
      });
    });
  }
  void delete(dynamic arg) {
  }
}


