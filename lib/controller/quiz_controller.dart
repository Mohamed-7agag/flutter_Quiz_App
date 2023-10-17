// ignore_for_file: unused_field, prefer_final_fields, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable,

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/model/question_model.dart';
import 'package:flutter_application_quiz/view/quiz_screen/result_screen/resutl_screen.dart';
import 'package:flutter_application_quiz/view/welcome_screen.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  String name = "";
  final List<QuestionModel> _questionlist = [
    QuestionModel(
        answer: 0,
        id: 1,
        question: "question 1?",
        options: ["one", "two", "three", "four"]),
    QuestionModel(
        answer: 1,
        id: 1,
        question: "question 2?",
        options: ["one", "two", "three", "four"]),
    QuestionModel(
        answer: 2,
        id: 1,
        question: "question 3?",
        options: ["one", "two", "three", "four"]),
    QuestionModel(
        answer: 3,
        id: 1,
        question: "question 4?",
        options: ["one", "two", "three", "four"]),
    QuestionModel(
        answer: 1,
        id: 1,
        question: "question 5?",
        options: ["one", "Five", "three", "four"]),
    QuestionModel(
        answer: 0,
        id: 1,
        question: "question 6?",
        options: ["six", "two", "three", "four"]),
    QuestionModel(
        answer: 1,
        id: 1,
        question: "question 7?",
        options: ["one", "seven", "three", "four"]),
    QuestionModel(
        answer: 2,
        id: 1,
        question: "question 8?",
        options: ["one", "two", "eight", "four"]),
    QuestionModel(
        answer: 3,
        id: 1,
        question: "question 9?",
        options: ["one", "two", "three", "nine"]),
  ];
///////////////////////////////  Variables  ////////////////////////////
  bool _ispressed = false;

  double _numberOfquestion = 1;

  int? _selectedanswer;

  int _countOfcorrectanswer = 0;

  final RxInt _second = 15.obs;

  int? _correctanswer;

  final Map<int, bool> __questionIsanswered = {};

  Timer? _timer;

  final maxsecond = 15;

  late PageController pageController;

  ////////////////////////////////////////////

  int get questionslenght => _questionlist.length;

  List<QuestionModel> get questionlist => [..._questionlist];

  bool get ispressed => _ispressed;

  double get numberOfquestion => _numberOfquestion;

  int? get selectedanswer => _selectedanswer;

  int get countOfcorrectanswer => _countOfcorrectanswer;

  RxInt get second => _second;

  double get scoreresult {
    return _countOfcorrectanswer * 100 / questionslenght;
  }

  Color getColor(int answerindex) {
    if (_ispressed) {
      if (answerindex == _correctanswer) {
        return Colors.green;
      } else if (answerindex == _selectedanswer &&
          _selectedanswer != _correctanswer) {
        return Colors.red;
      }
    }
    return Colors.white;
  }

  IconData getIcon(int answerindex) {
    if (_ispressed) {
      if (answerindex == _correctanswer) {
        return Icons.done;
      } else if (answerindex == _selectedanswer &&
          _selectedanswer != _correctanswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetanswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void checkAnswer(QuestionModel questionModel, int selectedanswer) {
    _ispressed = true;
    _selectedanswer = selectedanswer;
    _correctanswer = questionModel.answer;
    if (selectedanswer == questionModel.answer) {
      _countOfcorrectanswer++;
    }
    stopTimer();
    __questionIsanswered.update(questionModel.id, (value) => true);

    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => nextQuestion());

    update();
  }

  bool checkIsQuestionAnswered(int QuesionId) {
    return __questionIsanswered.entries
        .firstWhere((element) => element.key == QuesionId)
        .value;
  }

  void resetanswer() {
    for (var element in _questionlist) {
      __questionIsanswered.addAll({element.id: false});
    }
    update();
  }

  void nextQuestion() {
    if (_timer != null || _timer!.isActive) {
      stopTimer();
    }
    if (pageController.page == questionslenght - 1) {
      Get.off(() => const QuizResult());
    } else {
      _ispressed = false;
      resetanswer();
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
      startTimer();
    }
    _numberOfquestion = pageController.page! + 2;
    update();
  }

  void startTimer() {
    _second.value = maxsecond;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_second.value > 0) {
        _second.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  void stopTimer() => _timer!.cancel();

  void startAgain() {
    _correctanswer = null;
    _countOfcorrectanswer = 0;
    _selectedanswer = null;
    _numberOfquestion = 1;
    resetanswer();
    Get.offAll(() => const WelcomeScreen());
  }
} //
