import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
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
            imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            backgroundColor: Colors.black87,
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
