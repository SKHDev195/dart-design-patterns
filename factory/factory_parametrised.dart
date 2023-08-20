import 'dart:math';

abstract base class SpaceShip {
  Point position = Point(0, 0);
  List<int> size = [1, 1];
  String displayName = 'Default Ship';
  double speed = 1;
  String instanceName = 'Spaceship';
}

final class MilleniumFalcon extends SpaceShip {
  MilleniumFalcon() {
    position = Point(10, 10);
    size = [10, 15];
    displayName = 'Millenium Falcon';
    speed = 50;
  }
}

final class UNSCInfinity extends SpaceShip {
  UNSCInfinity() {
    position = Point(20, 20);
    size = [30, 40];
    displayName = 'UNSC Infinity';
    speed = 15;
  }
}

final class USSEnterprise extends SpaceShip {
  USSEnterprise() {
    position = Point(30, 30);
    size = [20, 20];
    displayName = 'USS Enterprise';
    speed = 20;
  }
}

final class Serenity extends SpaceShip {
  Serenity() {
    position = Point(40, 40);
    size = [15, 20];
    displayName = 'Serenity';
    speed = 45;
  }
}

enum ShipType {
  milleniumFalcon,
  uNSCInfinity,
  ussEnterprise,
  serenity,
}

sealed class SpaceShipFactory {
  SpaceShipFactory._();

  static SpaceShip createSpaceShip(ShipType shipType) {
    SpaceShip result = switch (shipType) {
      ShipType.milleniumFalcon => MilleniumFalcon(),
      ShipType.uNSCInfinity => UNSCInfinity(),
      ShipType.ussEnterprise => USSEnterprise(),
      ShipType.serenity => Serenity(),
    };
    return result;
  }
}

void main() {
  SpaceShip milleniumFalcon =
      SpaceShipFactory.createSpaceShip(ShipType.milleniumFalcon);
  print(milleniumFalcon.displayName);

  SpaceShip ussEnterprise =
      SpaceShipFactory.createSpaceShip(ShipType.ussEnterprise);
  print(ussEnterprise.displayName);
}
