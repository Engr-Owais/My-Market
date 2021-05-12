// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:jijiapp/app/locator.dart';
// import 'package:jijiapp/services/AuthService.dart';
// import 'package:stacked/stacked.dart';

// class AuthButtonViewModel extends BaseViewModel {
//   AuthService _authService = locator<AuthService>();

//   Future signin() async {
//     await _authService.signInWithGoogle();
//     notifyListeners();
//   }

//   Future<void> handleLogin() async {
//     final FacebookLoginResult result =
//         await _authService.facebookLogin.logIn(['email']);
//     switch (result.status) {
//       case FacebookLoginStatus.cancelledByUser:
//         break;
//       case FacebookLoginStatus.error:
//         break;
//       case FacebookLoginStatus.loggedIn:
//         try {
//           await _authService.loginWithfacebook(result);
//         } catch (e) {
//           print(e);
//         }
//         break;
//     }
//   }
// }
