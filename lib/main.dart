import 'package:flutter/material.dart';
import 'package:todo/newtask.dart';
import 'package:todo/task.dart';
import 'package:todo/tasklist.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _userTask = [];
  void _newTask(String txName, DateTime chosenDate) {
    final newTx = Task(
      date: chosenDate,
      taskNAme: txName,
      id: DateTime.now().toString(),
    );

    setState(() {
      print(newTx.taskNAme);
      print(newTx.date);
      _userTask.add(newTx);
      print(_userTask);
    });
  }

  void _addNewTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTAsk(_newTask),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTask(String id) {
    setState(() {
      _userTask.removeWhere((tx) => tx.id == id);
    });
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
                  child: TaskList(_userTask, _deleteTask)),
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
