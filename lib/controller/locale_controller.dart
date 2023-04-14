import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangController extends GetxController {
  void changeLang(String LangCode) {
    Locale locale = Locale(LangCode);
    Get.updateLocale(locale);
  }
}
