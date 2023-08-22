// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class LegacyRectangle {
  LegacyRectangle({
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });
  final double x;
  final double y;
  final double w;
  final double h;

  double get area => w * h;

  void getRectangle() => this;
}

class Rectangle {
  Rectangle({
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
  });
  final double x1;
  final double y1;
  final double x2;
  final double y2;

  double get width => (x1 - x2).abs();
  double get height => (y1 - y2).abs();
  double get area => width * height;

  void getRectangle() => this;
}

abstract interface class IRectangleAdapter {
  Rectangle getRectangle();
}

class RectangleAdapter implements IRectangleAdapter {
  RectangleAdapter({
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });
  final double x;
  final double y;
  final double w;
  final double h;

  late Rectangle _reader;

  @override
  Rectangle getRectangle() {
    _reader = Rectangle(
      x1: this.x,
      y1: this.y,
      x2: this.x + this.w,
      y2: this.y - this.h,
    );
    return _reader;
  }
}

void main() {
  IRectangleAdapter rectangleAdapter = RectangleAdapter(
    x: 20,
    y: -5,
    w: 15,
    h: 15,
  );
  print(rectangleAdapter.getRectangle().area);
}
