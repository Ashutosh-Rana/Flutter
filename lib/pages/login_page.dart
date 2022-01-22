import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return const Material(
      child: Center(
        child: Text("Login Page",
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        //textScaleFactor: 2,
        ), 
        // ignore: dead_code
        ),
        );
    
  }
}