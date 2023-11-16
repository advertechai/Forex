import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../cubit/cubit/quiz_cubit.dart';

class QuestionWidget extends StatefulWidget {
  final String question;
  final List<String> answers;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.answers,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int selectedIndex = 0;

  @override
  void initState() {
    getSelectedIndex();
    super.initState();
  }

  void getSelectedIndex() {
    final result = context.read<QuizCubit>().state.result[widget.question];
    if (result != null) {
      for (var i = 0; i < widget.answers.length; i++) {
        if (result == widget.answers[i]) {
          selectedIndex = i;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppSize.myWidth(context) * 0.9,
          margin: EdgeInsets.only(
            top: AppSize.myHeight(context) * 0.4,
            left: AppSize.myWidth(context) * 0.05,
          ),
          child: Text(
            widget.question,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              color: AppColors.floatButtonColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        for (var i = 0; i < 4; i++)
          Container(
            margin: EdgeInsets.only(
              top: AppSize.myWidth(context) * 0.05,
              left: AppSize.myWidth(context) * 0.05,
            ),
            width: AppSize.myWidth(context) * 0.9,
            height: AppSize.myHeight(context) * 0.07,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 0),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: RadioListTile<int>(
              value: i,
              groupValue: selectedIndex,
              onChanged: (int? val) {
                setState(() {
                  selectedIndex = val!;
                });
                context.read<QuizCubit>().addQuizResult(
                    widget.question, widget.answers[selectedIndex]);
              },
              title: Text(
                widget.answers[i],
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
