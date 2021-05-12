import 'package:flutter/material.dart';
import 'package:jijiapp/Models/category.dart';
import 'package:jijiapp/ui/Shared/ui_helpers.dart';
import 'package:jijiapp/ui/Shared/global.dart' as globals;
import 'package:jijiapp/ui/widgets/BusyButton.dart';
import 'package:jijiapp/ui/widgets/inputFiled.dart';
import 'package:stacked/stacked.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'addSubCatModel.dart';

class AddSubCategory extends StatelessWidget {
  final titleController = TextEditingController();

  AddSubCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String category;

    return ViewModelBuilder<AddSubCatViewModel>.reactive(
        viewModelBuilder: () => AddSubCatViewModel(),
        onModelReady: (model) {
          // update the text in the controller
          titleController.text = '';
          model.user;
          model.getCustomersName();
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
                      'Create Sub Categories',
                      style: TextStyle(fontSize: 26),
                    ),
                    verticalSpaceMedium,
                    InputField(
                      placeholder: 'Sub-Category Name',
                      controller: titleController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: DropdownSearch<Category>(
                        mode: Mode.BOTTOM_SHEET,
                        isFilteredOnline: true,
                        showClearButton: false,
                        autoFocusSearchBox: true,
                        items: model.catNames,
                        dropdownSearchDecoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey[100]),
                          ),
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        label: 'Customer Name',
                        validator: (Category category) =>
                            category.catName == null
                                ? "customer field is required "
                                : null,
                        onChanged: (Category data) {
                          category = data.catName;
                          globals.catId = data.catId;
                        },
                        dropdownBuilder: _customDropDownExample,
                        popupItemBuilder: _customPopupItemBuilderExample,
                      ),
                    ),
                    verticalSpaceMedium,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BusyButton(
                          title: 'Add Sub-Category',
                          busy: model.isBusy,
                          onPressed: () {
                            if (!model.isBusy) {
                              model.addSubCat(
                                  name: titleController.text,
                                  catIdtheName: globals.catId);
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

  Widget _customPopupItemBuilderExample(
      BuildContext context, Category item, bool isSelected) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(item.catName),
        ));
  }

  Widget _customDropDownExample(
      BuildContext context, Category item, String itemDesignation) {
    return Container(
        child: (item?.catName == null)
            ? ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text("Select Category"),
              )
            : ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(item.catName),
              ));
  }
}
