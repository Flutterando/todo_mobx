import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_mobx/app/modules/home/home_module.dart';
import 'package:todo_mobx/app/shared/models/todo_model.dart';

import 'components/item/item_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Todo List"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeModule.to.bloc<HomeController>();

  _showDialog([TodoModel model]) {
    model = model ?? TodoModel();
    String titleCache = model.title;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(model.id != null ? "Editar" : "Novo"),
          content: TextFormField(
            initialValue: model.title,
            maxLines: 5,
            onChanged: (v) {
              model.title = v;
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                model.title = titleCache;
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Salvar"),
              onPressed: () {
                if (model.id != null) {
                  controller.update(model);
                } else {
                  controller.add(model);
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text("${controller.itemsTotal}",
                      style: Theme.of(context).textTheme.title)),
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "${controller.itemsTotalCheck}",
                style: Theme.of(context).textTheme.title,
              )),
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.remove_circle_outline,
            color: Colors.red,
          ),
          onPressed: () {
            controller.cleanAll();
          },
        ),
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (_, index) {
              TodoModel model = controller.list[index];
              return ItemWidget(
                model: model,
                onPressed: () {
                  _showDialog(model);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showDialog();
        },
      ),
    );
  }
}
