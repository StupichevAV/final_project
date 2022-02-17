import 'package:final_project/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Todo {
  final int userId;
  final int id;
  final String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}

Future<List<Todo>> fetchTodosByUserId(int userId) async {
  final response = await http.get(
      Uri.parse(URL_GET_TODOS_BY_USER_ID + '$userId'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((todo) => Todo.fromJson(todo)).toList();
  } else {
    throw Exception('Не удалось загрузить информацию о пользователе');
  }
}
