import 'package:flutter/material.dart';
import 'package:todo_app/addTodo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/addTodo': (context) => addTodo(),
      },
      title: 'Flutter Demo',
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  void addTodo(String title, String des) {
    _HomeState.todos.add({'title': title, 'des': des});
    print("pased title");
    print(title);
    _HomeState().AddTodos();
  }
}

class _HomeState extends State<Home> {
  static final List todos = new List();

  void AddTodos() {
    //setState(() {
    //todos.add("new todo");
    //print(todos.length);
    print(todos);
    // });
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Todo App Home Page"),
        backgroundColor: Colors.grey[600],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/addTodo');
        },
        backgroundColor: Colors.grey[600],
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final item = todos[index];

            return ListTile(
              onTap: () {
                deleteTodo(index);
              },
              title: Text(item['title'].toString()),
              subtitle: Text(item['des'].toString()),
            );
          }),
    );
  }
}
