import 'dart:convert';

import 'package:fruit_apps/data/services/api_helper.dart';
import 'package:fruit_apps/data/services/api_interface.dart';
import 'package:fruit_apps/data/services/entities/fruit_response.dart';
import 'package:get/get.dart';

class FruitController extends GetxController {
  final RxList<Fruit> fruits = RxList([]);
  final Map<String, String> imageReference = {};
  final RxBool loading = RxBool(false);

  void getFruit() {
    Map<String, dynamic> body = {
      "data": {
        "imageReferences": true,
        "referenceId": "1650165235",
      }
    };

    loading.value = true;
    ApiInterface.getFruits(
      SinglePartParameter(
        header: {"content-type": "application/json"},
        stringBody: jsonEncode(body),
        onFinish: (response) {
          loading.value = false;

          FruitResponse fruitResponse = FruitResponse.fromJson(
            jsonDecode(response.body),
          );

          if (response.statusCode == 200) {
            fruits.clear();
            imageReference.clear();

            fruits.addAll(fruitResponse.data?.fruits ?? []);
            imageReference.addAll(fruitResponse.data?.imagesReferences ?? {});
          }
        },
      ),
    );
  }
}
