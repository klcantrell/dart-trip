import 'package:play_with_freezed/play_with_freezed.dart';

void main(List<String> arguments) {
  readInput(arguments).when(
    some: (number) => print(number + 2),
    none: () => print('You need to pass in a single number as an argument'),
  );
}
