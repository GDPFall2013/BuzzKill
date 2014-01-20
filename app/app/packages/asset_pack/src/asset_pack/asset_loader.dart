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

/// Interface of an [AssetLoader]. An asset loader is responsible
/// for loading an object from a url pointing to a network or filesystem.
abstract class AssetLoader {

  static Future<dynamic> httpLoad(
      Asset asset,
      String responseType,
      dynamic extractResponse(HttpRequest),
      AssetPackTrace tracer ) {
    tracer.assetLoadStart(asset);
    var completer = new Completer<dynamic>();

    var xhr = new HttpRequest();
    xhr.open('GET', asset.url, async: true);
    xhr.responseType = responseType;
    xhr.onLoad.listen((e) {
      // Note: file:// URIs have status of 0.
      if ((xhr.status >= 200 && xhr.status < 300) ||
          xhr.status == 0 || xhr.status == 304) {
        tracer.assetLoadEnd(asset);
        completer.complete(extractResponse(xhr));
      } else {
        tracer.assetLoadError(
            asset,
            "http status code rejected : ${xhr.status} : ${xhr.statusText}"
        );
        tracer.assetLoadEnd(asset);
        completer.complete(null);
      }
    });

    xhr.onError.listen((e) {
      tracer.assetLoadError(
          asset,
          "http status code rejected : ${xhr.status} : ${xhr.statusText}"
      );
      tracer.assetLoadEnd(asset);
      completer.complete(null);
    });

    xhr.send();
    return completer.future;
  }

  /// Fetch [asset] Url.
  Future<dynamic> load(Asset asset, AssetPackTrace tracer);
  /// Delete fetched [arg].
  void delete(dynamic arg);
}
