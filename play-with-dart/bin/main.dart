import 'dart:io';
import 'dart:convert';

import 'package:play_with_dart/play_with_dart.dart';

void handleOnChange(FileSystemEvent e) {
  var modifyEvent = e as FileSystemModifyEvent;
  if (modifyEvent.contentChanged) {
    var file = File(modifyEvent.path);
    var typeDefFileContent = processCss(file.readAsStringSync());
    print(typeDefFileContent);
  }
}

String processCss(String content) {
  return RegExp(r'\.\w+', multiLine: true)
      .allMatches(content)
      .map(extractMatch)
      .map(removeDot)
      .map(typeDefOfRule)
      .fold('', createTypeDefFile);
}

void handleOnCommand(String e) {
  if (e == 'quit()') {
    exit(0);
  }
}

void main(List<String> arguments) {
  stdout.writeln('Edit a CSS file in this directory or subdirectories...');
  stdout.writeln('TypeScript type defs shall be generated');
  stdout.writeln();
  stdout.writeln('Enter quit() to exit');
  stdout.writeln();

  Directory('.')
      .watch(events: FileSystemEvent.modify, recursive: true)
      .listen(handleOnChange);

  stdin.transform(utf8.decoder).map((s) => s.trim()).listen(handleOnCommand);
}
