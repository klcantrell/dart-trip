import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../providers/cart_provider.dart' show CartItem;
import '../env.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.products,
      @required this.dateTime});
}

class OrdersProvider with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders => [..._orders];

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    var now = DateTime.now();
    var serializableOrder = {
      'amount': total,
      'products': cartProducts
          .map(
            (p) => {
              'id': p.id,
              'title': p.title,
              'quantity': p.quantity,
              'price': p.price,
            },
          )
          .toList(),
      'dateTime': now.toIso8601String(),
    };
    var response = await http.post(
        '$FIREBASE_URL/$FIREBASE_ORDERS_PATH$FIREBASE_URL_EXTENSION',
        body: json.encode(serializableOrder));

    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        products: cartProducts,
        dateTime: now,
      ),
    );
    notifyListeners();
  }
}
