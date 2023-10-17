// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/controller/quiz_controller.dart';
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
            text: "Next",
            onpressed: () => controller.nextQuestion(),
          ),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: HexColor("#1f2123"),
            ),
            child: GetBuilder<QuizController>(
              init: QuizController(),
              builder: (controller) => Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              const Text(
                                "Question : ",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                controller.numberOfquestion.round().toString(),
                                style: TextStyle(
                                    fontSize: 35, color: HexColor("#3894a3")),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "/",
                                style: TextStyle(
                                    fontSize: 30, color: HexColor("#737373")),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                controller.questionslenght.toString(),
                                style: TextStyle(
                                    fontSize: 30, color: HexColor("#a6a6a6")),
                              ),
                            ],
                          ),
                        ),
                        Progresstimer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey[800],
                    thickness: 1,
                  ),
                  Container(
                    height: 400,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => QuestionCard(
                        questionModel: controller.questionlist[index],
                      ),
                      controller: controller.pageController,
                      itemCount: controller.questionslenght,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
