
import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/utiles/binding.dart';
import 'package:flutter_application_quiz/view/splash.dart';
import 'package:get/get_navigation/get_navigation.dart';
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: MyBinding(),
    );
  }
}