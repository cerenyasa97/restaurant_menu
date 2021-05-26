import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:restaurant_menu/core/constants/data/data_constants.dart';

class JsonService{
  static Future<Map<dynamic, dynamic>> loadLocalJson() async {
    var data = await rootBundle.loadString(DataConstants.DATA_PATH);
    Map<String, dynamic> decodedJson = json.decode(data);
    return decodedJson;
  }
}