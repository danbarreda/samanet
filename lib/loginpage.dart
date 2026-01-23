import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    @override
    Widget build(BuildContext context){
        return Center(
            child: Container(
                color: Colors.blue.shade300,
                /*child: Text(
                    "hola"
                    )*/
            )
        );
    }
}

class BarraSuperior extends StatelessWidget {
  const BarraSuperior({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
        '¡Bienvenido a Samanet!',
        style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
        ),
        textAlign: TextAlign.left,
        )
    );
  }
}


void showErrorMessage(BuildContext context, String message){
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      title: Text("Error:"),
      content: Text(message),
      actions: <Widget>[
          TextButton(
            child: const Text("Close"),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
        ],
    );
  }, 
  );
}


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  String correo = "";
  String password = "";
  bool validated = false;
  final correoController = TextEditingController();
  final passwordController = TextEditingController();


  void crearUsuario(){
    correo = correoController.text;
    password = passwordController.text;
    List<String> dominio = correo.split("@");
    validated = dominio[1]== "correo.unimet.edu.ve";
    if (validated){
      /* print("Correo: " + correo + "\nContrasena: " + password)
      */;
    }else{
      showErrorMessage(context, "El correo debe ser correo UNIMET: (ejemplo@correo.unimet.edu.ve)");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Iniciar Sesion", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.deepOrange)), 
            TextField(controller: correoController , decoration: InputDecoration(border: OutlineInputBorder(), hintText:  "ejemplo@correo.unimet.edu.ve", hoverColor: Colors.lightBlue.shade100)),
            TextField(controller: passwordController, decoration: InputDecoration(border: OutlineInputBorder(), hintText:  "Contraseña", hoverColor: Colors.lightBlue.shade100)),
            ElevatedButton.icon(onPressed: crearUsuario, icon: Icon(Icons.send_rounded, color: Colors.deepOrange.shade300,), label: Text("Crear Usuario")),
          ],
      ),
      ),
    );
  }
}