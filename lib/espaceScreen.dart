import 'package:flutter/material.dart';
import 'package:map1/homePage.dart';


class espaceScreen extends StatefulWidget {
  const espaceScreen({ Key? key }) : super(key: key);

  @override
  _espaceScreenState createState() => _espaceScreenState();
}

class _espaceScreenState extends State<espaceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actu'),
      ),
    );
  }
}