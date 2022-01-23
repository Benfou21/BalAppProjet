import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:map1/components/RoundedButton.dart';

import 'package:map1/constants.dart';


import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:dialogs/dialogs.dart';



class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool spinState = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinState,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                style: const TextStyle(color: Colors.black),
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your email"),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                style: const TextStyle(color: Colors.black),
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your password")
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: "Register", 
                colour: Colors.orange, 
                onPressed: () async {
                  setState(() {
                    spinState =true;
                  });
                  try { 
                    final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    if(newUser != null){
                      Navigator.popAndPushNamed(context, '/homePage');
                    }
                    setState(() {
                      spinState = false;
                    });
                  }catch (e) { 
                    setState(() {
                      spinState = false;
                    });
                    print(e);
                    MessageDialog message = MessageDialog(message: e.toString(), title: "Error",);
                    message.show(context);
                  };
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
