import 'package:fruit_apps/data/services/api_helper.dart';

class ApiInterface {
  static final ApiHelper _apiHelper = ApiHelper();

  static void getFruits(SinglePartParameter parameter) {
    _apiHelper.post(
      route: "fruits",
      parameter: parameter,
    );
  }
}
