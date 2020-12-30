import 'package:flutter/material.dart';
import 'main.dart';

class addTodo extends StatefulWidget {
  @override
  _addTodoState createState() => _addTodoState();
}

class _addTodoState extends State<addTodo> {
  String title = '';
  String des = '';

  void addTodoToList() {
    Navigator.pushReplacementNamed(context, '/');
    Home().addTodo(title, des);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Text("Add a Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  onChanged: (text) {
                    title = text;
                    print(title);
                  },
                  decoration: InputDecoration(
                      hintText: 'Give a short title to your new todo.',
                      labelText: 'Todo:'),
                ),
                TextFormField(
                  onChanged: (text) {
                    des = text;
                    print(des);
                  },
                  decoration: InputDecoration(
                      hintText: 'Give a short description to your new todo.',
                      labelText: 'Description:'),
                ),
                RaisedButton(
                  child: Text("Add a todo"),
                  onPressed: addTodoToList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
