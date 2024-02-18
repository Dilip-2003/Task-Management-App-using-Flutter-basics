import 'package:flutter/material.dart';
import 'package:taskmanagementapp/main.dart';


class UpdatedTask extends StatefulWidget {
   final Function(int,Task) updatedTask;
   final int index;
  const UpdatedTask({super.key, required this.updatedTask , required this.index});

  @override
  State<UpdatedTask> createState() => _UpdatedTaskState();
}

class _UpdatedTaskState extends State<UpdatedTask> {
    late String title;
    late String description;
    late String category;
    late DateTime dueDate;

  @override
  void initState() {
    super.initState();

    title = "";
    description = "";
    category = "";
    dueDate = DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      body:Padding(padding: const EdgeInsets.all(12.0),
      child:  SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            TextField(
              decoration: const InputDecoration(
                labelText: "Title",
              ),

              onChanged: (newTitle){
                setState(() {
                  title = newTitle;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: "Description",
              ),

              onChanged: (newDescription){
                setState(() {
                  description = newDescription;
                });
              },
            ),

            const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                onChanged: (newCategory) {
                  setState(() {
                    category = newCategory;
                  });
                },
              ),

              const SizedBox(height: 16.0),
              const Text('Due Date:'),
              const SizedBox(height: 8.0),

              InkWell(
                onTap: () {
                  showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                   firstDate: DateTime.now(), 
                   lastDate: DateTime(2200)).then((selectedDate) {
                    setState(() {
                      dueDate = selectedDate?? DateTime.now();
                    });
                   });
                },

               child: Row(
                  children: [
                   const Icon(Icons.calendar_today),
                    const SizedBox(width: 8.0),
                    Text(
                      '${dueDate.day}/${dueDate.month}/${dueDate.year}',
                    ),
                ],)
              ),

              const SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () {
                  // print(index);
                  Task newTask = Task(
                    title: title,
                    description: description,
                    category: category,
                    dueDate: dueDate,
                    // priority: priority,
                  );

                  widget.updatedTask(widget.index,newTask);
                  Navigator.pop(context);
                },
                child: const Text('Update Task'),
              ),
          ],
        ),
      ),
      ),
  );
  
  }
}