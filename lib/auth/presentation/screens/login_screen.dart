import 'package:flutter/material.dart';
import 'package:meditation_app/auth/presentation/manger/auth_provider.dart';
import 'package:meditation_app/auth/presentation/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import '../../../get_started_screen/presentation/screen/getstarted_screen.dart';
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
          body: Stack(
            children: [
              Image.asset("assets/images/Group 6800.png",
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80), // Space above content
                        Text(
                          "Create Your Account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffE5E5E5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.web),
                              SizedBox(width: 10),
                              Text("CONTINUE WITH GOOGLE"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook_rounded),
                              SizedBox(width: 10),
                              Text("CONTINUE WITH FACEBOOK"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'or login with Email',
                          style: TextStyle(fontSize: 20, color: Colors.black45),
                        ),
                        const SizedBox(height: 20),
                        // حقل البريد الإلكتروني
                        TextFormField(
                          controller: provider.emailcon,
                          decoration: InputDecoration(
                            fillColor: Color(0xffF2F3F7),
                            filled: true,
                            hintText: "Email",
                            labelText: "Email",
                            hintStyle: TextStyle(color: Color(0xffA1A4B2)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        // حقل كلمة المرور
                        TextFormField(
                          controller: provider.passwordcon,
                          decoration: InputDecoration(
                            fillColor: Color(0xffF2F3F7),
                            filled: true,
                            hintText: "Password",
                            labelText: "Password",
                            hintStyle: TextStyle(color: Color(0xffA1A4B2)),
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
                        const SizedBox(height: 20),
                        // زر تسجيل الدخول
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff8E97FD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 15),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, GetstartedScreen.routename);
                              }
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't HAVE AN Account?",
                              style: TextStyle(color: Color(0xffA1A4B2)),
                            ),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, SignupScreen.routename);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
