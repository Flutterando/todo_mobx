import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_mobx/app/modules/home/home_module.dart';
import 'package:todo_mobx/app/shared/models/todo_model.dart';

import '../../home_controller.dart';

class ItemWidget extends StatelessWidget {
  final TodoModel model;
  final Function onPressed;

  const ItemWidget({Key key, this.model, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          onTap: onPressed,
          leading: IconButton(
            icon: Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
            onPressed: () {
              HomeModule.to.bloc<HomeController>().remove(model.id);
            },
          ),
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
