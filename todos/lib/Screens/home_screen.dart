import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/Providers/UserTaskProvider.dart';
import 'package:todos/Widgets/CustomTextField.dart';
class HomeScreen extends StatelessWidget {
  var numbersOfTasks;
  var toDoDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var myUserProvider =Provider.of<UserTaskProvider>(context);
    return Scaffold(
    backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading:Icon(Icons.task_alt_sharp,size: 40,color: Colors.white,),title: Text("ToDayTo",style: TextStyle(fontSize: 30,color: Colors.white),),),
     body: Card(
       elevation: 22,
       margin:EdgeInsets.all(22),
       child: Consumer<UserTaskProvider>(builder: (context, myUser, child) {

         if(myUser.myUser == null){
           myUser.getUserTask();
           return Center(child: CircularProgressIndicator(),);
         }
         var myTodos = myUser.myUser?.todos;
         numbersOfTasks=myTodos?.length??0;
         return ListView.builder(
           itemCount: myTodos?.length,
           itemBuilder: (context, index) {
           return Column(
             children: [
               Padding(padding: EdgeInsets.all(22),child: Text(myTodos?[index].todo??"",style: TextStyle(fontSize: 25),),),
             ],
           );
         },);
       },),
     ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        shape: CircleBorder(),
        child: Icon(Icons.add,color: Colors.white,size: 30,),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) {
            return Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      Text("Add New Task",style: TextStyle(fontSize: 30,color: Colors.black),),
                      Customtextfield(controllerr:toDoDescription,txt: "Add Task Description",),
                      MaterialButton(onPressed: (){
                          myUserProvider.addUserTask(toDoDescription.text);
                          Navigator.pop(context);
                      },
                          color: Colors.red,
                          child: Text("Add",style: TextStyle(fontSize: 30),))
                  ],
                ),
              ),
            );
          },);
      },),
    );
  }
}