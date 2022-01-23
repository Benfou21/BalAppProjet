import 'package:flutter/material.dart';
import 'package:map1/createCom.dart';
import 'package:map1/espaceScreen.dart';
import 'package:map1/log_reg/registration_screen.dart';
import 'package:map1/mapinfo.dart';
import 'mapScreen.dart';
import 'homePage.dart';
import 'espaceCommentaire.dart';
import 'log_reg/registration_screen.dart';
import 'log_reg/login_screen.dart';
import 'log_reg/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'welcome_screen' ,
      routes: {
        'welcome_screen' : (context) => WelcomeScreen(),
        'login_screen' : (context) => LoginScreen(),
        'register_screen' : (context) => RegistrationScreen(),
        '/homePage' : (context) => HomePage(),
        '/map' : (context) => GoogleMapScreen(),
        '/actu' : (context) => espaceScreen(),
        '/com' : (context) => espaceCom(box: "Boite 1",),
        '/info' : (context) => Mapinfo(),
        '/creatcom' : (context) => CreateCom(box: "Boite 1"),
      },
    );
  }
}








