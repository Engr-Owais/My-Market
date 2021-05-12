import 'package:flutter/foundation.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/app/router.gr.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginCustomViewModel extends BaseViewModel {
  final AuthService _authenticationService = locator<AuthService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        await _snackbarService.showSnackbar(
            message: "General login Success.", title: "Login Succes");

        await _navigationService.replaceWith(Routes.bottomBar);
      } else {
        await _snackbarService.showSnackbar(
            message: "General login failure. Please try again later",
            title: "Login Failure");
      }
    } else {
      await _snackbarService.showSnackbar(message: result, title: "Login Failure");
    }
  }

  void navigateToForget() {
    _navigationService.navigateTo(Routes.forgetpassView);
  }
}
