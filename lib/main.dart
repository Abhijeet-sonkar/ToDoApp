import 'package:flutter/material.dart';
import 'package:todo/newtask.dart';
import 'package:todo/tasklist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bloc/TaskBloc.dart';
import 'bloc/TaskBlocDelegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
 // BlocSupervisor.delegate = TaskBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-Do',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
   
  void _addNewTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTAsk(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'TO-DO',
          style: GoogleFonts.monoton(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addNewTask(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.3,
                    width: 400,
                    child: Image.asset(
                      'image/todo.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                  padding: EdgeInsets.all(10),
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.5,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: TaskList(),),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        onPressed: () => _addNewTask(context),
      ),
    );
  }
 
}