import 'package:mobx/mobx.dart';
import 'package:todo_mobx/app/shared/models/todo_model.dart';
import 'package:todo_mobx/app/shared/services/local_storage_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final LocalStorageService service;
  _HomeBase(this.service) {
    _init();
  }

  _init() async {
    final allList = await service.getAll();
    list.addAll(allList);
  }

  @action
  add(TodoModel model) async {
    model = await service.add(model);
    list.add(model);
  }

  @observable
  ObservableList<TodoModel> list = ObservableList<TodoModel>();
}
