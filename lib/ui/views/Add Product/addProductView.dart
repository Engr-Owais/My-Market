import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:jijiapp/Models/Region.dart';
import 'package:jijiapp/Models/category.dart';
import 'package:jijiapp/Models/subCat.dart';
import 'package:jijiapp/ui/Shared/ui_helpers.dart';
import 'package:jijiapp/ui/views/login/LoginView.dart';
import 'package:jijiapp/ui/widgets/AppBar.dart';
import 'package:jijiapp/ui/Shared/global.dart' as globals;
import 'package:jijiapp/ui/widgets/BusyButton.dart';
import 'package:jijiapp/ui/widgets/inputFiled.dart';
import 'package:stacked/stacked.dart';
import 'addProductViewModel.dart';

class AddProduct extends StatelessWidget {
  final titleController = TextEditingController();
  final regionController = TextEditingController();
  final descriptionController = TextEditingController();
  final typeController = TextEditingController();
  final priceController = TextEditingController();

  AddProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String category;
    String region;
    String subCat;
    bool _checkdrop = false;
    var size = MediaQuery.of(context).size;
    final appBar = BaseAppBar(
      appBar: AppBar(),
      title: Text("Add Product"),
    );
    return ViewModelBuilder<AddProdViewModel>.reactive(
      viewModelBuilder: () => AddProdViewModel(),
      onModelReady: (model) => {
        model.getCustomersName(),
        model.getRegion(),
        model.currentUser,
      },
      builder: (context, model, child) => Scaffold(
        appBar: appBar,
        body: Container(
            height: size.height -
                (appBar.preferredSize.height) -
                (MediaQuery.of(context).padding.top),
            width: size.width,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: model.user != null
                    ? Card(
                        elevation: 5.0,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Column(
                              children: [
                                verticalSpace(20),
                                Text(
                                  'Create Product',
                                  style: TextStyle(fontSize: 26),
                                ),
                                verticalSpaceMedium,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: DropdownSearch<Category>(
                                    mode: Mode.BOTTOM_SHEET,
                                    isFilteredOnline: true,
                                    showClearButton: false,
                                    autoFocusSearchBox: true,
                                    items: model.catNames,
                                    dropdownSearchDecoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey[100]),
                                      ),
                                      fillColor: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                    ),
                                    autoValidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    label: 'Category Name',
                                    validator: (Category category) =>
                                        category.catName == null
                                            ? "Category field is required "
                                            : null,
                                    onChanged: (Category data) {
                                      category = data.catName;
                                      globals.catId = data.catId;
                                      _checkdrop = true;
                                      model.getSubCustomersName(data.catId);
                                    },
                                    dropdownBuilder: _customDropDownExample,
                                    popupItemBuilder:
                                        _customPopupItemBuilderExample,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownSearch<SubCat>(
                                    mode: Mode.BOTTOM_SHEET,
                                    isFilteredOnline: true,
                                    showClearButton: false,
                                    enabled: _checkdrop,
                                    autoFocusSearchBox: false,
                                    items: model.subcatNames,
                                    dropdownSearchDecoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey[100]),
                                      ),
                                      fillColor: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                    ),
                                    autoValidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    label: 'Sub Category Name',
                                    validator: (SubCat subcategory) =>
                                        subcategory.subCatname == null
                                            ? "Sub Category field is required "
                                            : null,
                                    onChanged: (SubCat data) {
                                      subCat = data.subCatname;
                                      globals.subcatId = data.subCatID;
                                    },
                                    dropdownBuilder: _subcustomDropDownExample,
                                    popupItemBuilder:
                                        _subcustomPopupItemBuilderExample,
                                  ),
                                ),
                                verticalSpaceSmall,
                                InputField(
                                  placeholder: 'Product Name',
                                  controller: titleController,
                                ),
                                verticalSpaceSmall,
                                GestureDetector(
                                  onTap: () => model.selectImage(),
                                  child: Container(
                                    height: 250,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    alignment: Alignment.center,
                                    child: model.selectedImage == null
                                        ? Text(
                                            'Tap to add product image',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 20),
                                          )
                                        : Image.file(model.selectedImage),
                                  ),
                                ),
                                verticalSpaceSmall,
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownSearch<Region>(
                                    mode: Mode.BOTTOM_SHEET,
                                    isFilteredOnline: true,
                                    showClearButton: false,
                                    autoFocusSearchBox: false,
                                    items: model.region,
                                    dropdownSearchDecoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey[100]),
                                      ),
                                      fillColor: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                    ),
                                    autoValidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    label: 'Region Name',
                                    validator: (Region region) =>
                                        region.regionName == null
                                            ? "Region field is required "
                                            : null,
                                    onChanged: (Region data) {
                                      region = data.regionName;
                                    },
                                    dropdownBuilder: _regcustomDropDownExample,
                                    popupItemBuilder:
                                        _regcustomPopupItemBuilderExample,
                                  ),
                                ),
                                verticalSpaceSmall,
                                TextFormField(
                                  controller: descriptionController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintText: 'Description Of Product',
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: BorderSide.none),
                                      hintStyle: TextStyle(fontSize: 15)),
                                ),
                                verticalSpaceSmall,
                                verticalSpaceSmall,
                                verticalSpaceSmall,
                                Container(
                                  width: size.width,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Condition Of Product",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            value: model.checkRefurb,
                                            onChanged: (value) {
                                              model.checkRefurbish(value);
                                            },
                                          ),
                                          Text('Refurbished'),
                                          Checkbox(
                                            value: model.brandnew,
                                            onChanged: (value) {
                                              model.checkbrandnew(value);
                                            },
                                          ),
                                          Text('Beand New'),
                                          Checkbox(
                                            value: model.used,
                                            onChanged: (value) {
                                              model.checkUsed(value);
                                            },
                                          ),
                                          Text('Used'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpaceSmall,
                                InputField(
                                  placeholder: 'Product Price',
                                  controller: priceController,
                                  textInputType: TextInputType.number,
                                ),
                                Container(
                                  width: size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: model.checkbox,
                                        onChanged: (value) {
                                          model.changeCheck(value);
                                        },
                                      ),
                                      Text('Negotiable'),
                                    ],
                                  ),
                                ),
                                InputField(
                                  placeholder: model.currentUser.name != null
                                      ? model.currentUser.name
                                      : 'User Name',
                                  isReadOnly: true,
                                ),
                                InputField(
                                  placeholder: model.currentUser.phone != null
                                      ? model.currentUser.phone
                                      : 'Phone Number',
                                  isReadOnly: true,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BusyButton(
                                      title: 'Add Product',
                                      busy: model.isBusy,
                                      onPressed: () {
                                        if (!model.isBusy) {
                                          model.addProd(
                                              price: priceController.text,
                                              description:
                                                  descriptionController.text,
                                              region: region,
                                              brandnew: model.brandnew,
                                              used: model.used,
                                              negotiable: model.checkbox,
                                              refurb: model.checkRefurb,
                                              cattyID: globals.catId,
                                              subCattyId: globals.subcatId,
                                              name: titleController.text,
                                              userName: model.currentUser.name,
                                              userPhone:
                                                  model.currentUser.phone);
                                        }
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : LoginView())),
      ),
    );
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

  Widget _subcustomPopupItemBuilderExample(
      BuildContext context, SubCat item, bool isSelected) {
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
          title: Text(item.subCatname),
        ));
  }

  Widget _subcustomDropDownExample(
      BuildContext context, SubCat item, String itemDesignation) {
    return Container(
        child: (item?.subCatname == null)
            ? ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text("Select Sub Category"),
              )
            : ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(item.subCatname),
              ));
  }

  Widget _regcustomPopupItemBuilderExample(
      BuildContext context, Region item, bool isSelected) {
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
          title: Text(item.regionName),
        ));
  }

  Widget _regcustomDropDownExample(
      BuildContext context, Region item, String itemDesignation) {
    return Container(
        child: (item?.regionName == null)
            ? ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text("Select Region"),
              )
            : ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(item.regionName),
              ));
  }
}
