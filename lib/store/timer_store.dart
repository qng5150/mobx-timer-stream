import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'timer_store.g.dart';

@Singleton()
class TimeStore = _TimeStore with _$TimeStore;

abstract class _TimeStore with Store {
  _TimeStore() {
    _streamController = StreamController<int>.broadcast();
  }

  late final StreamController<int> _streamController;
  ObservableStream<int>? counterStream;

  @observable
  CounterStatus counterStatus = CounterStatus.stopped;
  Timer? _timer;

  @action
  void start() {
    int counter = 0;

    _timer = Timer.periodic(
        const Duration(seconds: 1), (_) => _streamController.add(counter++));
    counterStream = ObservableStream(_streamController.stream);
    counterStatus = CounterStatus.started;
  }

  @action
  void reset() {
    _timer?.cancel();
    counterStatus = CounterStatus.stopped;
  }

  void dispose() async {
    await _streamController.close();
  }
}

enum CounterStatus { started, stopped }
