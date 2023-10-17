// ignore_for_file: must_be_immutable,

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/controller/quiz_controller.dart';
import 'package:get/get.dart';

class Progresstimer extends StatelessWidget {
  Progresstimer({super.key});
  final controller = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 50,
          width: 50,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: 1 - (controller.second.value / 15),
                color: const Color(0xff3894a3),
                backgroundColor: Colors.grey,
                strokeWidth: 5,
              ),
              Center(
                child: Text(
                  "${controller.second.value}",
                  style:
                      const TextStyle(fontSize: 18, color: Color(0xff3894a3)),
                ),
              )
            ],
          ),
        ));
  }
}
