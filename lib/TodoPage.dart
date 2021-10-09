import 'package:flutter/material.dart';
import 'package:todoapp/ITodoService.dart';

import 'DIService.dart';
import 'TodoModel.dart';

class TodoView extends StatefulWidget {
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<TodoView> {
  TextEditingController _todoController = new TextEditingController();
  List<dynamic> todos = new List<dynamic>();

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  void getTodos() async {
    var list = await serviceLocator<ITodoService>().list();
    setState(() {
      todos = list;
    });
  }

  void add() async {
    TodoModel model = new TodoModel(
        id: 0,
        todoTxt: _todoController.text,
        done: false,
        userId: '00000000-0000-0000-0000-000000000000');
    await serviceLocator<ITodoService>().add(model);
    getTodos();
  }

  void setStatus(id, done) async {
    await serviceLocator<ITodoService>().setStatus(id, !done);
    getTodos();
  }

  void delete(id) async {
    await serviceLocator<ITodoService>().delete(id);
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 30),
          TextField(
              controller: _todoController,
              decoration: InputDecoration(hintText: "ToDo")),
          TextButton(onPressed: () => {add()}, child: Text('Add')),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  //padding: EdgeInsets.only(top: 10, left: 10),
                  scrollDirection: Axis.vertical,
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final dynamic todoItem = todos[index];
                    return Row(children: [
                      TextButton(
                          onPressed: () =>
                              {setStatus(todoItem['id'], todoItem['done'])},
                          child: Text(todoItem['done'] ? "Aç" : "Tamamla")),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(todoItem['todoTxt'],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                      TextButton(
                          onPressed: () => {delete(todoItem['id'])},
                          child: Text("Sil"))
                    ]);
                  }))
        ],
      ),
    );
  }
}
