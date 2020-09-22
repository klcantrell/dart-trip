import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              blurRadius: 7,
              color: Colors.black38,
              offset: Offset(1, 2),
              spreadRadius: 2)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.network(
            productProvider.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(productProvider.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () async {
                await productProvider.toggleIsFavorite();
              },
              color: Theme.of(context).accentColor,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cartProvider.addItem(productProvider.id, productProvider.price,
                    productProvider.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added item to cart!'),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cartProvider.removeSingleItem(productProvider.id);
                      },
                    ),
                    duration: Duration(seconds: 4),
                  ),
                );
              },
              color: Theme.of(context).accentColor,
            ),
            backgroundColor: Colors.black87,
            title: Text(
              productProvider.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
