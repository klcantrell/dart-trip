import 'dart:io';
import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';

void main(List<String> arguments) async {
  var shouldInsert = false;
  var shouldIndex = false;

  if (shouldInsert) {
    print(await insertDinos());
  } else {
    print(await readDinos());
  }

  if (shouldIndex) {
    print(await indexDinos());
  }

  exit(0);
}

Future<String> insertDinos() async {
  try {
    var db = Db('mongodb://localhost:27017/things');
    await db.open();

    var dinosCollection = db.collection('dinos');
    await dinosCollection.insertAll([
      {
        'name': 'Stegosaurus',
        'carnivore': false,
      },
      {
        'name': 'Diplodocus',
        'carnivore': false,
      },
    ]);

    return Future.value('Done writing dinos!');
  } on Exception {
    return Future.error('Something went wrong while reading dinos');
  }
}

Future<String> readDinos() async {
  try {
    var db = Db('mongodb://localhost:27017/things');
    await db.open();

    var dinosCollection = db.collection('dinos');

    var dinos = await dinosCollection.find().toList();
    dinos.forEach((dino) {
      print('{ Dino: \"${dino['name']}\", Carnivore: ${dino['carnivore']} }');
    });
    return Future.value('');
  } on Exception {
    return Future.error('Something went wrong while reading dinos');
  }
}

Future<String> indexDinos() async {
  try {
    var db = Db('mongodb://localhost:27017/things');
    await db.open();

    await db.ensureIndex('dinos', key: 'name', unique: true, dropDups: true);

    return Future.value('Done creating index!');
  } on Exception {
    return Future.error('There was a problem indexing dinos');
  }
}
