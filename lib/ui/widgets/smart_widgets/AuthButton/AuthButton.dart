// import 'package:auth_buttons/auth_buttons.dart';
// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';

// import 'AuthButtonViewModel.dart';

// class AuthButtonView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return ViewModelBuilder<AuthButtonViewModel>.reactive(
//       builder: (context, model, child) {
//         return Container(
//           height: size.height * 0.4,
//           width: size.width,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   GoogleAuthButton(
//                     onPressed: () => model.signin(),
//                     text: 'CONTINUE WITH GOOGLE',
//                     style: AuthButtonStyle(
//                         iconSize: 25,
//                         height: 50,
//                         width: MediaQuery.of(context).size.width,
//                         buttonType: AuthButtonType.secondary,
//                         iconType: AuthIconType.secondary),
//                   ),
//                   FacebookAuthButton(
//                     onPressed: () => model.handleLogin(),
//                     text: 'CONTINUE WITH Facebook',
//                     style: AuthButtonStyle(
//                         iconSize: 25,
//                         height: 50,
//                         width: MediaQuery.of(context).size.width,
//                         buttonType: AuthButtonType.secondary,
//                         iconType: AuthIconType.secondary),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//       viewModelBuilder: () => AuthButtonViewModel(),
//     );
//   }
// }
