import 'package:flutter/material.dart';
import 'package:jijiapp/Models/subCat.dart';

class SubCatItem extends StatelessWidget {
  final SubCat subCat;
  final Function openProduc;

  const SubCatItem({Key key, this.subCat, this.openProduc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.1,
        width: size.width,
        child: GestureDetector(
          onTap: () => openProduc(),
          child: Card(
              elevation: 5.0,
              child: ListTile(
                title: Text(
                  subCat.subCatname,
                  style: TextStyle(fontSize: 15),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
              )),
        ),
      ),
    );
  }
}
