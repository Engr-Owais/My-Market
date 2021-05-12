import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jijiapp/ui/widgets/AppBar.dart';
import 'package:stacked/stacked.dart';

import 'SellViewModel.dart';

class SellView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<SellViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: BaseAppBar(
            appBar: AppBar(),
            title: Text("My Profile"),
          ),
          body: Container(
            height: size.height,
            width: size.width,
            child: Center(
              child: Text(
                "Sell Your Items",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => SellViewModel(),
    );
  }
}
