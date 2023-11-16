// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'glossary_cubit.dart';

class GlossaryState extends Equatable {
  final List<GlossaryTerm> glossaryTerms;
  final String searchQuery;

  const GlossaryState({
    this.glossaryTerms = const [],
    this.searchQuery = '',
  });

  @override
  List<Object> get props => [glossaryTerms, searchQuery];

  GlossaryState copyWith({
    List<GlossaryTerm>? glossaryTerms,
    String? searchQuery,
  }) {
    return GlossaryState(
      glossaryTerms: glossaryTerms ?? this.glossaryTerms,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  List<GlossaryTerm> get filteredTerms {
    if (searchQuery.isEmpty) {
      return glossaryTerms;
    } else {
      return glossaryTerms
          .where((term) =>
              term.term.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }
}
