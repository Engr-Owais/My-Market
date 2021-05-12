import 'package:flutter/material.dart';
import 'package:jijiapp/ui/widgets/AppBar.dart';
import 'package:stacked/stacked.dart';
import 'package:jijiapp/ui/Shared/ui_helpers.dart';
import 'package:jijiapp/ui/widgets/BusyButton.dart';

import 'package:jijiapp/ui/widgets/inputFiled.dart';

import 'ForgetPasswordViewModel.dart';

class ForgetPasswordView extends StatelessWidget {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appBar = BaseAppBar(
      appBar: AppBar(),
      title: Text("Sign In"),
    );
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<ForgetPasswordViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
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
                      verticalSpaceMedium,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BusyButton(
                            title: 'Submit',
                            busy: model.isBusy,
                            onPressed: () {
                              model.forget(emailController.text);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
      viewModelBuilder: () => ForgetPasswordViewModel(),
    );
  }
}
