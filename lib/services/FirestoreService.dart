import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jijiapp/Models/Product.dart';
import 'package:jijiapp/Models/Region.dart';
import 'package:jijiapp/ui/Shared/global.dart' as globals;
import 'package:jijiapp/Models/UserModel.dart';
import 'package:jijiapp/Models/category.dart';
import 'package:jijiapp/Models/subCat.dart';

class FirestoreService {
  final CollectionReference _catCollectionReference =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _adminCollectionReference =
      FirebaseFirestore.instance.collection('admin');
      final CollectionReference _regionCollectionReference =
      FirebaseFirestore.instance.collection('Regions');

  Future createUser(UserModel user) async {
    try {
      await _adminCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future addRegion(Region region) async {
    try {
      await _regionCollectionReference.add(region.toMap());

      return true;
    } catch (e) {
      return e.toString();
    }
  }

  Future addCategory(Category category, String name) async {
    try {
      await _catCollectionReference.doc(name).set(category.toMap());

      return true;
    } catch (e) {
      return e.toString();
    }
  }

  Future addSubCategory(SubCat subCat, String categoryIdName , String subCatIdName) async {
    try {
      await FirebaseFirestore.instance
          .collection('Categories')
          .doc(categoryIdName)
          .collection("SubCategories")
          .doc(subCatIdName)
          .set(subCat.toMap());

      return true;
    } catch (e) {
      print("EROR FIRE");
      return e.toString();
    }
  }

  Future addProd({Product product, String categoryIdName , String subCatIdName ,String prodNameId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('Categories')
          .doc(categoryIdName)
          .collection("SubCategories")
          .doc(subCatIdName)
          .collection("Products").doc(prodNameId).set(product.toMap());

      return true;
    } catch (e) {
      print("EROR FIRE");
      return e.toString();
    }
  }

  Future fetchSubCtaegories(String categoryIdName) async {
    try {
      var subCat = await _catCollectionReference
          .doc(categoryIdName)
          .collection("SubCategories")
          .get();
      if (subCat.docs.isNotEmpty) {
        return subCat.docs
            .map((snapshot) => SubCat.fromMap(snapshot.data()))
            .where((mappedItem) => mappedItem.subCatname != null)
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future fetchCustomers() async {
    try {
      var postDocuments = await _catCollectionReference.get();

      if (postDocuments.docs.isNotEmpty) {
        return postDocuments.docs
            .map((snapshot) => Category.fromMap(snapshot.data()))
            .where((mappedItem) => mappedItem.catName != null)
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

Future fetchRegion() async {
    try {
      var region = await _regionCollectionReference.get();

      if (region.docs.isNotEmpty) {
        return region.docs
            .map((snapshot) => Region.fromMap(snapshot.data()))
            .where((mappedItem) => mappedItem.regionName != null)
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }


  Future getUser(String uid) async {
    try {
      var userData = await _adminCollectionReference.doc(uid).get();

      return UserModel.fromData(userData.data());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getProductId({String catId, String subCatId, String prodId}) async {
    try {
      

      var prod = await _catCollectionReference
          .doc(catId)
          .collection("SubCategories")
          .doc(subCatId)
          .collection("Products")
          .doc(prodId)
          .get();

      print("prod.data()  ${prod.data()}");

      // return prod.data();
      var data = Product.fromData(prod.data());
      print('object' + data.productName);
      return data;
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future fetchProducts(String catdocId, String subCatdocId) async {
    try {
      var prod = await _catCollectionReference
          .doc(catdocId)
          .collection("SubCategories")
          .doc(subCatdocId)
          .collection("Products")
          .get();
      if (prod.docs.isNotEmpty) {
        return prod.docs
            .map((snapshot) => Product.fromMap(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.productName != null)
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getDetails(
      {String subCatdocId, String catdocId, String prodId}) async {
    print("catdocId $catdocId ");
    print("sub $subCatdocId ");
    print("prodId $prodId ");
    var prodbyId = await _catCollectionReference
        .doc(catdocId)
        .collection("SubCategories")
        .doc(subCatdocId)
        .collection("Products")
        .doc(prodId)
        .snapshots();

    print(prodbyId);
  }
}
