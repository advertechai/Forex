import 'package:flutter/material.dart';
import 'package:forex/core/constants/app_size.dart';

import '../../../../core/constants/app_color.dart';

class IntroPage extends StatelessWidget {
  final VoidCallback onTap;

  const IntroPage({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/introfirstfon.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: AppSize.myHeight(context) * 0.65,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 36,
              ),
              decoration: const BoxDecoration(
                color: AppColors.backgraundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Сколько вы сможете зарабатывать на инвестициях?',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: AppColors.floatButtonColor,
                    ),
                  ),
                  const SizedBox(height: 36),
                  const Text(
                    'Пройдите официальный опрос от Нашего Приложения - и получите 7 уроков по трейдингу совершенно бесплатно уже сейчас!',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: AppSize.myWidth(context) * 0.85,
                    height: AppSize.myHeight(context) * 0.08,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.floatButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      onPressed: onTap,
                      child: const Text(
                        'Получить бесплатное обучение',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
