import 'package:edemadetection/firebase_options.dart';
import 'package:edemadetection/screens/dashboard.dart';
import 'package:edemadetection/screens/detail_screen.dart/edema.dart';
import 'package:edemadetection/screens/screen1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
           debugShowCheckedModeBanner: false,
           home: ScreenOne(),
          // home: DashBoard(),
    );
  }
}