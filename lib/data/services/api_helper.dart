import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import 'api_service.dart';

class SinglePartParameter {
  String? stringBody;
  Map<String, String>? urlParams;
  Map<String, String>? body;
  Map<String, String>? header;
  VoidCallback? onRequestTimeOut;
  Function(dynamic error, Response response)? onUnhandleError;
  Function(Response response)? onFinish;

  SinglePartParameter({
    this.stringBody,
    this.urlParams,
    this.body,
    this.header,
    this.onRequestTimeOut,
    this.onUnhandleError,
    this.onFinish,
  });
}

class ApiHelper {
  void showError(dynamic error, String message) {
    debugPrint(error.toString());
    debugPrint(message);
  }

  Future<Response> post({
    required String route,
    required SinglePartParameter parameter,
  }) async {
    Response response = await ApiService.client.post(
      Uri.parse(ApiService.baseUrl + route),
      body: parameter.body ?? parameter.stringBody,
      headers: parameter.header,
    );

    return response;
  }
}
