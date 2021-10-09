import 'dart:convert';

class TodoModel {
  int id;
  String todoTxt;
  bool done;
  String userId;

  TodoModel({this.id, this.todoTxt, this.done, this.userId});

  Map<String, dynamic> toMap() {
    return {'id': id, 'todoTxt': todoTxt, 'done': done, 'userId': userId};
  }

  static TodoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TodoModel(
        id: map['id'],
        todoTxt: map['todoTxt'],
        done: map['done'],
        userId: map['userId']);
  }

  String toJson() => json.encode(toMap());

  static TodoModel fromJson(String source) => fromMap(json.decode(source));
}
