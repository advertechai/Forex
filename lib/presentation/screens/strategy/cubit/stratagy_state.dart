part of 'stratagy_cubit.dart';

enum StratagyStatus {
  initial,
  loading,
  loaded,
  error,
}

class StratagyState extends Equatable {
  final StratagyStatus status;
  final List<Strategy> stratages;
  final List<Strategy> favorites;

  const StratagyState({
    this.status = StratagyStatus.initial,
    this.stratages = const [],
    this.favorites = const [],
  });

  @override
  List<Object> get props => [status, stratages, favorites];

  StratagyState copyWith({
    StratagyStatus? status,
    List<Strategy>? stratages,
  }) {
    return StratagyState(
      status: status ?? this.status,
      stratages: stratages ?? this.stratages,
      favorites: favorites ?? this.favorites,
    );
  }
}
