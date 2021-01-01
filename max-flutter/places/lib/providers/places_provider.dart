import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toIso8601String(),
      image: pickedImage,
      title: pickedTitle,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
