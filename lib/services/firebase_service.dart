import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore db =FirebaseFirestore.instance;

Future<List>getUsers() async {
  List users = [];

  QuerySnapshot querySnapshot = await db.collection('users').get();

  for( var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      "name": data['name'],
      "uid": doc.id,
    };
    users.add(person);
  }
  return users;

  //CollectionReference collectionReferenceUsers = db.collection('users');

  //QuerySnapshot queryUsers = await collectionReferenceUsers.get();

  //queryUsers.docs.forEach((documento) { 
   // users.add(documento.data());
  //});
  //await Future.delayed(const Duration(seconds:5 ));
  //return users;

}

Future<void> addUser(String name) async {
  await db.collection("users").add({"name" : name});
}

Future<void> updateUser(String uid, String newName  ) async{
  await db.collection("users").doc(uid).set({"name": newName});
}