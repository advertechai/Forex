// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:forex/core/constants/app_color.dart';

import 'package:forex/data/models/strategy.dart';

class UserCase extends StatefulWidget {
  const UserCase({
    Key? key,
    required this.strategy,
  }) : super(key: key);
  final Strategy strategy;

  @override
  State<UserCase> createState() => _UserCaseState();
}

class _UserCaseState extends State<UserCase> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.strategy.userCaseTitle,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: AppColors.floatButtonColor,
                  ),
                ),
              ),
            ),
            Text(
              widget.strategy.userCaseText,
              style: const TextStyle(
                height: 1.5,
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.textCommon,
              ),
            ),
            if (widget.strategy.userCaseImg1.isNotEmpty)
              Image.network(widget.strategy.userCaseImg1),
            if (widget.strategy.userCaseImg2.isNotEmpty)
              Image.network(widget.strategy.userCaseImg2),
            if (widget.strategy.userCaseImg3.isNotEmpty)
              Image.network(widget.strategy.userCaseImg3),
          ],
        ),
      ),
    );
  }
}
