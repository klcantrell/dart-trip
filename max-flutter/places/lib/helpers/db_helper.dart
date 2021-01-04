import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

Future<void> insert(String table, Map<String, Object> data) async {
  final db = await _database();

  await db.insert(
    table,
    data,
    conflictAlgorithm: sql.ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, Object>>> getData(String table) async {
  final db = await _database();

  return db.query(table);
}

Future<sql.Database> _database() async {
  final dbPath = await sql.getDatabasesPath();
  return sql.openDatabase(path.join(dbPath, 'places.db'),
      onCreate: (db, version) => db.execute('''create table user_places(
            id text primary key,
            title text, 
            image text
        )'''), version: 1);
}
