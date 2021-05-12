import 'package:jijiapp/Models/UserModel.dart';
import 'package:jijiapp/app/router.gr.dart';
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

class AddCatViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  UserModel get user => _authService.cuurrentuser;
  String newCatid;

  File _selectedImage;
  File get selectedImage => _selectedImage;

  Future selectImage() async {
    var tempImage = await _imageSelector.selectImage();
    if (tempImage != null) {
      _selectedImage = File(tempImage.path);

      notifyListeners();
    }
  }

  Future addCat({String name}) async {
    CloudStorageResult storageResult;
    setBusy(true);
    storageResult = await _cloudStorageService.uploadImage(
      imageToUpload: _selectedImage,
      title: name,
    );

    var result = await _firestoreService.addCategory(
        Category(
          catName: name,
          userId: _authService.cuurrentuser.id,
          imageUrl: storageResult.imageUrl,
          imageFileName: storageResult.imageFileName,
          status: true,
          catId: name,
        ),
        name);
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
    _navigationService.replaceWith(Routes.bottomBar);
  }
}
