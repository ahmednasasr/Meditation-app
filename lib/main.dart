import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/auth/presentation/manger/auth_provider.dart';
import 'package:meditation_app/get_started_screen/presentation/screen/topics_screen.dart';
import 'package:meditation_app/auth/presentation/screens/login_screen.dart';
import 'package:meditation_app/layout_screen/presentation/manger/layout_provider.dart';
import 'package:meditation_app/layout_screen/presentation/screens/layout_screen.dart';
import 'package:provider/provider.dart';
import 'auth/presentation/screens/signup_screen.dart';
import 'auth/presentation/screens/start_screen.dart';
import 'firebase_options.dart';
import 'get_started_screen/presentation/manger/home_provider.dart';
import 'get_started_screen/presentation/screen/reminder_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthProvider()),
            ChangeNotifierProvider(create: (_) => HomeProvider()),
            ChangeNotifierProvider(create: (_) => LayoutProvider()),
          ],
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
      routes: {
          StartScreen.routename:(_)=> StartScreen(),
        LoginScreen.routename:(_)=> LoginScreen(),
        SignupScreen.routename:(_)=> SignupScreen(),
        TopicsScreen.routename:(_)=>TopicsScreen(),
        ReminderScreen.routename:(_)=>ReminderScreen(),
        LayoutScreen.routename:(_)=>LayoutScreen(),
      },
      initialRoute: TopicsScreen.routename,
    );
  }
}

