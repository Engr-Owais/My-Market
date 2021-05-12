import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jijiapp/ui/views/Add%20Product/addProductView.dart';
import 'package:jijiapp/ui/views/AddCategory.dart/addCat.dart';
import 'package:jijiapp/ui/views/AddSubCategory.dart/addSubCat.dart';
import 'package:jijiapp/ui/views/Home/HomeView.dart';
import 'package:jijiapp/ui/views/ProfilePage/ProfileView.dart';
import 'package:jijiapp/ui/views/Sell.dart/SellView.dart';
import 'package:jijiapp/ui/views/Selling.dart';
import 'package:jijiapp/ui/views/favourites.dart';
import 'package:jijiapp/ui/views/login/LoginView.dart';
import 'package:jijiapp/ui/views/msg.dart';
import 'package:stacked/stacked.dart';

import 'BottomBarModel.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomBarModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: getViewForIndex(model.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey[200],
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            selectedItemColor: Colors.green,
            elevation: 10.0,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Favourites',
                icon: Icon(Icons.star),
              ),
              BottomNavigationBarItem(
                label: 'Sell',
                icon: Icon(Icons.add_box_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Messages',
                icon: Icon(Icons.message),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => BottomBarModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView();

      case 1:
        return Favourites();

      case 2:
        return AddProduct();

      case 3:
        return Msg();

      case 4:
        return ProfileView();

      default:
        return HomeView();
    }
  }
}
