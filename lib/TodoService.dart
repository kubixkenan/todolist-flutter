import 'package:todoapp/IApiService.dart';
import 'package:todoapp/TodoModel.dart';

import 'ITodoService.dart';
import 'DIService.dart';

class TodoService extends ITodoService {
  @override
  Future<void> add(TodoModel model) async {
    await serviceLocator<IApiService>().post('api/Todo/Add', model.toJson());
  }

  @override
  Future<void> delete(int id) async {
    await serviceLocator<IApiService>()
        .delete('api/Todo/Delete?id=' + id.toString());
  }

  @override
  Future<List<dynamic>> list() async {
    dynamic todoList = await serviceLocator<IApiService>().get('api/Todo/List');
    return todoList;
  }

  @override
  Future<void> setStatus(int id, bool done) async {
    await serviceLocator<IApiService>().put('api/Todo/SetStatus?id=' +
        id.toString() +
        '&completed=' +
        done.toString());
  }
}
