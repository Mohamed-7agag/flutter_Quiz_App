// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable, unused_import,, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/controller/quiz_controller.dart';
import 'package:flutter_application_quiz/model/question_model.dart';
import 'package:flutter_application_quiz/widget/custom_button.dart';
import 'package:flutter_application_quiz/widget/progress_timer.dart';
import 'package:flutter_application_quiz/widget/question_card.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: GetBuilder<QuizController>(
          init: Get.find<QuizController>(),
          builder: (controller) => CustomButton(
              text: "Next", onpressed: () => controller.nextQuestion()),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: HexColor("#1f2123"),
          ),
          child: GetBuilder<QuizController>(
            init: QuizController(),
            builder: (controller) => Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Question : ",
                          style:
                              TextStyle(fontSize: 25,color: Colors.white),
                              
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          controller.numberOfquestion.round().toString(),
                          style:
                              TextStyle(fontSize: 35, color: HexColor("#3894a3")),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "/",
                          style:
                              TextStyle(fontSize: 30, color: HexColor("#737373")),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          controller.questionslenght.toString(),
                          style:
                              TextStyle(fontSize: 30, color: HexColor("#a6a6a6")),
                        ),
                      ],
                    ),
                  ),
                  Progresstimer(),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.grey[800],thickness: 1,),
            Container(
              height: 400,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => QuestionCard(
                  questionModel: controller.questionlist[index],
                ),
                controller: controller.pageController,
                itemCount: controller.questionslenght,
              ),
            ),
          ],
            ),
          )
        ),
      ),
    );
  }
}
