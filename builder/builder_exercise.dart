base class User {
  User({
    required String firstName,
    required String lastName,
    int? age,
    String? phoneNumber,
    String? address,
    required String emailAddress,
  })  : _firstName = firstName,
        _lastName = lastName,
        _age = age,
        _phoneNumber = phoneNumber,
        _address = address,
        _emailAddress = emailAddress;
  final String _firstName;
  final String _lastName;
  int? _age;
  String? _phoneNumber;
  String? _address;
  final String _emailAddress;

  String get firstName => _firstName;
  String get lastName => _lastName;

  int get age {
    return (_age != null) ? _age! : 18;
  }

  String get phoneNumber {
    return (_phoneNumber != null) ? _phoneNumber! : '+999999999';
  }

  String get address {
    return (_address != null) ? _address! : 'London, England';
  }

  String get emailAddress => _emailAddress;

  @override
  String toString() =>
      'First name: $firstName\nLast name: $lastName\nAge: $age\nPhone number: $phoneNumber\nAddress: $address\nEmail: $emailAddress';
}

abstract interface class Singleton {
  Singleton._internal();
}

abstract interface class BuilderSingleton {
  BuilderSingleton._internal();
  late User user;

  void createUser(
      {required String firstName,
      required String lastName,
      required String emailAddress}) {
    user = User(
      firstName: firstName,
      lastName: lastName,
      emailAddress: emailAddress,
    );
  }

  User getUser() {
    return user;
  }

  void setUserAge(int? age);
  void setUserAddress(String? address);
  void setUserPhoneNumber(String? phoneNumber);
}

class UserBuilder extends BuilderSingleton {
  UserBuilder._internal() : super._internal();
  static final UserBuilder _instance = UserBuilder._internal();

  factory UserBuilder() => _instance;

  @override
  void setUserAddress(String? address) {
    user._address = address;
  }

  @override
  void setUserAge(int? age) {
    user._age = age;
  }

  @override
  void setUserPhoneNumber(String? phoneNumber) {
    user._phoneNumber = phoneNumber;
  }
}

final class UserDirector extends Singleton {
  static final UserDirector _instance = UserDirector._internal();

  UserDirector._internal() : super._internal();

  factory UserDirector() => _instance;

  late BuilderSingleton _builder;

  void setUserBuilder(BuilderSingleton builder) => _builder = builder;

  User getUser() => _builder.user;

  void createUser(
      {required String firstName,
      required String lastName,
      required String emailAddress,
      int? age,
      String? address,
      String? phoneNumber}) {
    _builder.createUser(
      firstName: firstName,
      lastName: lastName,
      emailAddress: emailAddress,
    );
    _builder.setUserAddress(address);
    _builder.setUserAge(age);
    _builder.setUserPhoneNumber(phoneNumber);
  }
}

void main() {
  UserBuilder userBuilder = UserBuilder();
  UserDirector userDirector = UserDirector();
  userDirector.setUserBuilder(userBuilder);

  userDirector.createUser(
      firstName: 'Jack',
      lastName: 'Dorsey',
      emailAddress: 'twitter@twitter.com');
  print(userBuilder.user.firstName);

  userDirector.createUser(
      firstName: 'Freddie',
      lastName: 'Mercury',
      emailAddress: 'queen@bestband.com',
      age: 100,
      address: '',
      phoneNumber: '+123');
  print(
    userBuilder.user.age.toString(),
  );
}
