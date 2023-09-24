// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/utiles/binding.dart';
import 'package:flutter_application_quiz/view/quiz_screen/quiz_screen.dart';
import 'package:flutter_application_quiz/view/quiz_screen/result_screen/resutl_screen.dart';
import 'package:flutter_application_quiz/view/welcome_screen.dart';
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
      home: WelcomeScreen(),
      initialBinding: MyBinding(),
      theme: ThemeData.light(),
    );
  }
}