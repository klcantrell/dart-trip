import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';
import '../helpers/db_helper.dart' as DB;
import '../helpers/location_helper.dart' as LocationHelper;

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  Place findById(String id) => _items.firstWhere((place) => place.id == id);

  void addPlace(
      String pickedTitle, File pickedImage, Location selectedLocation) async {
    final address = await LocationHelper.getLocationAddress(
        latitude: selectedLocation.latitude,
        longitude: selectedLocation.longitude);
    final updatedLocation = Location(
        latitude: selectedLocation.latitude,
        longitude: selectedLocation.longitude,
        address: address);
    final newPlace = Place(
      id: DateTime.now().toIso8601String(),
      image: pickedImage,
      title: pickedTitle,
      location: updatedLocation,
    );

    _items.add(newPlace);

    notifyListeners();

    DB.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'location_latitude': newPlace.location.latitude,
      'location_longitude': newPlace.location.longitude,
      'location_address': newPlace.location.address,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final data = await DB.getData('user_places');
    _items = data
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: Location(
              latitude: item['location_latitude'],
              longitude: item['location_longitude'],
              address: item['location_address'],
            ),
          ),
        )
        .toList();
  }
}
