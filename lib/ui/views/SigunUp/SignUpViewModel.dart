import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/app/router.gr.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:jijiapp/services/CloudStorageService.dart';
import 'package:jijiapp/utils/ImageSelector.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthService _authenticationService = locator<AuthService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();

  File _selectedImage;
  File get selectedImage => _selectedImage;

  Future selectImage() async {
    var tempImage = await _imageSelector.selectImage();
    if (tempImage != null) {
      _selectedImage = File(tempImage.path);

      notifyListeners();
    }
  }

  Future signUp({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,
    @required String userType,
  }) async {
    CloudStorageResult storageResult;
    setBusy(true);
    storageResult = await _cloudStorageService.uploadImage(
      imageToUpload: _selectedImage,
      title: name,
    );

    var result = await _authenticationService.signUpWithEmail(
      email: email,
      password: password,
      name: name,
      phone: phone,
      role: userType,
      imageFileName: storageResult.imageFileName,
      imageUrl: storageResult.imageUrl,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        await _snackbarService.showSnackbar(
            message: "Your Account Has Been Created", title: "Account Created");
      } else {
        await _snackbarService.showSnackbar(
            message: "General SignUp Failure",
            title: "Account Creation Failed");
      }
    } else {
      await _snackbarService.showSnackbar(
          message: result, title: "Signup Failure");
    }
    _navigationService.replaceWith(Routes.bottomBar);
  }
}
