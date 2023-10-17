// ignore_for_file:  must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/controller/quiz_controller.dart';
import 'package:flutter_application_quiz/widget/custom_button.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class QuizResult extends StatelessWidget {
  const QuizResult({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: HexColor("#1f2123")),
            child: GetBuilder<QuizController>(
              init: Get.find<QuizController>(),
              builder: (controller) => Column(
                children: [
                  Text(
                    "Result Of Quiz",
                    style: TextStyle(
                        fontSize: 32,
                        color: HexColor("#ffffff"),
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    controller.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#3894a3"),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "You Scored",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${controller.scoreresult.round()} /100",
                        style: TextStyle(
                          fontSize: 30,
                          color: HexColor("#3894a3"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    text: "Start Again",
                    onpressed: () => controller.startAgain(),
                    width: 220,
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )),
      ),
    );
  }
}
