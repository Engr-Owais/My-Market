import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jijiapp/Models/category.dart';

class PostItem extends StatelessWidget {
  final Category category;
  final Function openSubCat;

  const PostItem({Key key, this.category, this.openSubCat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          openSubCat();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Hero(
                tag: category.imageUrl,
                child: category.imageUrl != null
                    ? CachedNetworkImage(
                        height: 75.0,
                          width: size.width,
                        imageUrl: category.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )

                    // If the image is null show nothing
                    : Container(),
              ),
              SizedBox(height: 7.0),
              Text(category.catName,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }
}
