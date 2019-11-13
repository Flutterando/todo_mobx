import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:todo_mobx/app/modules/home/home_controller.dart';
import 'package:todo_mobx/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  HomeController home;

  setUp(() {
    home = HomeModule.to.bloc<HomeController>();
  });

  group('HomeController Test', () {
    test("First Test", () {
      expect(home, isInstanceOf<HomeController>());
    });

    test("Set Value", () {
      expect(home.value, equals(0));
      home.increment();
      expect(home.value, equals(1));
    });
  });
}
