//import 'firebase_options.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import '/login.dart';
import '/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  //);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bit-Masters',
      home: SplashScreen(),
    );
  }
}