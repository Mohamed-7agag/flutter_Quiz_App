import 'package:flutter_application_quiz/controller/quiz_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
  }
}
