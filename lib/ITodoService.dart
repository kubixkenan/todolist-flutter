import 'package:todoapp/TodoModel.dart';

abstract class ITodoService {
  Future<void> add(TodoModel model);
  Future<List<dynamic>> list();
  Future<void> setStatus(int id, bool done);
  Future<void> delete(int id);
}
