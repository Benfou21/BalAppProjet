
import 'package:flutter/material.dart';

import 'package:map1/components/RoundedButton.dart';

import 'package:map1/components/RoundedButton.dart';


class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";
  
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {

    super.initState();
    

    controller = AnimationController(
      duration: new Duration(seconds: 1),
      vsync: this,
      );

      animation = ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
      controller.forward();

      animation.addStatusListener((status) {

       });
      
      controller.addListener(() { 
        setState(() {
          
        });
      });
  }

  @override 
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.jpg'),
                    height: 100.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  '  BAL APP',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: "log in",
              colour: Colors.orangeAccent, 
              onPressed: () {
                Navigator.pushNamed(context, 'login_screen');
              },
            ),
            RoundedButton(
              title: "Register", 
              colour: Colors.orange, 
              onPressed: (){
                Navigator.pushNamed(context, 'register_screen');
              },
              ),
          ],
        ),
      ),
    );
  }
}
