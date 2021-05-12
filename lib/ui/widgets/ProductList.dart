import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jijiapp/Models/Product.dart';

class ProductList extends StatelessWidget {
  final Product product;
  final Function openDetail;

  const ProductList({Key key, this.product, this.openDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.25,
        child: GestureDetector(
          onTap: () {
            openDetail();
          },
          child: Card(
            elevation: 5.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                product.imageUrl != null
                    ? Container(
                      height: size.height ,
                        width: size.width * 0.4,
                      child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: product.imageUrl,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                    )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_city),
                          SizedBox(
                            width: 10,
                          ),
                          product.region != null ? Text(product.region) : Text("Region"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "KSh${product.price} ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
