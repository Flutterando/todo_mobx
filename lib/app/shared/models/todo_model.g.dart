// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoModel on _TodoModel, Store {
  final _$checkAtom = Atom(name: '_TodoModel.check');

  @override
  bool get check {
    _$checkAtom.context.enforceReadPolicy(_$checkAtom);
    _$checkAtom.reportObserved();
    return super.check;
  }

  @override
  set check(bool value) {
    _$checkAtom.context.conditionallyRunInAction(() {
      super.check = value;
      _$checkAtom.reportChanged();
    }, _$checkAtom, name: '${_$checkAtom.name}_set');
  }
}
