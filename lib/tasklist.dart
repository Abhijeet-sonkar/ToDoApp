import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'task.dart';

class TaskList extends StatelessWidget {
  final List<Task> task;
  final Function deleteTx;

  TaskList(this.task, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return task.isEmpty
        ?    Center(
      
              child:
                Text(
                  'No task  added yet!',
                 style: GoogleFonts.homemadeApple(color: Colors.white,fontSize: 20),
                ),
               
                
              
            )
        
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                              child: Card(
                  color: Colors.blue[100],
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('${index+1}',style: TextStyle(color:Colors.white),),
                        ),
                      ),
                    ),
                    title: Text(
                      task[index].taskNAme,
                   
                  
                    ),
                    subtitle: Text(
                      'Due date: ${DateFormat.yMMMd().format(task[index].date)}'
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () => deleteTx(task[index].id),
                    ),
                  ),
                ),
              );
            },
            itemCount: task.length,
          );
  }
}
