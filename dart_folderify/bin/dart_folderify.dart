import 'dart:io';
import 'package:dart_folderify/dart_folderify.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) {
  final dateFormat = DateFormat(DateFormat.YEAR);
  final currentDirectory = getCurrentDirectory();

  final files = getContentsOfDirectory(currentDirectory);
  for (final file in files) {
    if (path.basename(Platform.script.path) == path.basename(file.path)) {
      continue;
    }

    final date = dateFormat.format(getCreationTimeForFile(file));
    final pathToCreate = Directory(path.join(currentDirectory.path, date));
    if (!directoryExists(pathToCreate)) {
      print('${pathToCreate.path} does not exist');
      print('Creating directory for $date');
      pathToCreate.createSync(recursive: false);
    }

    print('Moving ${file.path} to ${pathToCreate.path}');
    file.renameSync(path.join(pathToCreate.path, path.basename(file.path)));
  }
}
