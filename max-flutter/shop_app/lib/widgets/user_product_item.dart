import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/http_exception.dart';

import '../providers/products_provider.dart';
import '../screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;

  UserProductItem(
      {@required this.title, @required this.imageUrl, @required this.id});

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);

    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(EditProductScreen.routeName, arguments: id);
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  try {
                    await Provider.of<ProductsProvider>(context, listen: false)
                        .deleteProduct(id);
                  } on HttpException catch (error) {
                    scaffold.showSnackBar(
                      SnackBar(
                        content: Text('Failed to delete item: $error'),
                      ),
                    );
                  }
                },
                color: Theme.of(context).errorColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
