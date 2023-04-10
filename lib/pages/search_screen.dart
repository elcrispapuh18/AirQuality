

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealtimeDatabase extends StatefulWidget {
    const RealtimeDatabase ({Key? key}) : super(key: key);

  @override
  State<RealtimeDatabase> createState() => _RealtimeDatabaseState();
}

class _RealtimeDatabaseState extends State<RealtimeDatabase> {

 Query dbRef = FirebaseDatabase.instance.ref().child('Test');
 DatabaseReference reference = FirebaseDatabase.instance.ref().child('Test');

 Widget listItem({required Map test}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 260,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Medida analógica'),
          Text(
            test['analogica'].toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text('Voltaje'),
          Text(
            test['voltaje'].toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15,
          ),
           const Text('cO2'),
          Text(
            test['cO2'].toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15,
          ),
           const Text('Humedad'),
          Text(
            test['humedad'].toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15,
          ),
           const Text('Temperatura'),
          Text(
            test['temperatura'].toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef, 
          itemBuilder: (BuildContext context, DataSnapshot snapshot, 
          Animation<double> animation, int index) {
          
          Map test = snapshot.value as Map;
          test['key'] = snapshot.key;

          return listItem(test: test);
        },
      ),
      ),
    );
  }
}