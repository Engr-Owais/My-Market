import 'package:flutter/material.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/router.gr.dart';
import 'AppViewModel.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
      builder: (context, model, child) {
        return MaterialApp(
          title: 'Market App',
          debugShowCheckedModeBanner: false,
          theme: model.isDarkMode ? model.darkTheme : model.lightTheme,
          initialRoute: Routes.startupView,
          onGenerateRoute: AppRouter().onGenerateRoute,
          // ignore: deprecated_member_use
          navigatorKey: locator<NavigationService>().navigatorKey,
        );
      },
      viewModelBuilder: () => AppViewModel(),
    );
  }
}
