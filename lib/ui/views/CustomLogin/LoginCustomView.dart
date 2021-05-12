import 'package:flutter/material.dart';
import 'package:jijiapp/ui/Shared/ui_helpers.dart';
import 'package:jijiapp/ui/widgets/AppBar.dart';
import 'package:jijiapp/ui/widgets/BusyButton.dart';
import 'package:jijiapp/ui/widgets/TextLink.dart';
import 'package:jijiapp/ui/widgets/inputFiled.dart';
import 'package:stacked/stacked.dart';

import 'LoginCustomViewModel.dart';

class LoginCustomView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final appBar = BaseAppBar(
      appBar: AppBar(),
      title: Text("Sign In"),
    );
    return ViewModelBuilder<LoginCustomViewModel>.reactive(
      viewModelBuilder: () => LoginCustomViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: appBar,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: size.height -
                  (appBar.preferredSize.height) -
                  (MediaQuery.of(context).padding.top),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Image.asset('assets/mymarket.jpg'),
                    ),
                    InputField(
                      textInputType: TextInputType.emailAddress,
                      placeholder: 'Email',
                      controller: emailController,
                    ),
                    verticalSpaceSmall,
                    InputField(
                      placeholder: 'Password',
                      password: true,
                      controller: passwordController,
                    ),
                    verticalSpaceMedium,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BusyButton(
                          title: 'Login',
                          busy: model.isBusy,
                          onPressed: () {
                            model.login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                        )
                      ],
                    ),
                    verticalSpaceMedium,
                    TextLink(
                      'Forget Password',
                      onPressed: () => model.navigateToForget(),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
