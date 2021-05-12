// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jijiapp/services/CloudStorageService.dart';
import 'package:jijiapp/utils/ImageSelector.dart';
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../services/AuthService.dart' as _i3;
import '../services/FirestoreService.dart' as _i5;
import '../services/Services.dart' as _i7;
import '../services/ThemeService.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final services = _$Services();
  gh.lazySingleton<_i3.AuthService>(() => services.authService);
  gh.lazySingleton<_i4.BottomSheetService>(() => services.bottomSheetService);
  gh.lazySingleton<_i4.DialogService>(() => services.dialogService);
  gh.lazySingleton<_i5.FirestoreService>(() => services.firestoreService);
  gh.lazySingleton<_i4.NavigationService>(() => services.navigationService);
  gh.lazySingleton<_i6.ThemeService>(() => services.themeService);
  gh.lazySingleton<_i4.SnackbarService>(() => services.snackbarservice);
  gh.lazySingleton<CloudStorageService>(() => services.cloudStorageService);
  gh.lazySingleton<ImageSelector>(() => services.imageSelector);

  return get;
}

class _$Services extends _i7.Services {
  @override
  _i3.AuthService get authService => _i3.AuthService();
  @override
  _i4.BottomSheetService get bottomSheetService => _i4.BottomSheetService();
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
  @override
  _i5.FirestoreService get firestoreService => _i5.FirestoreService();
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i6.ThemeService get themeService => _i6.ThemeService();
  @override
  _i4.SnackbarService get snackbarservice => _i4.SnackbarService();
  @override
  CloudStorageService get cloudStorageService => CloudStorageService();
  @override
  ImageSelector get imageSelector => ImageSelector();
}
