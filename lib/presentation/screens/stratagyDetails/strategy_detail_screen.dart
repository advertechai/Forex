import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_color.dart';
import '../../../data/models/strategy.dart';
import '../../widgets/custom_appbar.dart';
import '../strategy/cubit/stratagy_cubit.dart';
import 'pages/about.dart';
import 'pages/exemple.dart';
import 'pages/user_case.dart';

class StrategyDetailScreen extends StatefulWidget {
  static const String path = 'details';
  static const String name = 'details';

  final Strategy strategy;

  const StrategyDetailScreen({
    super.key,
    required this.strategy,
  });

  @override
  State<StrategyDetailScreen> createState() => _StrategyDetailScreenState();
}

class _StrategyDetailScreenState extends State<StrategyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BlocBuilder<StratagyCubit, StratagyState>(
          builder: (context, state) {
            switch (state.status) {
              case StratagyStatus.initial:
                return SizedBox();
              case StratagyStatus.loading:
                return const CircularProgressIndicator();
              case StratagyStatus.error:
                return const Center(
                    child: AlertDialog(
                  content: Text(
                      'Ошибка загрузки стратегий, проверьте подключение к сети Интернет'),
                ));
              case StratagyStatus.loaded:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      leftIconPath: 'assets/icons/leftarrow.svg',
                      rightIconPath: '',
                      title: 'Стратегии',
                      onLeftIconPressed: () {},
                      onRightIconPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.strategy.title,
                            style: const TextStyle(
                              color: AppColors.floatButtonColor,
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 17),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                widget.strategy.currencyPair.length,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/dollar.svg',
                                            color: AppColors.floatButtonColor,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            widget.strategy.currencyPair[index],
                                            style: const TextStyle(
                                              color: AppColors.floatButtonColor,
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
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
                          Row(
                            children: List.generate(
                              widget.strategy.timeOfStr.length,
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
                                        color: Color(0xFF78C589),
                                      ),
                                    ),
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/schedule.svg'),
                                        const SizedBox(width: 6),
                                        Text(
                                          widget.strategy.timeOfStr[index],
                                          style: const TextStyle(
                                            color: Color(0xFF78C589),
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
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
                          const TabBar(
                            indicatorColor: AppColors.floatButtonColor,
                            tabs: [
                              Tab(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'О стратегии',
                                    style: TextStyle(
                                      color: AppColors.floatButtonColor,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'User Case',
                                    style: TextStyle(
                                      color: AppColors.floatButtonColor,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Примеры',
                                    style: TextStyle(
                                      color: AppColors.floatButtonColor,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<StratagyCubit, StratagyState>(
                      builder: (context, state) {
                        return Expanded(
                          child: TabBarView(
                            children: [
                              About(
                                strategy: widget.strategy,
                              ),
                              UserCase(
                                strategy: widget.strategy,
                              ),
                              Exemple(
                                strategy: widget.strategy,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
