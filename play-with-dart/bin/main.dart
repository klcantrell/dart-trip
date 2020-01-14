import 'package:play_with_dart/play_with_dart.dart';

void main(List<String> arguments) {
  print(RegExp(r'\.\w+', multiLine: true)
      .allMatches(testInput)
      .map(extractMatch)
      .map(removeDot)
      .map(typeDefOfRule)
      .reduce(createTypeDefFile));
}
