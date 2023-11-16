import 'package:flutter/material.dart';
import 'package:forex/core/constants/app_color.dart';
import 'package:forex/core/constants/app_size.dart';

import '../widgets/question_widget.dart';
import '../cubit/cubit/quiz_cubit.dart';

class QuizPage extends StatelessWidget {
  final int currentPage;
  final Quiz quiz;

  const QuizPage({
    super.key,
    required this.currentPage,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              quiz.image,
              width: AppSize.myWidth(context),
              height: AppSize.myHeight(context) * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: AppSize.myHeight(context) * 0.05,
            left: AppSize.myWidth(context) * 0.05,
            child: Image.asset(
              'assets/logo/logonew-veed-remove-background.png',
              width: 90,
              height: 90,
            ),
          ),
          Positioned(
            top: AppSize.myHeight(context) * 0.3,
            child: Image.asset(
              'assets/images/graph_app.png',
              height: AppSize.myHeight(context) * 0.08,
              width: AppSize.myWidth(context),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: AppSize.myHeight(context) * 0.304,
            left: AppSize.myWidth(context) * 0.05,
            child: Text(
              '0$currentPage',
              style: const TextStyle(
                  color: AppColors.backgraundColor,
                  fontFamily: 'Poppins',
                  fontSize: 50,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Positioned(
            top: AppSize.myHeight(context) * 0.01,
            child: QuestionWidget(
              question: quiz.question,
              answers: quiz.answers,
            ),
          ),
        ],
      ),
    );
  }
}
