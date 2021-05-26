import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_menu/utils/service/json_service.dart';

void main() {
  test("Data read testing from Json", ()async{
    var decodedData = await JsonService.loadLocalJson();
    expect(decodedData is List, false);
    expect(decodedData is Map, true);
  });
}
