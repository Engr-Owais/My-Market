import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jijiapp/ui/views/Products/ProductsViewModel.dart';
import 'package:jijiapp/ui/widgets/AppBar.dart';
import 'package:jijiapp/ui/widgets/ProductList.dart';
import 'package:stacked/stacked.dart';

class ProductsView extends StatelessWidget {
  final String catId;
  final String subCatId;

  ProductsView({this.catId, this.subCatId});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<ProductViewModel>.reactive(
      onModelReady: (model) => model.fetchProd(catId, subCatId),
      builder: (context, model, child) {
        return Scaffold(
          appBar: BaseAppBar(
            appBar: AppBar(),
            title: Text('Products'),
          ),
          body: Container(
            height: size.height,
            width: size.width,
            child: model.products != null
                ? ListView.builder(
                    itemCount: model.products.length,
                    itemBuilder: (_, index) => ProductList(
                          product: model.products[index],
                          openDetail: () => model.navigate(
                            model.products[index].catID,
                            model.products[index].subCatID,
                            model.products[index].productID,
                          ),
                        ))
                : Center(child: Text("No Products Added")),
          ),
        );
      },
      viewModelBuilder: () => ProductViewModel(),
    );
  }
}
