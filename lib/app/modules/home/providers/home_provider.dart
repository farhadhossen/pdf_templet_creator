import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }



}
