import 'package:biblioteca_unimet/pages/homepage.dart';
import 'package:biblioteca_unimet/pages/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  User? user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    if (user == null){
      print("No ha iniciado sesion");
      return LandingPage();
    }/*else if(!user.emailVerified){
    //falta crear una pagina de verificar email
      return VerifyEmailPage();
    }*/else{
      print("Si tiene sesion iniciada");
      String correo = user!.email!;
      String role = "";
      db.collection("users").doc(correo).get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          role = documentSnapshot.get("role");
        }
      }).catchError((error) {
        print("Error getting document: $error");
      });
      return MainPage(role: role,);
    }
  }
}