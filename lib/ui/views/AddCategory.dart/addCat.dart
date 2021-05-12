import 'package:flutter/material.dart';
import 'package:jijiapp/ui/Shared/ui_helpers.dart';
import 'package:jijiapp/ui/widgets/BusyButton.dart';
import 'package:jijiapp/ui/widgets/inputFiled.dart';
import 'package:stacked/stacked.dart';

import 'addCatModel.dart';

class AddCategory extends StatelessWidget {
  final titleController = TextEditingController();

  AddCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCatViewModel>.reactive(
        viewModelBuilder: () => AddCatViewModel(),
        onModelReady: (model) => {},
        builder: (context, model, child) => Scaffold(
                body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    verticalSpace(40),
                    if (model.user != null) ...[
                      Text(
                        'Create Category',
                        style: TextStyle(fontSize: 26),
                      ),
                      verticalSpaceMedium,
                      InputField(
                        placeholder: 'Category Name',
                        controller: titleController,
                      ),
                      verticalSpaceMedium,
                      Text('Category Image'),
                      verticalSpaceSmall,
                      GestureDetector(
                        onTap: () => model.selectImage(),
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          child: model.selectedImage == null
                              ? Text(
                                  'Tap to add category image',
                                  style: TextStyle(color: Colors.grey[400]),
                                )
                              : Image.file(model.selectedImage),
                        ),
                      ),
                      verticalSpaceMedium,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BusyButton(
                            title: 'Add Category',
                            busy: model.isBusy,
                            onPressed: () {
                              if (!model.isBusy) {
                                model.addCat(
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
              ),
            )));
  }
}
