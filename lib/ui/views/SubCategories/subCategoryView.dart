import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jijiapp/ui/views/SubCategories/subCategoryViewModel.dart';
import 'package:jijiapp/ui/widgets/AppBar.dart';
import 'package:jijiapp/ui/widgets/SubCatList.dart';
import 'package:stacked/stacked.dart';

class SubCategoryView extends StatelessWidget {
  final String docId;

  SubCategoryView({this.docId});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubCatViewModel>.reactive(
      onModelReady: (model) => model.fetchsub(docId),
      builder: (context, model, child) {
        return Scaffold(
          appBar: BaseAppBar(
            appBar: AppBar(),
            title: Text('Sub Categories'),
          ),
          body: Container(
              child: model.sub != null
                  ? ListView.builder(
                      itemCount: model.sub.length,
                      itemBuilder: (_, index) {
                        return SubCatItem(
                          subCat: model.sub[index],
                          openProduc: () => model.navigate(
                              model.sub[index].catID,
                              model.sub[index].subCatID),
                        );
                      },
                    )
                  : Center(child: Text("No SubCategories"))),
        );
      },
      viewModelBuilder: () => SubCatViewModel(),
    );
  }
}
