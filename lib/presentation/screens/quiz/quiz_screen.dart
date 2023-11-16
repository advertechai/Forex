import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit/quiz_cubit.dart';
import 'pages/end_quiz.dart';
import 'pages/intro_page.dart';
import 'pages/quiz_page.dart';
import 'widgets/quiz_navbar.dart';

class QuizScreen extends StatefulWidget {
  static const String path = '/quiz';
  static const String name = 'quiz';

  const QuizScreen({
    super.key,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final PageController pageController;
  late final PageController innerPageController;

  int page = 0;

  @override
  void initState() {
    pageController = PageController(
      initialPage: context.read<QuizCubit>().state.currentPage,
    );
    innerPageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        return PageView.builder(
          controller: pageController,
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) {
              return IntroPage(
                onTap: () => changePage(page + 1),
              );
            }
            if (index == 2) {
              return const EndQuiz();
            }
            return Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: innerPageController,
                      itemCount: state.questions.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return QuizPage(
                          currentPage: index + 1,
                          quiz: state.questions[index],
                        );
                      },
                    ),
                  ),
                  QuizNavBar(
                    currentPage: state.currentPage,
                    forward: () {
                      if (innerPageController.page!.round() == 5) {
                        changePage(page + 1);
                      } else {
                        changeInnerPage(state.currentPage + 1);
                      }
                    },
                    back: () {
                      if (innerPageController.page!.round() == 0) {
                        changePage(page - 1);
                      } else {
                        changeInnerPage(state.currentPage - 1);
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void changePage(int pageIndex) {
    setState(() {
      page = pageIndex;
    });
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void changeInnerPage(int pageIndex) {
    context.read<QuizCubit>().setPage(pageIndex);
    innerPageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
