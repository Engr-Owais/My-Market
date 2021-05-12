import 'package:flutter/material.dart';

import 'package:jijiapp/ui/Shared/ui_helpers.dart';
import 'package:jijiapp/ui/widgets/BusyButton.dart';
import 'package:jijiapp/ui/widgets/inputFiled.dart';
import 'package:stacked/stacked.dart';
import 'AddRegionModel.dart';

class AddRegion extends StatelessWidget {
  final titleController = TextEditingController();

  AddRegion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddRegionViewModel>.reactive(
        viewModelBuilder: () => AddRegionViewModel(),
        onModelReady: (model) {
          // update the text in the controller
          titleController.text = '';
          model.user;
        },
        builder: (context, model, child) => Scaffold(
                body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  verticalSpace(40),
                  if (model.user != null) ...[
                    Text(
                      'Add Regions',
                      style: TextStyle(fontSize: 26),
                    ),
                    verticalSpaceMedium,
                    InputField(
                      placeholder: 'Region Name',
                      controller: titleController,
                    ),
                    verticalSpaceMedium,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BusyButton(
                          title: 'Add Region',
                          busy: model.isBusy,
                          onPressed: () {
                            if (!model.isBusy) {
                              model.addRegion(
                                name: titleController.text,
                              );
                            }
                          },
                        )
                      ],
                    )
                  ]
                ],
              ),
            )));
  }
}
