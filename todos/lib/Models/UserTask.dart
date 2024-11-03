import 'dart:convert';
UserTask userTaskFromJson(String str) => UserTask.fromJson(json.decode(str));
String userTaskToJson(UserTask data) => json.encode(data.toJson());
class UserTask {
  UserTask({
      this.todos, 
      this.total, 
      this.skip, 
      this.limit,});

  UserTask.fromJson(dynamic json) {
    if (json['todos'] != null) {
      todos = [];
      json['todos'].forEach((v) {
        todos?.add(Todos.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<Todos>? todos;
  int? total;
  int? skip;
  int? limit;
UserTask copyWith({  List<Todos>? todos,
  int? total,
  int? skip,
  int? limit,
}) => UserTask(  todos: todos ?? this.todos,
  total: total ?? this.total,
  skip: skip ?? this.skip,
  limit: limit ?? this.limit,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (todos != null) {
      map['todos'] = todos?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}

Todos todosFromJson(String str) => Todos.fromJson(json.decode(str));
String todosToJson(Todos data) => json.encode(data.toJson());
class Todos {
  Todos({
      this.id, 
      this.todo, 
      this.completed, 
      this.userId,});

  Todos.fromJson(dynamic json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }
  int? id;
  String? todo;
  bool? completed;
  int? userId;
Todos copyWith({  int? id,
  String? todo,
  bool? completed,
  int? userId,
}) => Todos(  id: id ?? this.id,
  todo: todo ?? this.todo,
  completed: completed ?? this.completed,
  userId: userId ?? this.userId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['todo'] = todo;
    map['completed'] = completed;
    map['userId'] = userId;
    return map;
  }

}