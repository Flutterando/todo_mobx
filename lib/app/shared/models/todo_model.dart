import 'package:mobx/mobx.dart';

part 'todo_model.g.dart';

class TodoModel extends _TodoModel with _$TodoModel {
  TodoModel({int id, String title, bool check = false})
      : super(id: id, title: title, check: check);

  toJson() {
    return {"title": title, "check": check};
  }

  factory TodoModel.fromJson(Map json) {
    return TodoModel(
        id: json['id'], title: json['title'], check: json['check']);
  }
}

abstract class _TodoModel with Store {
  int id;
  String title;

  @observable
  bool check;

  _TodoModel({this.id, this.title, this.check = false});
}
