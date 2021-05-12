import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jijiapp/ui/widgets/AppBar.dart';
import 'package:jijiapp/ui/widgets/DetailScreen.dart';
import 'package:stacked/stacked.dart';

import 'DetailViewModel.dart';

class ProductsDetailView extends StatelessWidget {
  final String catId;
  final String subCatId;
  final String prodId;

  ProductsDetailView({this.catId, this.subCatId, this.prodId});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<DetailViewModel>.reactive(
      onModelReady: (model) =>
          model.getProduct(catId: catId, prodId: prodId, subCatId: subCatId),
      builder: (context, model, child) {
        return Scaffold(
          appBar: model.products != null
              ? BaseAppBar(
                  appBar: AppBar(),
                  title: Text(model.products.productName),
                )
              : AppBar(),
          body: Container(
              height: size.height,
              width: size.width,
              child: model.products != null
                  ? ProductDetail(
                      product: model.products,
                    )
                  : Center(child: CircularProgressIndicator())),
        );
      },
      viewModelBuilder: () => DetailViewModel(),
    );
  }
}
