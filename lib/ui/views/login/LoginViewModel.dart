import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/app/router.gr.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  AuthService _authService = locator<AuthService>();
  NavigationService _navigationService = locator<NavigationService>();

  Future signin() async {
    await _authService.signInWithGoogle();

    notifyListeners();
  }

  void navigatToSignup() {
    _navigationService.navigateTo(Routes.customSignunpView);
  }

  void navigatToLogin() {
    _navigationService.navigateTo(Routes.customLoginView);
  }
}
