import 'package:flutter/material.dart';
import 'package:jijiapp/Models/UserModel.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:jijiapp/ui/views/AddCategory.dart/addCat.dart';
import 'package:jijiapp/ui/views/Home/HomeView.dart';
import 'package:stacked/stacked.dart';

class BottomBarModel extends IndexTrackingViewModel {
  final AuthService _authService = locator<AuthService>();

  UserModel get user => _authService.cuurrentuser;

  Widget onBuild(String check) {
    if (check != null && check == "Admin") {
      return AddCategory();
    } else {
      return HomeView();
    }
  }
}
