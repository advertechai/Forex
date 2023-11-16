class GlossaryTerm {
  final String term;
  final String definition;

  GlossaryTerm({required this.term, required this.definition});

  factory GlossaryTerm.fromJson(Map<String, dynamic> json) {
    return GlossaryTerm(
      term: json.keys.first,
      definition: json.values.first,
    );
  }
}
