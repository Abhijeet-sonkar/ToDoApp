import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTAsk extends StatefulWidget {
  final Function addTx;

  NewTAsk(this.addTx);

  @override
  _NewTAskState createState() => _NewTAskState();
}

class _NewTAskState extends State<NewTAsk> {
  final _titleController = TextEditingController();
 
  DateTime _selectedDate;

  void _submitData() {
    
    final enteredTitle = _titleController.text;


    if (enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      _selectedDate,
    );
    print(enteredTitle);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2021),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Task Name'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
         
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    
                    child: Text(
                      'Add Due Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add New Task'),
            color: Colors.blue,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
