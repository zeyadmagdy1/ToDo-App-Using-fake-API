import 'package:flutter/material.dart';
import 'package:todos/Models/UserTask.dart';
import 'package:todos/Services/UserTaskServices.dart';

class UserTaskProvider extends ChangeNotifier{
  UserTask? myUser ;

  Future<void>getUserTask()async{
    myUser =await UserTaskServices.getTask();
    notifyListeners();
  }
  Future<void> addUserTask(String toDo)async{
    await UserTaskServices.addTask(toDo);
    myUser?.todos?.add(Todos(todo: toDo,completed: false,userId: 13));
    //myUser?.total +=1;
    notifyListeners();
  }
}