import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/get_started_screen/presentation/screen/topics_screen.dart';
import 'package:meditation_app/services/firebase/firebase_function.dart';

import '../../data/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passwordcon = TextEditingController();
  TextEditingController usernamecon = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  UserCredential? userCredential;
  UserModel? user;
  bool ischecked = false;

  void ischeck(bool value) {
    ischecked = value;
    notifyListeners();
  }

  createAccount(BuildContext context) async {
    try {
      UserCredential credential = await FirebaseFunction.createAccount(
        emailcon.text,
        passwordcon.text,
        usernamecon.text,
        phoneController.text,
      );
      if (credential.user != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, TopicsScreen.routename, (route) => false);
        final snackBar = SnackBar(
          elevation: 0,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Success',
            message: "Account created successfully!",
            contentType: ContentType.success,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        elevation: 0,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error',
          message: e.toString(),
          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  login(BuildContext context) async {
    try {
      userCredential = await FirebaseFunction.login(
          emailcon.text, passwordcon.text);
      if (userCredential?.user != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, TopicsScreen.routename, (route) => false);
        user = await FirebaseFunction.getUser();
        final snackBar = SnackBar(
          elevation: 0,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Welcome',
            message: "Welcome back ${user!.name}",
            contentType: ContentType.success,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        elevation: 0,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error',
          message: "Email or Password is incorrect",
          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    notifyListeners();
  }
}
