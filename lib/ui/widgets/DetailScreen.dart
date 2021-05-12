import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jijiapp/Models/Product.dart';
import 'package:jijiapp/ui/Shared/ui_helpers.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(children: [
            product.imageUrl != null
                ? CachedNetworkImage(
                    height: size.height * 0.35,
                    width: size.width,
                    fit: BoxFit.cover,
                    imageUrl: product.imageUrl,
                    placeholder: (context, url) => Container(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Container(),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Product Name : ${product.productName}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                  Text(
                    "Price : ${product.price}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.4,
                width: size.width,
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Condition Of Product",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'helvetica',
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          product.refurbished
                              ? Text(
                                  "Refurbished",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'helvetica',
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  "Not Refurbished",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'helvetica',
                                      fontWeight: FontWeight.w500),
                                ),
                          product.brandNew
                              ? Text(
                                  "Brand New",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'helvetica',
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  "Not Brand New",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'helvetica',
                                      fontWeight: FontWeight.w500),
                                ),
                          product.used
                              ? Text(
                                  "Used",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'helvetica',
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  "Not Used",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'helvetica',
                                      fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                      verticalSpaceMedium,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Negotiable",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'helvetica',
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          product.prodNegotiable
                              ? Text(
                                  "Negotiable",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'helvetica',
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  "Not Negotiable",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'helvetica',
                                      fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Region",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'helvetica',
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          product.region != null
                              ? Text(
                                  product.region,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'helvetica',
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  "No Region",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'helvetica',
                                      fontWeight: FontWeight.w500),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: size.height * 0.08,
                      width: size.width * 0.45,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Make An Offer"))),
                  Container(
                      height: size.height * 0.08,
                      width: size.width * 0.45,
                      child:
                          ElevatedButton(onPressed: () {}, child: Text("Call")))
                ],
              ),
            ),
            verticalSpaceMedium
          ]),
        ));
  }
}
