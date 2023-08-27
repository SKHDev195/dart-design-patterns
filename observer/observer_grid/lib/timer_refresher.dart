import 'dart:async';

import 'random_list_generator.dart';

final class TimerRefresher {
  late final Timer _timer;
  late List<int> _randomNumbers;

  final StreamController<List<int>> _numbersController =
      StreamController<List<int>>.broadcast();
  StreamSink<List<int>> get numbersSink => _numbersController.sink;
  Stream<List<int>> get numbersStream => _numbersController.stream;

  TimerRefresher() {
    _timer = Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (timer) {
        setRandomNumbers();
        numbersSink.add(
          _randomNumbers,
        );
      },
    );
  }

  void setRandomNumbers() {
    _randomNumbers = RandomListGenerator.generateRandomNumbersList();
  }

  dispose() {
    _numbersController.close();
  }
}
