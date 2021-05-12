import 'package:auto_route/auto_route_annotations.dart';
import 'package:jijiapp/ui/views/Add%20Product/addProductView.dart';
import 'package:jijiapp/ui/views/AddCategory.dart/addCat.dart';
import 'package:jijiapp/ui/views/AddRegion/AddRegion.dart';
import 'package:jijiapp/ui/views/AddSubCategory.dart/addSubCat.dart';
import 'package:jijiapp/ui/views/BottomBar/BottomBar.dart';
import 'package:jijiapp/ui/views/CustomLogin/LoginCustomView.dart';
import 'package:jijiapp/ui/views/Forget%20Password/ForgetPasswordView.dart';
import 'package:jijiapp/ui/views/Home/HomeView.dart';
import 'package:jijiapp/ui/views/PrdouctDetail/DetailView.dart';
import 'package:jijiapp/ui/views/Products/ProductsView.dart';
import 'package:jijiapp/ui/views/ProfilePage/ProfileView.dart';
import 'package:jijiapp/ui/views/SigunUp/SignUpView.dart';
import 'package:jijiapp/ui/views/SubCategories/subCategoryView.dart';
import 'package:jijiapp/ui/views/login/LoginView.dart';
import 'package:jijiapp/ui/views/startup/StartupView.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: BottomBar),
    MaterialRoute(page: ProductsDetailView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: SubCategoryView),
    MaterialRoute(page: ProductsView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: LoginCustomView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: ForgetPasswordView),
    MaterialRoute(page: AddCategory),
    MaterialRoute(page: AddSubCategory),
    MaterialRoute(page: AddProduct),
    MaterialRoute(page: AddRegion),


  ],
)
class $AppRouter {}
