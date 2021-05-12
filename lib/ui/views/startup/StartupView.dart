import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'StartupViewModel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) => model.handleStarupLogic(),
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/mymarket.jpg'),
                ),
                SizedBox(
                  height: 40,
                ),
                CircularProgressIndicator()
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
