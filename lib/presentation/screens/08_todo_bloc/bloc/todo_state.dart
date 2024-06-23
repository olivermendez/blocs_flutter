part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState({this.todos = const []});

  @override
  List<Object> get props => [todos];
}

//final class TodoInitial extends TodoState {}
