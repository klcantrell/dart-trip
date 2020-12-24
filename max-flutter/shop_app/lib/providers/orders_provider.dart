import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../providers/cart_provider.dart' show CartItem;
import '../env.dart';

const FIREBASE_ORDERS_PATH = 'orders';

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
  final String authToken;
  final String userId;

  OrdersProvider(this.authToken, this.userId, this._orders);

  List<OrderItem> get orders => [..._orders];

  Future<void> fetchAndSetOrders() async {
    final url =
        '$FIREBASE_URL/$FIREBASE_ORDERS_PATH$userId/$FIREBASE_URL_EXTENSION?auth=$authToken';
    final response = await http.get(url);

    final List<OrderItem> loadedOrders = [];
    final data = json.decode(response.body) as Map<String, dynamic>;
    data?.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderItem(
          id: orderId,
          amount: orderData['amount'],
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                ),
              )
              .toList(),
          dateTime: DateTime.parse(orderData['dateTime']),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

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
        '$FIREBASE_URL/$FIREBASE_ORDERS_PATH$userId/$FIREBASE_URL_EXTENSION?auth=$authToken',
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
