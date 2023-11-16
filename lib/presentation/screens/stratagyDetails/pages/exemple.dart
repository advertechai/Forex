import 'package:flutter/material.dart';
import 'package:forex/core/constants/app_color.dart';
import 'package:forex/data/models/strategy.dart';

class Exemple extends StatefulWidget {
  final Strategy strategy;
  const Exemple({
    super.key,
    required this.strategy,
  });

  @override
  State<Exemple> createState() => _ExempleState();
}

class _ExempleState extends State<Exemple> {
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
                  widget.strategy.exampleTitle,
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
              widget.strategy.example,
              style: const TextStyle(
                height: 1.5,
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.textCommon,
              ),
            ),
            if (widget.strategy.exImage.isNotEmpty)
              Image.network(widget.strategy.exImage),
          ],
        ),
      ),
    );
  }
}
