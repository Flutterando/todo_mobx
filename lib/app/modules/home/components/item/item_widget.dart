import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_mobx/app/shared/models/todo_model.dart';

class ItemWidget extends StatelessWidget {
  final TodoModel model;

  const ItemWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(model.title),
          trailing: Checkbox(
            value: model.check,
            onChanged: (bool value) {
              model.check = value;
            },
          ),
        );
      },
    );
  }
}
