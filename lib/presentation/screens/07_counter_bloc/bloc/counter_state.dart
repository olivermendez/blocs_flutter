part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({required this.counter});

  @override
  List<Object> get props => [counter];
}

//final class CounterInitial extends CounterState {}
