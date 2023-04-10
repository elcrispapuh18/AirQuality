import 'package:crud/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'login_register.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const Home();
          }
          else{
            return const LoginRegister();
          }
        },
      ),
    );
  }
}