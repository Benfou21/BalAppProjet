import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class CreateCom extends StatefulWidget {
  CreateCom({ Key? key,required this.box }) : super(key: key);

  String box;

  @override
  _CreateComState createState() => _CreateComState();
}

class _CreateComState extends State<CreateCom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nouveau Commentaire"),),
      body: SlidingUpPanel(
      panel: Center(
        child: Text("This is the sliding Widget"),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset('images/photoBoite1.jpg'),
          Card(
            child : Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(widget.box,style: TextStyle(fontSize: 25 ),),
            ),
          ),
          
        ]
      ),
    ),
    );
  }
}




