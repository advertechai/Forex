import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import '../../../../data/models/glossary.dart';

part 'glossary_state.dart';

class GlossaryCubit extends Cubit<GlossaryState> {
  GlossaryCubit() : super(const GlossaryState()) {
    _init();
  }

  Future<void> _init() async {
    final jsonString = await rootBundle.loadString('assets/glossary.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    List<GlossaryTerm> terms = [];
    jsonMap.forEach((key, value) {
      (value as Map<String, dynamic>).forEach((term, definition) {
        terms.add(GlossaryTerm(term: term, definition: definition));
      });
    });

    emit(state.copyWith(glossaryTerms: terms));
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }
}
