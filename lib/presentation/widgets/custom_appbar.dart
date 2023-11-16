import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forex/core/constants/app_color.dart';
import 'package:forex/core/constants/app_size.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String leftIconPath;
  final String rightIconPath;
  final String title;
  final VoidCallback onLeftIconPressed;
  final VoidCallback onRightIconPressed;

  const CustomAppBar({
    super.key,
    required this.leftIconPath,
    required this.rightIconPath,
    required this.title,
    required this.onLeftIconPressed,
    required this.onRightIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
      decoration: const BoxDecoration(
        color: AppColors.floatButtonColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      width: AppSize.myWidth(context),
      height: AppSize.myHeight(context) * 0.14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onLeftIconPressed,
            icon: SvgPicture.asset(leftIconPath, width: 24.0, height: 24.0),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: AppColors.contrastTextColor,
            ),
          ),
          IconButton(
            onPressed: onRightIconPressed,
            icon: SvgPicture.asset(rightIconPath, width: 24.0, height: 24.0),
          ),
        ],
      ),
    );
  }
}
