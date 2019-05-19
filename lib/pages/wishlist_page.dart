//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:emania/models/product.dart';
import 'package:emania/pages/main_page.dart';
import 'package:emania/import.dart';

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        centerTitle: true,
      ),
      body: MyApp.wishList.products.length != 0
          ? ListView.builder(
              itemBuilder: (ctx, index) => Container(
                    child: WishListListItem(MyApp.wishList.products[index]),
                  ),
              itemCount: MyApp.wishList.products.length,
            )
          : Center(
              child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black26,
                      size: 32.0,
                    ),
                  ),
                  Text(
                    "To add an item to your wishlist, \nclick the heart icon",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black26),
                  ),
                ],
              ),
            )),
    );
  }
}

class WishListListItem extends StatelessWidget {
  final Product product;
  WishListListItem(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(product))),
      child: Row(
        children: <Widget>[
          Image.network(
            product.imageUrl,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
