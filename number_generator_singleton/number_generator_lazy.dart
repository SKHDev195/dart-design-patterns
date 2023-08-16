class NumberGenerator {
  static NumberGenerator? _instance;
  static int _counter = 0;

  int get counter => _counter;

  NumberGenerator._internal() {
    _instance = this;
  }

  factory NumberGenerator() => _instance ??= NumberGenerator._internal();

  void incrementCounter() {
    _counter++;
  }
}

void main() {
  NumberGenerator generator = NumberGenerator();
  print(generator.counter);
  generator.incrementCounter();
  print(generator.counter);

  NumberGenerator anotherGenerator = NumberGenerator();
  print(anotherGenerator.counter);
  anotherGenerator.incrementCounter();
  print(anotherGenerator.counter);
}
