import 'package:crud/pages/add_user_page.dart';
import 'package:crud/pages/authentication.dart';
import 'package:crud/pages/edit_user_page.dart';
import 'package:crud/pages/home_page.dart';
import 'package:crud/pages/home_screen.dart';
import 'package:crud/pages/login.dart';
import 'package:crud/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Air Quality',
      initialRoute: '/',
      routes: {
        '/':(context) => const Authentication(),
        'add':(context) => AddUserPage(),
        'edit':(context) => UpdateRecord(Contact_Key: '',),
        'profile':(context) => const Profile(),
      },
    );
  }
}

