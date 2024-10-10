import 'package:flutter/material.dart';
import 'package:meditation_app/auth/presentation/manger/auth_provider.dart';
import 'package:meditation_app/auth/presentation/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import '../../../services/firebase/firebase_function.dart';

class LoginScreen extends StatefulWidget {
  static const String routename = "Login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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
                  key: _formKey,
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
                              color: Colors.black)
                      ),
                      // زر Google
                      Container(
                        height: 70,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Color(0xffE5E5E5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.web), Text("CONTINUE WITH GOOGLE")],
                        ),
                      ),
                      SizedBox(height: 10),
                      // زر Facebook
                      Container(
                        height: 70,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook_rounded),
                            Text("CONTINUE WITH FaceBook")
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'or login with Email',
                        style: TextStyle(fontSize: 20, color: Colors.black12),
                      ),

                      TextFormField(
                        controller: provider.emailcon,
                        decoration: InputDecoration(
                            fillColor: Color(0xffF2F3F7),
                            filled: true,
                            hintText: "Email",
                            labelText: "Email",
                            hintStyle: TextStyle(color: Color(0xffF2F3F7))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
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
                            hintStyle: TextStyle(color: Color(0xffF2F3F7))),
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
                      SizedBox(height: 20),
                      // زر تسجيل الدخول
                      Container(
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Color(0xff8E97FD),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await provider.login(context);
                              }
                            },
                            child: Text(
                              "Log In",
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
                            "Don't HAVE AN Account?",
                            style: TextStyle(color: Color(0xffA1A4B2)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, SignupScreen.routename);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
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
