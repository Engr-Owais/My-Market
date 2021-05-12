import 'package:injectable/injectable.dart';
import 'package:jijiapp/services/AuthService.dart';
import 'package:jijiapp/services/CloudStorageService.dart';
import 'package:jijiapp/utils/ImageSelector.dart';
import 'package:stacked_services/stacked_services.dart';

import 'FirestoreService.dart';
import 'ThemeService.dart';

@module
abstract class Services {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  ThemeService get themeService;
  @lazySingleton
  AuthService get authService;

  @lazySingleton
  FirestoreService get firestoreService;
  @lazySingleton
  BottomSheetService get bottomSheetService;
  @lazySingleton
  SnackbarService get snackbarservice;
  @lazySingleton
  CloudStorageService get cloudStorageService;
  @lazySingleton
  ImageSelector get imageSelector;
}
