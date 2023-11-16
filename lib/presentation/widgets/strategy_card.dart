import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forex/core/constants/app_color.dart';
import 'package:forex/data/models/strategy.dart';

class StrategyCard extends StatelessWidget {
  final Strategy strategy;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const StrategyCard({
    super.key,
    required this.strategy,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 20,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  strategy.title,
                  style: const TextStyle(
                    color: AppColors.floatButtonColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
                InkWell(
                  onTap: onFavoriteTap,
                  child: SvgPicture.asset('assets/icons/book.svg', height: 25),
                )
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    strategy.currencyPair.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        child: Chip(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: AppColors.floatButtonColor,
                            ),
                          ),
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/icons/dollar.svg'),
                              const SizedBox(width: 6),
                              Text(
                                strategy.currencyPair[index],
                                style: const TextStyle(
                                  color: AppColors.floatButtonColor,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: List.generate(
                strategy.timeOfStr.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 3,
                    ),
                    child: Chip(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Color(0xFF78C589),
                        ),
                      ),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/schedule.svg',
                            height: 20,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            strategy.timeOfStr[index],
                            style: const TextStyle(
                              color: Color(0xFF78C589),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  strategy.author,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  strategy.time,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
