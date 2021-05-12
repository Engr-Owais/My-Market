import 'package:jijiapp/Models/Region.dart';
import 'package:jijiapp/Models/UserModel.dart';
import 'package:jijiapp/Models/category.dart';
import 'package:jijiapp/Models/subCat.dart';
import 'package:jijiapp/app/router.gr.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:stacked/stacked.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:jijiapp/services/FirestoreService.dart';

class AddRegionViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  UserModel get user => _authService.cuurrentuser;

  Future addRegion({String name}) async {
    setBusy(true);

    var result = await _firestoreService.addRegion(Region(regionName: name));
    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Could not add Region',
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Region successfully Added',
        description: 'Your region has been created',
      );
    }
    _navigationService.replaceWith(Routes.bottomBar);
  }
}
