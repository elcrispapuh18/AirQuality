import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static String id = 'profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override 
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 35.0),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 70.0,
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Text("Usuario",
                style: TextStyle(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 33, 33, 33),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Ajustes'),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {},
                  ),

                  const SizedBox(height: 20),

                  ListTile(
                    leading: const Icon(Icons.headset_mic),
                    title: const Text('Soporte'),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {},
                  ),
                  
                  const SizedBox(height: 20),
                  
                  ListTile(
                    leading: const Icon(Icons.receipt),
                    title: const Text('Privacidad'),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {},
                  ),

                  const SizedBox(height: 20),

                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Info'),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {},
                  ),

                  const SizedBox(height: 20),

                  ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text('Compartir'),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    onTap: () {},
                  ),

                  const SizedBox(height: 20),

                  // ListTile(
                  //   leading: const Icon(Icons.info_outline),
                  //   title: const Text('Info'),
                  //   textColor: Colors.white,
                  //   iconColor: Colors.white,
                  //   onTap: () {},
                  // ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}