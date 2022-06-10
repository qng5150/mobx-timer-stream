import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:timerstream/configureDependencies.dart';
import 'package:timerstream/store/timer_store.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Stream Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TimeStore timeStore = GetIt.I<TimeStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            final value = timeStore.counterStream?.value;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Counting... ${value ?? '---'}',
                  style: const TextStyle(fontSize: 50),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    timeStore.counterStatus == CounterStatus.stopped
                        ? timeStore.start()
                        : timeStore.reset();
                  },
                  child: Text(timeStore.counterStatus == CounterStatus.stopped
                      ? 'Start'
                      : 'Stop'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
