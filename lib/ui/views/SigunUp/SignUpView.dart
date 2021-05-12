import 'package:flutter/material.dart';
import 'package:jijiapp/ui/widgets/AppBar.dart';
import 'package:jijiapp/ui/widgets/BusyButton.dart';
import 'package:jijiapp/ui/widgets/inputFiled.dart';
import 'package:stacked/stacked.dart';
import 'package:jijiapp/ui/Shared/ui_helpers.dart';

import 'SignUpViewModel.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final userTypeController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final appBar = BaseAppBar(
      appBar: AppBar(),
      title: Text("Sign Up"),
    );
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Container(
            height: size.height -
                (appBar.preferredSize.height) -
                (MediaQuery.of(context).padding.top),
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => model.selectImage(),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey[200],
                      child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: model.selectedImage == null
                              ? Center(
                                child: Icon(Icons.person_add , size: 80, )
                              )
                              : Image.file(
                                  model.selectedImage,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () => model.selectImage(),
                  //   child: Container(
                  //     height: 150,
                  //     decoration: BoxDecoration(
                  //         color: Colors.grey[200],
                  //         borderRadius: BorderRadius.circular(10)),
                  //     alignment: Alignment.center,
                  //     child: model.selectedImage == null
                  //         ? Text(
                  //             'Tap to add category image',
                  //             style: TextStyle(color: Colors.grey[400]),
                  //           )
                  //         : Image.file(
                  //             model.selectedImage,
                  //             fit: BoxFit.fill,
                  //           ),
                  //   ),
                  // ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Name',
                    textInputType: TextInputType.name,
                    controller: nameController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Email',
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Phone Number',
                    textInputType: TextInputType.phone,
                    controller: phoneController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Password',
                    password: true,
                    controller: passwordController,
                    additionalNote:
                        'Password has to be a minimum of 6 characters.',
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BusyButton(
                        title: 'Sign Up',
                        busy: model.isBusy,
                        onPressed: () {
                          model.signUp(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                            userType: 'seller',
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
