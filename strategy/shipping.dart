/// Shipping address
///
class Address {
  late String contactName;
  late String addressLine1;
  late String addressLine2;
  late String city;
  late String region;
  late String country;
  late String postalCode;
}

/// Shippers you can choose from
///
enum ShippingOptions { ups, fedex, purulator }

/// Order entity
///
class Order {
  late ShippingOptions _shippingMethod;
  late Address _destination;
  late Address _origin;

  Order(ShippingOptions shippingMethod, Address destination, Address origin) {
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

/// Shipping cost calculation service
///
class ShippingCostCalculatorService {
  double calculateShippingCost(Order order) {
    switch (order.shippingMethod) {
      case ShippingOptions.fedex:
        return calculateForFedEx(order);

      case ShippingOptions.ups:
        return calculateForUPS(order);

      case ShippingOptions.purulator:
        return calculateForPurulator(order);

      default:
        throw Exception("Unknown carrier");
    }
  }

  ///////////////////////////////////////////////////////////////
  /// Terrible coding practice
  ///
  /// Should be handled through a strategy pattern
  double calculateForPurulator(Order order) {
    return 5.00;
  }

  double calculateForUPS(Order order) {
    return 7.25;
  }

  double calculateForFedEx(Order order) {
    return 9.25;
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
