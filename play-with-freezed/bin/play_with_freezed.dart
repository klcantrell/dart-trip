import 'package:play_with_freezed/play_with_freezed.dart';

void main(List<String> arguments) {
  readInput(arguments).when(
    some: (number) => print(number + 2),
    none: () => print('You need to pass in a single number as an argument'),
  );

  var people = [
    Person(
      age: 31,
      firstName: 'Kal',
      lastName: 'Cantrell',
      zipcode: '46220',
      favoriteFood: 'spaghetti',
    ),
    Person(
      age: 31,
      firstName: 'Jane',
      lastName: 'Smith',
      zipcode: '46220',
      favoriteFood: 'spaghetti',
    ),
    Person(
      age: 31,
      firstName: 'Carla',
      lastName: 'Thomas',
      zipcode: '46220',
      favoriteFood: 'spam',
    ),
    Person(
      age: 32,
      firstName: 'Bob',
      lastName: 'Brown',
      zipcode: '46220',
      favoriteFood: 'spaghetti',
    ),
  ];

  people.forEach((person) {
    if (person.matches(Person(favoriteFood: 'spaghetti'))) {
      print(
          '${person.firstName} likes ${person.favoriteFood}, is ${person.age}, and lives in the ${person.zipcode} zipcode');
    }
  });

  var meUnfreezed = UnfreezedPerson(
      age: 31,
      firstName: 'Kal',
      lastName: 'Cantrell',
      zipcode: '46220',
      favoriteFood: 'spaghetti');
  print(meUnfreezed ==
      UnfreezedPerson(
          age: 31,
          firstName: 'Kal',
          lastName: 'Cantrell',
          zipcode: '46220',
          favoriteFood: 'spaghetti'));
}
