
import 'dart:math';

import 'package:biblioteca_unimet/widgets/barraSuperior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageBodyDesktop extends StatefulWidget {
  const MainPageBodyDesktop({super.key});

  @override
  State<MainPageBodyDesktop> createState() => _MainPageBodyDesktopState();
}

class _MainPageBodyDesktopState extends State<MainPageBodyDesktop> {
  final publicacionController = TextEditingController();
  String publicacion = "";
  
  ScrollController scrollController = ScrollController();

  void buscarPublicacion(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      child: ListView(
      controller: scrollController,
      children: [
        Stack(
          children: [
            Image(image: AssetImage("assets/images/biblioteca.png"), ),
            Positioned.fill( 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  SizedBox(             
                    width: min(screenWidth*0.5,600),
                    child: TextField(
                    controller: publicacionController,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 110, 108, 108)
                      ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        borderSide: BorderSide(
                          color: Colors.deepOrange.shade400, 
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        borderSide: BorderSide(
                          color: Colors.blue, 
                          width: 2.0,
                      ),),
                      hintText: "Buscar una publicacion",
                      hoverColor: Colors.lightBlue.shade100,
                    ),
                  )
                ),
                ElevatedButton(
                  onPressed: () => buscarPublicacion(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange.shade400, foregroundColor: Colors.white),
                  child: Text("Buscar", style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),),
                ),
              ]
              )
            ,)
          ],
        ),
        Row(
          children: [
            Container(
              color: Color.fromARGB(255, 215, 15, 15),
              child: Text("si"),
            )
          ],
        )
      ],
    )
    );
  }
}

class MainPageBodyMovil extends StatefulWidget {
  const MainPageBodyMovil({super.key});

  @override
  State<MainPageBodyMovil> createState() => _MainPageBodyMovilState();
}

class _MainPageBodyMovilState extends State<MainPageBodyMovil> {
  String publicacion = "";
  final publicacionController = TextEditingController();
  ScrollController scrollController = ScrollController();

  void buscarPublicacion(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      child: ListView(
      controller: scrollController,
      children: [
        Stack(
          children: [
            Image(image: AssetImage("assets/images/biblioteca.png"), ),
            Positioned.fill( 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  SizedBox(             
                    width: screenWidth*0.65,
                    child: TextField(
                    controller: publicacionController,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 110, 108, 108)
                      ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        borderSide: BorderSide(
                          color: Colors.deepOrange.shade400, 
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        borderSide: BorderSide(
                          color: Colors.blue, 
                          width: 2.0,
                      ),),
                      hintText: "Buscar una publicacion",
                      hoverColor: Colors.lightBlue.shade100,
                    ),
                  )
                ),
                ElevatedButton(
                  onPressed: () => buscarPublicacion(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange.shade400, foregroundColor: Colors.white),
                  child: Text("Buscar", style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),),
                ),
              ]
              )
            ,)
          ],
        ),
      ])
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600){
      return Scaffold(
        appBar: BarraSuperiorDesktop(),
        body: MainPageBodyDesktop(),
      );
    }else{
      return Scaffold(
        appBar: BarraSuperiorMovil(),
        body: MainPageBodyMovil(),
      );
    }
  }
}