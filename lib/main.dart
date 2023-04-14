import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vezeeta_app/controller/locale_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vezeeta_app/view/pages/AskDoc.dart';
import 'package:vezeeta_app/view/pages/confirmationPage.dart';
import 'package:vezeeta_app/view/pages/homePage.dart';
import 'package:vezeeta_app/view/widgets/DateWidget.dart';
import 'package:vezeeta_app/view/widgets/dateAndTime.dart';
import 'controller/Locale.dart';
import 'firebase_options.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const VezeetaApp());
}

class VezeetaApp extends StatelessWidget {
  const VezeetaApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LangController());
    return GetMaterialApp(
      translations: MyLocale(),
      locale: Get.deviceLocale,
      initialRoute: '/',
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
