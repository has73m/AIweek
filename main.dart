import 'package:flutter/material.dart';
import 'package:src/1screen.dart';
import 'login_screen.dart';
void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Screen1(),
       // Use the Home widget here
    );
  }

  }

