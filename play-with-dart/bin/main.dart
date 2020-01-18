import 'dart:io';
import 'dart:convert';

import 'package:play_with_dart/play_with_dart.dart';

void main(List<String> arguments) {
  printOpeningInstructions();

  Directory('.')
      .watch(events: FileSystemEvent.modify, recursive: true)
      .where(isCssFile)
      .listen(handleChangedCss);

  stdin.transform(utf8.decoder).map(trimConsoleInput).listen(handleOnCommand);
}
