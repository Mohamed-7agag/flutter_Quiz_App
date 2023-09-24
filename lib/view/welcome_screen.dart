// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/controller/quiz_controller.dart';
import 'package:flutter_application_quiz/view/quiz_screen/quiz_screen.dart';
import 'package:flutter_application_quiz/widget/custom_button.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

GlobalKey<FormState> mykey = GlobalKey<FormState>();
TextEditingController name = TextEditingController();
// QuizController controller = Get.put(QuizController());

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: HexColor("#1f2123"),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 230,
            ),
            Text(
              "Let's Start Quiz",
              style: TextStyle(fontSize: 30, color: HexColor("#d9d9d9"),),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Enter Your name To Start",
              style: TextStyle(fontSize: 22, color: HexColor("#737373"),),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
                key: mykey,
                child: GetBuilder<QuizController>(
                  init: Get.find<QuizController>(),
                  builder: (controller) => TextFormField(
                    controller: name,
                    onSaved: (newValue) {
                      controller.name = newValue!.trim().toUpperCase();
                    },
                    validator: (value) {
                      if (value == "") {
                        return "Name Required";
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: " Enter Your Name",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor("#737373"),),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                )),
            SizedBox(
              height: 25,
            ),
            CustomButton(
              text: "Start",
              onpressed: () {
                if (mykey.currentState!.validate()) {
                  mykey.currentState!.save();
                  Get.off(() => QuizScreen());
                  Get.find<QuizController>().startTimer();
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
