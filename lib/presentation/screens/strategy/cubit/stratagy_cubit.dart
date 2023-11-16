import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:forex/data/models/strategy.dart';

part 'stratagy_state.dart';

class StratagyCubit extends Cubit<StratagyState> {
  StratagyCubit() : super(const StratagyState()) {
    _init();
  }

  Future<void> _init() async {
    await _fetchStrategies();
  }

  void toggleFavorite(Strategy strategy) {
    final newFavorites = List<Strategy>.from(state.favorites);

    // Use a composite key of 'title' and 'author' to check uniqueness
    if (newFavorites
        .any((s) => s.title == strategy.title && s.author == strategy.author)) {
      newFavorites.removeWhere(
          (s) => s.title == strategy.title && s.author == strategy.author);
    } else {
      newFavorites.add(strategy);
    }
  }

  Future<void> _fetchStrategies() async {
    emit(state.copyWith(status: StratagyStatus.loading));

    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('strategy').get();

      final List<Strategy> strategies = snapshot.docs
          .map((doc) => Strategy.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      log('----------DATA LOADED----------\n ${strategies.toString()}');

      emit(state.copyWith(
        status: StratagyStatus.loaded,
        stratages: strategies,
      ));
    } catch (e) {
      log('_______________________________________________\n Твоя ошибка  ${e.toString()}');
      emit(state.copyWith(
        status: StratagyStatus.error,
      ));
    }
  }
}
