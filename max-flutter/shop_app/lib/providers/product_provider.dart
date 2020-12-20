import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../env.dart';
import '../models/http_exception.dart';

const FIREBASE_FAVORITES_PATH = 'userFavorites';

class ProductProvider with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  ProductProvider({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleIsFavorite(String authToken, String userId) async {
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        '$FIREBASE_URL/$FIREBASE_FAVORITES_PATH/$userId/$id$FIREBASE_URL_EXTENSION?auth=$authToken';

    final response = await http.put(
      url,
      body: json.encode(isFavorite),
    );

    if (response.statusCode >= 400) {
      isFavorite = !isFavorite;
      notifyListeners();
      throw HttpException('Could not update favorite status');
    }
  }
}
