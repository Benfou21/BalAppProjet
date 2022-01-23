// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:map1/mapScreen.dart';

const kTextStyle = TextStyle(fontSize: 30,color: Colors.black,);
const kNiceBlue = Color(0xFF6ECDBE);

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('BALAPP'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          MapHomeContainer(image : AssetImage('images/map_douai.png') ),
          MainContainer(text:'Espace commentaire', route: '/com',),
          MainContainer(text: 'Bibliothèque', route: '/actu'),
        ],
      ),

      
    );
  }
}

class MainContainer extends StatelessWidget {
  
  
  MainContainer({ required this.text, required this.route }) ;

  final  String text;
  final String route;
 

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () { 
          Navigator.pushNamed(context, route);
        },
        child: Container(
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2.0, color: kNiceBlue,
            ),
            borderRadius: BorderRadius.circular(20),
            
          ),
          
          child: Center(
            child: Text( 
              text,
              style: kTextStyle,
            )
          ),
        ),
      ),
    );
  }
}

class MapHomeContainer extends StatelessWidget {


  MapHomeContainer( {required this.image});

  final AssetImage image;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () { 
          Navigator.pushNamed(context, '/map');
        },
        child: Container(
          margin: const EdgeInsets.all(30),
          decoration:  BoxDecoration(
            border: Border.all(
              width: 2.0, color: kNiceBlue,
            ),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              
              image: image,
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              'MAP',
              style: kTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
