import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(const QuizState());

  void setPage(int page) {
    if (page != state.currentPage) {
      emit(
        state.copyWith(
          currentPage: page,
        ),
      );
    }
  }

  Future<void> saveQuizResults() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('quiz_result', state.result.toString());
  }

  void addQuizResult(String question, String answer) {
    final tempResult = Map<String, String>.from(state.result);
    tempResult[question] = answer;

    emit(state.copyWith(result: tempResult));

    log("Attempting to save quiz results.");
    saveQuizResults().then((_) {
      log("Quiz results should be saved now.");
    }).catchError((error) {
      log("Error saving quiz results: $error");
    });
  }
}
