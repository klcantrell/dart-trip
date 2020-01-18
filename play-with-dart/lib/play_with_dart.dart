import 'dart:io';
import 'package:path/path.dart' as p;

var trimConsoleInput = (String input) => input.trim();

var removeDot = (String rule) => rule.substring(1);

var extractMatch = (RegExpMatch match) => match.group(0);

var typeDefOfRule = (String ruleName) => 'export const ${ruleName}: string;\n';

var createTypeDefFile = (content, typeDef) => '${content}${typeDef}';

var isCssFile = (FileSystemEvent e) => e.path.endsWith('.css');

void handleChangedCss(FileSystemEvent e) {
  var modifyEvent = e as FileSystemModifyEvent;
  if (modifyEvent.contentChanged) {
    var cssFile = File(modifyEvent.path);
    var cssFilename = p.basename(cssFile.path);
    var typeDefFileContent = processCss(cssFile.readAsStringSync());

    var typeDefFile = File('${p.join(cssFile.parent.path, cssFilename)}.d.ts');
    typeDefFile.writeAsStringSync(typeDefFileContent);
    print('Saved TS type def for ${cssFilename}');
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

void printOpeningInstructions() {
  stdout.writeln('Edit a CSS file in this directory or subdirectories...');
  stdout.writeln('TypeScript type defs shall be generated');
  stdout.writeln();
  stdout.writeln('Enter quit() to exit');
  stdout.writeln();
}
