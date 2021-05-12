import 'package:jijiapp/Models/category.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/services/FirestoreService.dart';
import 'package:jijiapp/ui/views/SubCategories/subCategoryView.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<Category> _customers;
  List<Category> get customers => _customers;

  Future fetchcustomers() async {
    var customersResults = await _firestoreService.fetchCustomers();

    if (customersResults is List<Category>) {
      _customers = customersResults;

      notifyListeners();
    } else {
      print("ERORRRRRRR");
    }
  }

  Future navigate(String catId) async {
    await _navigationService.navigateToView(SubCategoryView(
      docId: catId,
    ));
  }
}
