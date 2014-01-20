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

library asset_pack;

import 'dart:html';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import 'dart:math';
import 'asset_pack_file.dart';

part 'src/asset_pack/asset_pack_trace.dart';
part 'src/asset_pack/asset.dart';
part 'src/asset_pack/asset_importer.dart';
part 'src/asset_pack/asset_manager.dart';
part 'src/asset_pack/asset_pack.dart';
part 'src/asset_pack/decoders/base_64_decoder.dart';
part 'src/asset_pack/importers/json_importer.dart';
part 'src/asset_pack/importers/noop_importer.dart';
part 'src/asset_pack/importers/pack_importer.dart';
part 'src/asset_pack/importers/text_importer.dart';
part 'src/asset_pack/asset_loader.dart';
part 'src/asset_pack/loaders/arraybuffer_loader.dart';
part 'src/asset_pack/loaders/blob_loader.dart';
part 'src/asset_pack/loaders/image_loader.dart';
part 'src/asset_pack/loaders/map_loader.dart';
part 'src/asset_pack/loaders/text_loader.dart';
part 'src/asset_pack/loaders/video_loader.dart';
part 'src/asset_pack/progress_controler.dart';
