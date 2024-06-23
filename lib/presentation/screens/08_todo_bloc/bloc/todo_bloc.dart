import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lbloc/presentation/screens/08_todo_bloc/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todos: _initialTodos)) {
    on<AddTodo>((event, emit) {
      final todos = List<Todo>.from(state.todos)..add(event.todo);
      emit(TodoState(todos: todos));
    });

    on<ToggleTodo>((event, emit) {
      final todos = state.todos.map((todo) {
        if (todo.id == event.id) {
          return todo.copyWith(completed: !todo.completed);
        }
        return todo;
      }).toList();

      emit(TodoState(todos: todos));
    });

    on<DeleteTodo>((event, emit) {
      final todos = state.todos.where((todo) => todo.id != event.id).toList();
      emit(TodoState(todos: todos));
    });
  }

  static final List<Todo> _initialTodos = [
    const Todo(
      id: '1',
      task: 'Tarea de ejemplo 1',
      completed: false,
    ),
    const Todo(
      id: '2',
      task: 'Tarea de ejemplo 2',
      completed: true,
    ),
    const Todo(
      id: '3',
      task: 'Tarea de ejemplo 3',
      completed: false,
    ),
  ];
}
