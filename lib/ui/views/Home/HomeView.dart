import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jijiapp/ui/widgets/PostItem.dart';
import 'package:stacked/stacked.dart';

import 'HomeViewModel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.fetchcustomers(),
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.33,
                    width: size.width,
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Column()),
                        Expanded(
                          child: Text(
                            "What Are You Looking For ?",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon: Icon(Icons.search),
                              hintText: "What Are You Searching For ?",
                              suffixIcon: Icon(Icons.filter_alt),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: model.customers != null
                            ? GridView.builder(
                                itemCount: model.customers.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemBuilder: (_, index) => PostItem(
                                      category: model.customers[index],
                                      openSubCat: () => {
                                        model.navigate(model.customers[index].catId,)
                                      }
                                    ))
                            : Center(child: CircularProgressIndicator())),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
