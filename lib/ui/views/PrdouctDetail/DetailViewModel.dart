import 'package:jijiapp/Models/Product.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/services/FirestoreService.dart';
import 'package:stacked/stacked.dart';

class DetailViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  Product _products;
  Product get products => _products;

  Future getProduct({String catId, String subCatId, String prodId}) async {
    var result = await _firestoreService.getProductId(
      catId: catId,
      prodId: prodId,
      subCatId: subCatId,
    );

    _products = result;

    notifyListeners();
  }
}
