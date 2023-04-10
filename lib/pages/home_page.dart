import 'package:crud/pages/home_screen.dart';
import 'package:crud/pages/profile.dart';
import 'package:crud/pages/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  void cerrarsesion(){
    FirebaseAuth.instance.signOut();
  }
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
    int indexTap = 0;

  final List<Widget> widgetsChildren =  [
    const HomeScreen(),
    const RealtimeDatabase(),
    const Profile(),
  ];

  
  final colors = [
    Colors.black,
    Colors.green,
    Colors.black,
  ];

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut, 
            icon: const Icon(Icons.logout),
          )
        ],
        title: const Text('Air Quality',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: colors[indexTap],
      ),
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 10),
        child: GNav(
          color: colors[indexTap],
          tabBackgroundColor: colors[indexTap],
          selectedIndex: indexTap,
          tabBorderRadius: 10,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          onTabChange: (index) => {setState(() => indexTap = index)},
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.app_registration,
              text: 'Pruebas',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}