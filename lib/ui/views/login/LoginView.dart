import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'LoginViewModel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Text("Welcome To My Market"),
          ),
          body: Container(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome To My Market",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  GoogleAuthButton(
                    onPressed: () => model.signin(),
                    text: 'Login With GOOGLE',
                    style: AuthButtonStyle(
                        iconSize: 25,
                        height: size.height * 0.1,
                        width: size.width,
                        buttonType: AuthButtonType.secondary,
                        iconType: AuthIconType.secondary),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  EmailAuthButton(
                    text: 'Login With Email/Password',
                    style: AuthButtonStyle(
                        iconSize: 25,
                        height: size.height * 0.1,
                        width: size.width,
                        buttonType: AuthButtonType.secondary,
                        iconType: AuthIconType.secondary),
                    onPressed: () {
                      model.navigatToLogin();
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Not Registered ! ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'Create Account Here',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                model.navigatToSignup();
                              },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Center(
                    child: Text(
                      "By Login In To App You Will Accept Terms And Condition",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
