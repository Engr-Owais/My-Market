import 'package:jijiapp/Models/subCat.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/services/FirestoreService.dart';
import 'package:jijiapp/ui/views/AddSubCategory.dart/addSubCat.dart';
import 'package:jijiapp/ui/views/Products/ProductsView.dart';
import 'package:jijiapp/ui/views/SubCategories/subCategoryView.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SubCatViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<SubCat> _sub;
  List<SubCat> get sub => _sub;

  Future fetchsub(String catid) async {
    var res = await _firestoreService.fetchSubCtaegories(catid);
    if (res is List<SubCat>) {
      _sub = res;

      notifyListeners();
    } else {
      print("ERORRRRRRR");
    }
  }

  Future navigate(String catId, String subCatId) async {
    await _navigationService.navigateToView(ProductsView(
      catId: catId,
      subCatId: subCatId,
    ));
  }
}
