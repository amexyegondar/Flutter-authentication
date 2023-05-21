import 'package:flutter/material.dart';
import 'package:daily_exercise_app/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: FirebaseOptions(
  apiKey: "AIzaSyAE8JuRZP1OgPtAsTqKBL3spEqCy0ZNUJ8",
  
  projectId: "flutter-authentication-a7b23",

  messagingSenderId: "511249028016",
  appId: "1:511249028016:web:1893c60628eb5f2d483c75",
 )
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter auth',
    
      home: const SignInScreen(),
    );
  }
}
