import 'package:flutter/material.dart';
import 'package:src/login_screen.dart';
import 'login_screen.dart'; // استدعاء صفحة Login

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login_Screen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.medical_information,size: 100,color: Colors.green[900],),
              Text('Mental Health Support',style: TextStyle(
                color: Colors.green[900],fontSize: 25
              ),)
            ],
          ),
        )
      ),
    );
  }
}
