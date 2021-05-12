import 'package:jijiapp/Models/Product.dart';
import 'package:jijiapp/Models/Region.dart';
import 'package:jijiapp/Models/UserModel.dart';
import 'package:jijiapp/Models/subCat.dart';
import 'package:jijiapp/ui/Shared/global.dart' as globals;
import 'package:stacked/stacked.dart';
import 'dart:io';

import 'package:jijiapp/Models/category.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:jijiapp/services/CloudStorageService.dart';
import 'package:jijiapp/utils/ImageSelector.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:jijiapp/services/FirestoreService.dart';

class AddProdViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  // final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  UserModel get currentUser => _authService.cuurrentuser;

  List<Category> _catName;
  List<Category> get catNames => _catName;

  List<SubCat> _subcatName;
  List<SubCat> get subcatNames => _subcatName;

  List<Region> _region;
  List<Region> get region => _region;

  UserModel get user => _authService.cuurrentuser;
  String newCatid;

  bool _checkbox = false;
  bool get checkbox => _checkbox;

  void changeCheck(bool value) {
    _checkbox = value;
    notifyListeners();
  }

  bool _used = false;
  bool get used => _used;

  void checkUsed(bool value) {
    _used = value;
    notifyListeners();
  }

  bool _checkRefurb = false;
  bool get checkRefurb => _checkRefurb;

  void checkRefurbish(bool value) {
    _checkRefurb = value;
    notifyListeners();
  }

  bool _brandnew = false;
  bool get brandnew => _brandnew;

  void checkbrandnew(bool value) {
    _brandnew = value;
    notifyListeners();
  }

  File _selectedImage;
  File get selectedImage => _selectedImage;

  Future selectImage() async {
    var tempImage = await _imageSelector.selectImage();
    if (tempImage != null) {
      _selectedImage = File(tempImage.path);

      notifyListeners();
    }
  }

  Future addProd({
    String name,
    String cattyID,
    String subCattyId,
    String price,
    String description,
    bool negotiable,
    bool used,
    String userName,
    String userPhone,
    bool refurb,
    String region,
    bool brandnew,
  }) async {
    CloudStorageResult storageResult;
    setBusy(true);
    storageResult = await _cloudStorageService.uploadImage(
      imageToUpload: _selectedImage,
      title: name,
    );

    var result = await _firestoreService.addProd(
      subCatIdName: subCattyId,
      categoryIdName: cattyID,
      prodNameId: name,
      product: Product(
          price: price,
          productName: name,
          status: true,
          subCatID: subCattyId,
          catID: cattyID,
          userName: _authService.cuurrentuser.name,
          userPhone: _authService.cuurrentuser.phone,
          productID: name,
          brandNew: _brandnew,
          prodDescription: description,
          prodNegotiable: _checkbox,
          refurbished: _checkRefurb,
          used: _used,
          image: storageResult.imageFileName,
          region: region,
          imageUrl: storageResult.imageUrl),
    );
    print(globals.catId);
    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Could not add Category',
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Category successfully Added',
        description: 'Your category has been created',
      );
    }
  }

  Future getCustomersName() async {
    var result = await _firestoreService.fetchCustomers();

    if (result.length > 0) {
      _catName = result;

      notifyListeners();
    } else {
      print(_catName.length);
    }
  }

  Future getSubCustomersName(String catid) async {
    var result = await _firestoreService.fetchSubCtaegories(catid);

    if (result.length > 0) {
      _subcatName = result;

      notifyListeners();
    } else {
      print(_subcatName.length);
    }
  }

  Future getRegion() async {
    var result = await _firestoreService.fetchRegion();

    if (result.length > 0) {
      _region = result;

      notifyListeners();
    } else {
      print(_region.length);
    }
  }
}
