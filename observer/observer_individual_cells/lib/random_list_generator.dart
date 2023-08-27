import 'dart:math';

sealed class RandomListGenerator {
  static final Random _rand = Random();

  static List<int> generateRandomNumbersList() {
    List<int> result = <int>[];
    for (int i = 0; i < 65; i++) {
      result.add(
        _rand.nextInt(11),
      );
    }

    return result;
  }
}
