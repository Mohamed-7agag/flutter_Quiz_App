// ignore_for_file: use_key_in_widget_constructors, must_be_immutable,   sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/controller/quiz_controller.dart';
import 'package:get/get.dart';

class AnswerOption extends StatelessWidget {
  String text;
  int index, questionId;
  Function() onpressed;
  AnswerOption(
      {required this.index,
      required this.questionId,
      required this.text,
      required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        init: QuizController(),
        builder: (controller) => InkWell(
              onTap: controller.checkIsQuestionAnswered(questionId)
                  ? null
                  : onpressed,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 57, 57, 57),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "${index + 1} - ",
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white),
                          children: [
                            TextSpan(
                              text: text,
                              style: const TextStyle(
                                  fontSize: 22, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      if (controller.checkIsQuestionAnswered(questionId) &&
                          controller.selectedanswer == index)
                        Container(
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.getColor(index),
                          ),
                          child: Icon(
                            controller.getIcon(index),
                            color: Colors.white,
                          ),
                        )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ),
            ));
  }
}
