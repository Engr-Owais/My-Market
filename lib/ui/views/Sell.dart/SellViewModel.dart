import 'package:jijiapp/Models/UserModel.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:stacked/stacked.dart';

class SellViewModel extends BaseViewModel {
  AuthService _authService = locator<AuthService>();

  UserModel get user => _authService.cuurrentuser;
}
