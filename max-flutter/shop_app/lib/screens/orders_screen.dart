import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders_provider.dart' show OrdersProvider;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static final routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: FutureBuilder(
        future: Provider.of<OrdersProvider>(context, listen: false)
            .fetchAndSetOrders(),
        builder: (ctx, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Consumer<OrdersProvider>(
              builder: (ctx, orderProvider, child) => ListView.builder(
                itemCount: orderProvider.orders.length,
                itemBuilder: (ctx, i) => OrderItem(
                  order: orderProvider.orders[i],
                ),
              ),
            );
          }
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
