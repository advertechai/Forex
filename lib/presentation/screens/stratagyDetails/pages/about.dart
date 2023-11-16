import 'package:flutter/material.dart';
import 'package:forex/core/constants/app_color.dart';
import 'package:forex/core/constants/app_size.dart';

import '../../../../data/models/strategy.dart';

class About extends StatefulWidget {
  final Strategy strategy;

  const About({
    super.key,
    required this.strategy,
  });

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: AppColors.backgraundColor,
              width: AppSize.myWidth(context),
              child: Text(
                widget.strategy.article,
                style: const TextStyle(
                  height: 1.5,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            if (widget.strategy.artImage.isNotEmpty)
              Image.network(widget.strategy.artImage),
          ],
        ),
      ),
    );
  }
}
