import 'package:jijiapp/Models/UserModel.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/app/router.gr.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  AuthService _authService = locator<AuthService>();
  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();

  UserModel get user => _authService.cuurrentuser;

  Future signOut() async {
    await _authService.emailsignOut();
    await _authService.googleSignOut();

    await _navigationService.replaceWith(Routes.bottomBar);
  }

  Future forget(String email) async {
    setBusy(true);
    await _authService.sendPasswordReset(email);

    await _dialogService.showDialog(
        title: "Password Reset",
        description: "Password Reset Link Send To Your Email",
        buttonTitle: "THANKS");

    await signOut();
    setBusy(false);

    notifyListeners();
  }

  void naavigatetoCatScreen() async {
    await _navigationService.navigateTo(Routes.addCategory);
  }

  void naavigatetoSubCatScreen() async {
    await _navigationService.navigateTo(Routes.addSubCategory);
  }

  void naavigatetoaddRegion() async {
    await _navigationService.navigateTo(Routes.addRegion);
  }
}
