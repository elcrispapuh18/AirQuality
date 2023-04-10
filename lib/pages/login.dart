import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crud/widgets/button.dart';

class Login extends StatefulWidget {

  final Function()? onTap;

  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController = TextEditingController();
  final passController = TextEditingController(); 
  final pathImage = 'assets/img/logo.png';  

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passController.text);

        Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      Navigator.pop(context);
      alertMensaje(e.code);
    }
  }

  //Mostrar error
  void alertMensaje(String alert){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 60, 203, 65),
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
         top: 30.0,
        left: 80.0,
      ),
      width: 210,
     height: 200.0,
     decoration: BoxDecoration(
      shape: BoxShape.circle,
        image: DecorationImage(
           image: AssetImage(pathImage),
         ),
      ),
    );
    
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 203, 65),
          //title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:8, vertical:8),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              //logo
             Row(
              children: [
              logoPic,
            ],
          ),
          const SizedBox(height: 24,
                ),
                  //user name
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Correo',
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'El campo no ha sido completado';}
                          else if(value.length<4){
                            return 'El nombre es demasiado corto, debe contener más de 4 caracteres';
                          }
                          return null;
                      }
                    ),
                  ),
                  const SizedBox(height: 15,
                ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 4),
                    child: TextFormField(
                      controller: passController,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        hintText: 'Contraseña',
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Por favor escriba su contraseña';}
                          else if(value.length <8){
                            return 'Su contraseña debe tener al menos 8 caracteres';}
                          return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 50,
                ), 
                MyButton(
                  text: 'Iniciar sesión',
                  onTap: signUserIn, 
                ),
                const SizedBox(height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿No tiene cuenta?',
                    style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Registrarse', style: TextStyle(color: Color.fromARGB(255, 60, 203, 65), fontWeight: FontWeight.bold),),
                    )
                  ],
                )
                ],              
              ),            
            ),           
          ),          
        ),        
        ),
      );
  }
}

