import 'dart:io';

Directory getCurrentDirectory() => Directory.current;

bool directoryExists(Directory directory) =>
    FileSystemEntity.isDirectorySync(directory.path);

List<FileSystemEntity> getContentsOfDirectory(Directory directory) {
  return directory
      .listSync(recursive: false, followLinks: false)
      .where((file) => FileSystemEntity.isFileSync(file.path))
      .toList();
}

DateTime getCreationTimeForFile(FileSystemEntity file) {
  final dateAttributes = [
    FileStat.statSync(file.path).changed,
    FileStat.statSync(file.path).modified,
    FileStat.statSync(file.path).accessed
  ];
  dateAttributes.sort();
  return dateAttributes.first;
}
