import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled8/controller/add_advertisement_controller.dart';
import 'package:untitled8/controller/gsheet_controller.dart';
import 'package:untitled8/view/ComplantScreen/complaint_screen.dart';
import 'controller/ComplaintController.dart';
import 'controller/add_news_controllr.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(ComlaintController());
  Get.lazyPut(() => AdsController());
  Get.lazyPut(() => NewsController());


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ComplaintScreen(),


    );
  }
}

