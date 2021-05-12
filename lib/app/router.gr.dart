// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jijiapp/ui/views/Add%20Product/addProductView.dart';
import 'package:jijiapp/ui/views/AddCategory.dart/addCat.dart';
import 'package:jijiapp/ui/views/AddRegion/AddRegion.dart';
import 'package:jijiapp/ui/views/AddSubCategory.dart/addSubCat.dart';
import 'package:jijiapp/ui/views/CustomLogin/LoginCustomView.dart';
import 'package:jijiapp/ui/views/Forget%20Password/ForgetPasswordView.dart';
import 'package:jijiapp/ui/views/SigunUp/SignUpView.dart';

import '../ui/views/BottomBar/BottomBar.dart';
import '../ui/views/Home/HomeView.dart';
import '../ui/views/PrdouctDetail/DetailView.dart';
import '../ui/views/Products/ProductsView.dart';
import '../ui/views/ProfilePage/ProfileView.dart';
import '../ui/views/SubCategories/subCategoryView.dart';
import '../ui/views/login/LoginView.dart';
import '../ui/views/startup/StartupView.dart';

class Routes {
  static const String startupView = '/';
  static const String loginView = '/login-view';
  static const String bottomBar = '/bottom-bar';
  static const String productsDetailView = '/products-detail-view';
  static const String homeView = '/home-view';
  static const String subCategoryView = '/sub-category-view';
  static const String productsView = '/products-view';
  static const String profileView = '/profile-view';
  static const String customLoginView = '/custom-login-view';
  static const String customSignunpView = '/custom-signunp-view';
  static const String forgetpassView = '/forget-password-view';
  static const String addCategory = '/add-category-view';
  static const String addSubCategory = '/add-sub-category-view';
  static const String addProd = '/add-prod';
  static const String addRegion = '/add-region';
  static const all = <String>{
    startupView,
    loginView,
    bottomBar,
    productsDetailView,
    homeView,
    subCategoryView,
    productsView,
    profileView,
    customLoginView,
    customSignunpView,
    forgetpassView,
    addCategory,
    addSubCategory,
    addProd,
    addRegion
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.bottomBar, page: BottomBar),
    RouteDef(Routes.productsDetailView, page: ProductsDetailView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.subCategoryView, page: SubCategoryView),
    RouteDef(Routes.productsView, page: ProductsView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.customSignunpView, page: SignUpView),
    RouteDef(Routes.customLoginView, page: LoginCustomView),
    RouteDef(Routes.forgetpassView, page: ForgetPasswordView),
    RouteDef(Routes.addCategory, page: AddCategory),
    RouteDef(Routes.addSubCategory, page: AddSubCategory),
    RouteDef(Routes.addProd, page: AddProduct),
    RouteDef(Routes.addRegion , page: AddRegion),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    BottomBar: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => BottomBar(),
        settings: data,
      );
    },
    AddRegion: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddRegion(),
        settings: data,
      );
    },
    ForgetPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgetPasswordView(),
        settings: data,
      );
    },
    AddCategory: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddCategory(),
        settings: data,
      );
    },
    AddProduct: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddProduct(),
        settings: data,
      );
    },
    AddSubCategory: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddSubCategory(),
        settings: data,
      );
    },
    LoginCustomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginCustomView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    ProductsDetailView: (data) {
      final args = data.getArgs<ProductsDetailViewArguments>(
        orElse: () => ProductsDetailViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductsDetailView(
          catId: args.catId,
          subCatId: args.subCatId,
          prodId: args.prodId,
        ),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    SubCategoryView: (data) {
      final args = data.getArgs<SubCategoryViewArguments>(
        orElse: () => SubCategoryViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SubCategoryView(docId: args.docId),
        settings: data,
      );
    },
    ProductsView: (data) {
      final args = data.getArgs<ProductsViewArguments>(
        orElse: () => ProductsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductsView(
          catId: args.catId,
          subCatId: args.subCatId,
        ),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProductsDetailView arguments holder class
class ProductsDetailViewArguments {
  final String catId;
  final String subCatId;
  final String prodId;
  ProductsDetailViewArguments({this.catId, this.subCatId, this.prodId});
}

/// SubCategoryView arguments holder class
class SubCategoryViewArguments {
  final String docId;
  SubCategoryViewArguments({this.docId});
}

/// ProductsView arguments holder class
class ProductsViewArguments {
  final String catId;
  final String subCatId;
  ProductsViewArguments({this.catId, this.subCatId});
}
