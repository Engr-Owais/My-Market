import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:stacked/stacked.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  AuthService _authService = locator<AuthService>();

  Future forget(String email) async {
    setBusy(true);
    await _authService.sendPasswordReset(email);
    await _authService.emailsignOut();
    await _authService.googleSignOut();
    setBusy(false);

    notifyListeners();
  }
}
