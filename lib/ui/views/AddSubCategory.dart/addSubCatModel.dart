import 'package:jijiapp/Models/UserModel.dart';
import 'package:jijiapp/Models/category.dart';
import 'package:jijiapp/Models/subCat.dart';
import 'package:jijiapp/app/router.gr.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:stacked/stacked.dart';

import 'package:jijiapp/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:jijiapp/services/FirestoreService.dart';

class AddSubCatViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  UserModel get user => _authService.cuurrentuser;

  List<Category> _catName;
  List<Category> get catNames => _catName;

  Future getCustomersName() async {
    var result = await _firestoreService.fetchCustomers();

    if (result.length > 0) {
      _catName = result;

      notifyListeners();
    } else {
      print(_catName.length);
    }
  }

  Future addSubCat({String name, String catIdtheName}) async {
    setBusy(true);

    var result = await _firestoreService.addSubCategory(
      SubCat(
        subCatname: name,
        subStatus: true,
        catID: catIdtheName,
        subCatID: name,
      ),
      catIdtheName,
      name,
    ); // We need to add the current userId
    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Could not add Post',
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Post successfully Added',
        description: 'Your post has been created',
      );
    }
    _navigationService.replaceWith(Routes.bottomBar);
  }
}
