import 'package:jijiapp/Models/Product.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/services/FirestoreService.dart';
import 'package:jijiapp/ui/views/PrdouctDetail/DetailView.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  final NavigationService _navigationService = locator<NavigationService>();

  List<Product> _products;
  List<Product> get products => _products;

  Future fetchProd(String catId, String subCatId) async {
    var prodResult = await _firestoreService.fetchProducts(catId, subCatId);

    if (prodResult is List<Product>) {
      _products = prodResult;

      notifyListeners();
    } else {
      print("ERORRRRRRR Produc List");
    }
  }

  Future navigate(String catId, String subCatId, String prodId) async {
    await _navigationService.navigateToView(ProductsDetailView(
      catId: catId,
      subCatId: subCatId,
      prodId: prodId,
    ));
  }
}
