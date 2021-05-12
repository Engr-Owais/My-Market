import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jijiapp/Models/UserModel.dart';
import 'package:jijiapp/app/locator.dart';
import 'package:jijiapp/app/router.gr.dart';
import 'package:jijiapp/services/FirestoreService.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthService {
  DialogService _dialogService = locator<DialogService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  FirestoreService _firestoreService = locator<FirestoreService>();

  NavigationService _navigationService = locator<NavigationService>();

  UserModel _currentuser;
  UserModel get cuurrentuser => _currentuser;

  Future signInWithGoogle() async {
    User googleUser;
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    if (googleSignInAccount != null) {}

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    UserCredential authResult = await _auth.signInWithCredential(credential);

    googleUser = authResult.user;

    assert(googleUser.uid != null);

    _currentuser = UserModel(
      email: googleUser.email,
      name: googleUser.displayName,
      id: googleUser.uid,
      userRole: 'seller',
    );

    sendMail(_currentuser.email, _currentuser.name);

    await _firestoreService.createUser(_currentuser);
    await _populateCurrentUser(googleUser);

    _dialogService.showDialog(
        title: "Signed In Succesfully",
        description: "Now You Can Sell Or Buy Items",
        buttonTitle: 'Okay',
        buttonTitleColor: Colors.green);

    Future.delayed(Duration(seconds: 1), () {
      _navigationService.replaceWith(Routes.bottomBar);
    });
  }

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var loguser = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _populateCurrentUser(loguser.user);
      await sendMail(email, _currentuser.name);

      return loguser != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,
    @required String role,
    String imageUrl,
    String imageFileName,
  }) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _currentuser = UserModel(
          email: email,
          name: name,
          id: authResult.user.uid,
          phone: phone,
          imageFileName: imageFileName,
          imageUrl: imageUrl,
          userRole: role);

      await _firestoreService.createUser(_currentuser);
      await sendMail(email, name);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentuser = await _firestoreService.getUser(user.uid);
    }
  }

  Future<void> sendMail(String email, String name) async {
    String username = 'fiverrowais@gmail.com';
    String password = '03218383910';

    // ignore: deprecated_member_use
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add(email)
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Login notification'
      ..html =
          "\n<p><b>New Login : </b> Dear $name , we detected a login into your account from a new device on ${DateTime.now()}</p> <p>If it was not you, please choose the "
              "Forget Password"
              " option in the Settings and create a new password, then contact us via <a href="
              "info@mymarket.com"
              "></a>info@mymarket.com</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  Future<void> sendPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> emailsignOut() async {
    _currentuser = null;
    await _auth.signOut();
  }

  Future<void> googleSignOut() async {
    _currentuser = null;
    await _googleSignIn.signOut();
  }
}
