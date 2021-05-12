import 'dart:async';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  void handleStarupLogic() {
    // bool isLoggedIn = false; // implement logic for checking user logged in
    Future.delayed(Duration(seconds: 1), () {
      // if (isLoggedIn) {
      //   _navigationService.navigateTo(Routes.bottomBar);
      // } else {
      _navigationService.replaceWith(Routes.bottomBar);
      //}
    });
  }

  

  
}
