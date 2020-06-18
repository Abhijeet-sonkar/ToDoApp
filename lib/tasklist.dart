import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/event/todoEvent.dart';
import 'task.dart';
import 'bloc/TaskBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, List<Task>>(
        buildWhen: (List<Task> previous, List<Task> current) {
      return true;
    }, listenWhen: (List<Task> previous, List<Task> current) {
      if (current.length > previous.length) {
        return true;
      }

      return false;
    },
    
     listener: (BuildContext context, foodList) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Added!')),
      );
    },
     builder: (context, taskList) {
      return taskList.isEmpty
          ? Center(
              child: Text(
                'No task  added yet!',
                style: GoogleFonts.homemadeApple(
                    color: Colors.white, fontSize: 20),
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
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        taskList[index].taskNAme,
                      ),
                      subtitle: Text(
                          'Due date: ${DateFormat.yMMMd().format(taskList[index].date)}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => BlocProvider.of<TaskBloc>(context).add(
                      ToDoEvent.delete(taskList[index].id),
                      ),
                    ),
                  )
                  ),
                );
              },
              itemCount: taskList.length,
            );
    });
  }
}
