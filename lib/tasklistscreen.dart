import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskmanagementapp/addtask.dart';
import 'package:taskmanagementapp/main.dart';
import 'package:taskmanagementapp/updatedtask.dart';

class TaskListScreen extends StatefulWidget {
   const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];
  void _addTask(Task newtask){
    setState(() {
      tasks.add(newtask);
    });


  }

  void updateTask(int index , Task updatedTask){
    setState(() {
          tasks.removeAt(index);
    tasks.insert(index, updatedTask);
      
    });

  }

    void deleteTask(int index){
    setState(() {
      tasks.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    // print('build');
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Task Manager App')),
        backgroundColor: Colors.lightBlueAccent,
      ),


      backgroundColor: Colors.white,

       body:ListView.builder(
          itemBuilder: ( context, index) {
           final task = tasks[index];
            return  Card(
              clipBehavior: Clip.hardEdge,
              shadowColor: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 0.5,
                  bottom: 0.5,
                  left: 2,
                  right: 2
                ),
                child: Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*.70,
                  child:  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(task.title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                Text(task.category,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                Text('${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}'),
                              ],
                            ),
                          ),
                  
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(task.description),
                          ),  
                          
                      ],),
                ),
                       
                SizedBox(
                  width: MediaQuery.of(context).size.width*.26,
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){
                      deleteTask( index);
                      }, icon:const FaIcon(Icons.delete) ),
                       
                       
                      IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                   UpdatedTask(index:index , updatedTask: updateTask, ),
                        ));
                       
                       
                      }, icon: const FaIcon(Icons.edit)),
                    ],
                  ),
                       
                )
                ],),
              ),
            );
               
         },
         
         itemCount: tasks.length,
      
         ),
        


      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
               AddTask(addTask:_addTask),
        ));
      },
      child: const Icon(Icons.add),
      ),

  
    );
  }
}



