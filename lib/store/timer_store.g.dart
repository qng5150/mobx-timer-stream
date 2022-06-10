// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimeStore on _TimeStore, Store {
  late final _$counterStatusAtom =
      Atom(name: '_TimeStore.counterStatus', context: context);

  @override
  CounterStatus get counterStatus {
    _$counterStatusAtom.reportRead();
    return super.counterStatus;
  }

  @override
  set counterStatus(CounterStatus value) {
    _$counterStatusAtom.reportWrite(value, super.counterStatus, () {
      super.counterStatus = value;
    });
  }

  late final _$_TimeStoreActionController =
      ActionController(name: '_TimeStore', context: context);

  @override
  void start() {
    final _$actionInfo =
        _$_TimeStoreActionController.startAction(name: '_TimeStore.start');
    try {
      return super.start();
    } finally {
      _$_TimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo =
        _$_TimeStoreActionController.startAction(name: '_TimeStore.reset');
    try {
      return super.reset();
    } finally {
      _$_TimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counterStatus: ${counterStatus}
    ''';
  }
}
