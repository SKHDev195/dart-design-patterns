class Address {
  late String contactName;
  late String addressLine1;
  late String addressLine2;
  late String city;
  late String region;
  late String country;
  late String postalCode;
}

enum ShippingOptions {
  ups,
  fedex,
  purulator,
  amazon,
}

class Order {
  late ShippingOptions _shippingMethod;
  late Address _destination;
  late Address _origin;

  Order(
    ShippingOptions shippingMethod,
    Address destination,
    Address origin,
  ) {
    _shippingMethod = shippingMethod;
    _destination = destination;
    _origin = origin;
  }

  ShippingOptions get shippingMethod {
    return _shippingMethod;
  }

  Address get origin {
    return _origin;
  }

  Address get destination {
    return _destination;
  }
}

class ShippingCostCalculatorService {
  double calculateShippingCost(
    Order order,
  ) {
    ShippingCostContext context = switch (order.shippingMethod) {
      ShippingOptions.amazon => ShippingCostContext()
        ..setShippingCostsCalculator(
          ShippingCostsCalculatorAmazon(),
        ),
      ShippingOptions.fedex => ShippingCostContext()
        ..setShippingCostsCalculator(
          ShippingCostsCalculatorFedEx(),
        ),
      ShippingOptions.purulator => ShippingCostContext()
        ..setShippingCostsCalculator(
          ShippingCostsCalculatorPurulator(),
        ),
      ShippingOptions.ups => ShippingCostContext()
        ..setShippingCostsCalculator(
          ShippingCostsCalculatorUPS(),
        ),
    };
    return context.calculateCosts(
      order,
    );
  }
}

abstract interface class ShippingCostsCalculator {
  double calculateCosts(Order order);
}

final class ShippingCostsCalculatorPurulator
    implements ShippingCostsCalculator {
  double calculateCosts(Order order) => 5.00;
}

final class ShippingCostsCalculatorUPS implements ShippingCostsCalculator {
  double calculateCosts(Order order) => 7.25;
}

final class ShippingCostsCalculatorFedEx implements ShippingCostsCalculator {
  double calculateCosts(Order order) => 9.25;
}

final class ShippingCostsCalculatorAmazon implements ShippingCostsCalculator {
  double calculateCosts(Order order) => 3.25;
}

final class ShippingCostContext {
  late ShippingCostsCalculator _shippingCostsCalculator;
  ShippingCostsCalculator get shippingCostsCalculator =>
      _shippingCostsCalculator;

  void setShippingCostsCalculator(
      ShippingCostsCalculator shippingCostsCalculator) {
    _shippingCostsCalculator = shippingCostsCalculator;
  }

  double calculateCosts(Order order) {
    return _shippingCostsCalculator.calculateCosts(
      order,
    );
  }
}

void main() {
  Address testOrigin = Address()
    ..addressLine1 = 'Cyprus, Limassol'
    ..contactName = 'Jake';
  Address testDestination = Address()
    ..addressLine1 = 'UK, London'
    ..contactName = 'John';
  Order orderFirst = Order(
    ShippingOptions.amazon,
    testDestination,
    testOrigin,
  );
  Order orderSecond = Order(
    ShippingOptions.purulator,
    testDestination,
    testOrigin,
  );
  ShippingCostCalculatorService shippingCostCalculatorService =
      ShippingCostCalculatorService();

  print(
    shippingCostCalculatorService.calculateShippingCost(
      orderFirst,
    ),
  );

  print(
    shippingCostCalculatorService.calculateShippingCost(
      orderSecond,
    ),
  );
}
