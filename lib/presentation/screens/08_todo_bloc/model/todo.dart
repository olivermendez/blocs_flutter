import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String task;
  final bool completed;

  const Todo({
    required this.id,
    required this.task,
    this.completed = false,
  });

  Todo copyWith({String? id, String? task, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object?> get props => [id, task, completed];
}
