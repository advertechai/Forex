import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:forex/core/constants/app_color.dart';
import 'package:forex/core/constants/app_radius.dart';

class SliderButton extends StatefulWidget {
  const SliderButton({super.key});

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

enum SegmentType { advice, analytics }

class _SliderButtonState extends State<SliderButton> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomSlidingSegmentedControl<SegmentType>(
        initialValue: SegmentType.advice,
        isStretch: true,
        children: const {
          SegmentType.advice: Text(
            'Советы',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.floatButtonColor,
            ),
          ),
          SegmentType.analytics: Text(
            'Аналитика',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.floatButtonColor,
            ),
          ),
        },
        innerPadding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: AppColors.innactiveColor,
          borderRadius: AppRarius.circularOut,
        ),
        thumbDecoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: AppRarius.circularIn,
        ),
        onValueChanged: (v) {
          print(v);
        },
      ),
    );
  }
}
