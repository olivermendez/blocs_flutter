import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lbloc/presentation/screens/08_todo_bloc/bloc/todo_bloc.dart';
import 'package:lbloc/presentation/screens/08_todo_bloc/model/todo.dart';
import 'package:uuid/uuid.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final todobloc = context.read<TodoBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Todo with bloc')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Add a new task',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final todo = Todo(
                      id: const Uuid().v4(),
                      task: controller.text,
                    );
                    todobloc.add(AddTodo(todo: todo));
                    controller.clear();
                    //context.read<TodoBloc>().add(AddTodo(todo));
                    //controller.clear();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];
                    return ListTile(
                      title: Text(
                        todo.task,
                        style: TextStyle(
                          decoration: todo.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      leading: Checkbox(
                        value: todo.completed,
                        onChanged: (_) {
                          todobloc.add(ToggleTodo(id: todo.id));
                          //context.read<TodoBloc>().add(ToggleTodo(todo.id));
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          todobloc.add(DeleteTodo(id: todo.id));
                          //context.read<TodoBloc>().add(DeleteTodo(todo.id));
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
