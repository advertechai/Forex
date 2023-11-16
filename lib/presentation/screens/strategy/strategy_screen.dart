import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/strategy_card.dart';
import '../stratagyDetails/strategy_detail_screen.dart';
import 'cubit/stratagy_cubit.dart';

class StrategyScreen extends StatefulWidget {
  static const String path = '/strategy';
  static const String name = 'StrategyScreen';

  const StrategyScreen({super.key});

  @override
  State<StrategyScreen> createState() => _StrategyScreenState();
}

class _StrategyScreenState extends State<StrategyScreen> {
  final CollectionReference strategies =
      FirebaseFirestore.instance.collection('strategy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                children: [
                  CustomAppBar(
                    leftIconPath: '',
                    rightIconPath: '',
                    title: 'Стратегии',
                    onLeftIconPressed: () {},
                    onRightIconPressed: () {},
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.stratages.length,
                      itemBuilder: (context, index) {
                        return StrategyCard(
                          strategy: state.stratages[index],
                          onTap: () {
                            context.goNamed(
                              StrategyDetailScreen.name,
                              extra: state.stratages[index],
                            );
                          },
                          onFavoriteTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
