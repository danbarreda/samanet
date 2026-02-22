import 'package:biblioteca_unimet/pages/homepage.dart';
import 'package:biblioteca_unimet/pages/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  User? user = FirebaseAuth.instance.currentUser;

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
      return MainPage();
    }
  }
}