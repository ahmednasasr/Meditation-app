import 'package:flutter/material.dart';
import 'package:meditation_app/auth/presentation/manger/auth_provider.dart';
import 'package:meditation_app/auth/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../../../services/firebase/firebase_function.dart';

class SignupScreen extends StatefulWidget {
  static const String routename = "Sign";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>(); // Global key for the form

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Image(image: AssetImage("assets/images/Group 6800.png")),
                Form(
                  key: _formKey, // Attach the form key
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Color(0xffE5E5E5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.web), Text("CONTINUE WITH GOOGLE")],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 70,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook_rounded),
                            Text("CONTINUE WITH FaceBook"),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'or login with Email',
                        style: TextStyle(fontSize: 20, color: Colors.black12),
                      ),
                      TextFormField(
                        controller: provider.usernamecon,
                        decoration: InputDecoration(
                          fillColor: Color(0xffF2F3F7),
                          filled: true,
                          hintText: "UserName",
                          labelText: "UserName",
                          hintStyle: TextStyle(color: Color(0xffF2F3F7)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ), TextFormField(
                        controller: provider.phoneController,
                        decoration: InputDecoration(
                          fillColor: Color(0xffF2F3F7),
                          filled: true,
                          hintText: "phone",
                          labelText: "phone",
                          hintStyle: TextStyle(color: Color(0xffF2F3F7)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: provider.emailcon,
                        decoration: InputDecoration(
                          fillColor: Color(0xffF2F3F7),
                          filled: true,
                          hintText: "Email",
                          labelText: "Email",
                          hintStyle: TextStyle(color: Color(0xffF2F3F7)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // Basic email validation
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: provider.passwordcon,
                        decoration: InputDecoration(
                          fillColor: Color(0xffF2F3F7),
                          filled: true,
                          hintText: "Password",
                          labelText: "Password",
                          hintStyle: TextStyle(color: Color(0xffF2F3F7)),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "I have read the ",
                            style: TextStyle(color: Color(0xffA1A4B2)),
                          ),
                          Text(
                            "privacy policy",
                            style: TextStyle(color: Colors.blue),
                          ),
                          Checkbox(
                            value: provider.ischecked,
                            onChanged: (bool? value) {
                              if (value != null) {
                                provider.ischeck(value);
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Container(
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xff8E97FD),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () async{
                              if (_formKey.currentState!.validate()) {
                                await provider.createAccount(context);
                              }
                            },
                            child: Text(
                              "Get Started",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ALREADY HAVE AN Account?",
                            style: TextStyle(color: Color(0xffA1A4B2)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, LoginScreen.routename);
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
