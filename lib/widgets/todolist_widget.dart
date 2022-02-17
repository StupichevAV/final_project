import 'package:flutter/material.dart';
import '../model/todo.dart';

class UserTodosWidget extends StatefulWidget {
  const UserTodosWidget({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  _UserTodosWidgetState createState() => _UserTodosWidgetState();
}

class _UserTodosWidgetState extends State<UserTodosWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Задачи"),
      ),
      body: FutureBuilder<List<Todo>>(
          future: fetchTodosByUserId(widget.userId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Произошла ошибка!'),
              );
            } else if (snapshot.hasData) {
              return TodoList(todos: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: widget.todos.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoListItem(
          todo: widget.todos[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 1,
      ),
    );
  }
}

class TodoListItem extends StatefulWidget {
  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  _TodoListItemState createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.todo.title),
      value: widget.todo.completed,
      onChanged: (newValue) {
        setState(() {
          widget.todo.completed = newValue!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
