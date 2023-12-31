import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/controller/quiz_controller.dart';
import 'package:flutter_application_quiz/model/question_model.dart';
import 'package:flutter_application_quiz/widget/answer_widget.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  final QuestionModel questionModel;
  const QuestionCard({super.key, required this.questionModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 10, bottom: 25),
              child: Text(
                questionModel.question,
                style: const TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...List.generate(
              questionModel.options.length,
              (index) => Column(
                children: [
                  AnswerOption(
                    index: index,
                    questionId: questionModel.id,
                    text: questionModel.options[index],
                    onpressed: () => Get.find<QuizController>()
                        .checkAnswer(questionModel, index),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
