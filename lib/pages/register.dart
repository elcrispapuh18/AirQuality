import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crud/widgets/button.dart';
import 'package:crud/widgets/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Register extends StatefulWidget {

  final Function()? onTap;


  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final locationController = TextEditingController();
  final confirmationController = TextEditingController();
  final pathImage = 'assets/img/logo.png'; 

  void signUserUp() async{
    showDialog(
      context: context, 
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try{
       if(passController.text == confirmationController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passController.text
          );
      } else {
        alertMensaje('Las contraseñas no coinciden');
      }
       Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      Navigator.pop(context);
      alertMensaje(e.code);
    }

  details(
    emailController.text.trim(), 
    locationController.text.trim(),
    passController.text.trim(),
  );
  }

  Future details(String correo, String localidad, String acceso) async{
    await FirebaseFirestore.instance.collection('users').add({
      'correo': correo,
      'localidad': localidad,
      'contraseña': acceso,
    });
  }

  //Mostrar error
  void alertMensaje(String alert){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor:const Color.fromARGB(255, 60, 203, 65),
          title: Center(
            child: Text(
              alert,
            ),
          ),
        );
      },
    );
  }
  


  @override
  Widget build(BuildContext context) {
    final logoPic = Container(
      margin: const EdgeInsets.only(
         top: 10.0,
        left: 80.0,
      ),
      width: 210,
     height: 200.0,
     decoration: BoxDecoration(
        image: DecorationImage(
           image: AssetImage(pathImage),
         ),
      ),
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 244, 244),
      appBar: AppBar(
        //title: const Text("Formulario de registro"),
        backgroundColor: const Color.fromARGB(255, 60, 203, 65),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
              children: [
              logoPic,
            ],
          ),
              const SizedBox(height: 10),
const Text(
                'Bienvenido',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                ),
              ),
              // name textfield
               const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 60, 203, 65),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // username textfield
              MyTextField(
                controller: emailController,
                hintText: 'Correo',
                obscureText: false,
              ),
             

              const SizedBox(height: 10),

               // location textfield
              MyTextField(
                controller: locationController,
                hintText: 'Localidad',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passController,
                hintText: 'Contraseña',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              //password textfield
              MyTextField(
                controller: confirmationController,
                hintText: 'Confirme su contraseña',
                obscureText: true,
              ),

              const SizedBox(height: 30),
             

              

              MyButton(
                  text: 'Registrarse',
                  onTap: signUserUp, 
                ),
                
                
                ],
              ),
            
          ),
        ),
      //   floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.keyboard_return),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      );
  }
}