import 'package:dio/dio.dart';
import 'package:todos/Models/UserTask.dart';

class UserTaskServices{
  static Dio dio = Dio();
  static const url ="https://dummyjson.com/todos/user/13";
  static Future<UserTask> getTask()async{
    final response = await dio.get(url);
    return UserTask.fromJson(response.data);
  }
  static Future<void> addTask(String toDo)async{
    final map = <String, dynamic>{};
    map['todo'] = toDo;
    map['completed'] = false;
    map['userId'] = 13;
    dio.post(url,data: map);
  }
}