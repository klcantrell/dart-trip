import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_with_freezed.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.some(T result) = Some<T>;
  const factory Result.none() = None<T>;
}

Result<int> readInput(List<String> args) {
  if (args.isEmpty || args.length > 1) {
    return None();
  }
  var firstArg = int.tryParse(args[0]);
  if (firstArg == null) {
    return None();
  }
  return Some(firstArg);
}

@freezed
abstract class Person with _$Person {
  factory Person(
      {String firstName,
      String lastName,
      int age,
      String favoriteFood,
      String zipcode}) = _Person;
}

extension PersonExtension on Person {
  bool matches(Person other) {
    return this ==
        copyWith(
            firstName: other.firstName ?? firstName,
            lastName: other.lastName ?? lastName,
            age: other.age ?? age,
            favoriteFood: other.favoriteFood ?? favoriteFood,
            zipcode: other.zipcode ?? zipcode);
  }
}

class UnfreezedPerson {
  final String firstName;
  final String lastName;
  final int age;
  final String favoriteFood;
  final String zipcode;

  UnfreezedPerson(
      {this.firstName,
      this.lastName,
      this.age,
      this.favoriteFood,
      this.zipcode});
}
