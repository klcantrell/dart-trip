import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../env.dart';
import './product_provider.dart';
import '../models/http_exception.dart';

const FIREBASE_PRODUCTS_PATH = 'products';

class ProductsProvider with ChangeNotifier {
  final String authToken;
  final String userId;

  ProductsProvider(this.authToken, this.userId, this._items);

  List<ProductProvider> _items = [
    ProductProvider(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    ProductProvider(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    ProductProvider(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    ProductProvider(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  List<ProductProvider> get items {
    return [..._items];
  }

  List<ProductProvider> get favorites {
    return _items.where((product) => product.isFavorite).toList();
  }

  ProductProvider findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  Future<void> fetchAndSetProducts({bool filterByUser = false}) async {
    final filterString =
        filterByUser ? '&orderBy="creatorId"&equalTo="$userId"' : '';
    final productsUrl =
        '$FIREBASE_URL/$FIREBASE_PRODUCTS_PATH$FIREBASE_URL_EXTENSION?auth=$authToken$filterString';
    final productsResponse = await http.get(productsUrl);
    final productsData =
        json.decode(productsResponse.body) as Map<String, dynamic>;

    final favoritesUrl =
        '$FIREBASE_URL/$FIREBASE_FAVORITES_PATH/$userId/$FIREBASE_URL_EXTENSION?auth=$authToken';
    final favoritesResponse = await http.get(favoritesUrl);
    final favoritesData =
        json.decode(favoritesResponse.body) as Map<String, dynamic>;

    final List<ProductProvider> fetchedProducts = [];
    productsData?.forEach((productId, productData) {
      fetchedProducts.add(
        ProductProvider(
          id: productId,
          title: productData['title'],
          description: productData['description'],
          price: productData['price'],
          isFavorite: favoritesData != null
              ? (favoritesData[productId] ?? false)
              : false,
          imageUrl: productData['imageUrl'],
        ),
      );
    });
    _items = fetchedProducts;
    notifyListeners();
  }

  Future<void> addProduct(ProductProvider newProduct) async {
    var serializableProduct = {
      'title': newProduct.title,
      'description': newProduct.description,
      'imageUrl': newProduct.imageUrl,
      'price': newProduct.price,
      'creatorId': userId,
    };
    var response = await http.post(
      '$FIREBASE_URL/$FIREBASE_PRODUCTS_PATH$FIREBASE_URL_EXTENSION?auth=$authToken',
      body: json.encode(serializableProduct),
    );

    final product = ProductProvider(
      title: newProduct.title,
      description: newProduct.description,
      imageUrl: newProduct.imageUrl,
      price: newProduct.price,
      id: json.decode(response.body)['name'],
    );

    _items.add(product);
    notifyListeners();
  }

  Future<void> updateProduct(String id, ProductProvider updatedProduct) async {
    final existingProductIndex = _items.indexWhere((item) => item.id == id);
    final url =
        '$FIREBASE_URL/$FIREBASE_PRODUCTS_PATH$FIREBASE_URL_EXTENSION?auth=$authToken';
    if (existingProductIndex >= 0) {
      await http.patch(
        url,
        body: json.encode({
          'title': updatedProduct.title,
          'description': updatedProduct.description,
          'imageUrl': updatedProduct.imageUrl,
          'price': updatedProduct.price,
        }),
      );
      _items[existingProductIndex] = updatedProduct;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    final existingProductIndex = _items.indexWhere((item) => item.id == id);
    final url =
        '$FIREBASE_URL/$FIREBASE_PRODUCTS_PATH$FIREBASE_URL_EXTENSION?auth=$authToken';
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(
      url,
    );
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
