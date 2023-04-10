import 'package:crud/pages/login.dart';
import 'package:crud/pages/register.dart';
import 'package:flutter/material.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {

  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Login(
        onTap: togglePages
        );
    }
    else{
      return Register(
        onTap: togglePages
      );
    }
    } 
  }
