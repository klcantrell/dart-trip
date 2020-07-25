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
