import 'package:flutter/material.dart';
import 'package:map1/homePage.dart';

import 'package:map1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class espaceCom extends StatefulWidget {
  espaceCom({ Key? key, required this.box }) : super(key: key);
  String box;

  @override
  _espaceComState createState() => _espaceComState();
}

class _espaceComState extends State<espaceCom> {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Espace commentaire'),
      ),
      body: Center(
        child: Column(
          
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Choisissez une boîte :"),
            ),
            DropdownButton<String>(
              value: widget.box,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  widget.box = newValue!;
                });
              },
              items: <String>['Boite 1', 'Boite 2', 'Boite 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
        }).toList(),
            ),
            MessageStream(firestore: _firestore, dropValue: widget.box,),
          ],
        ),
      ),
    );
  }
}



class MessageStream extends StatelessWidget {
  const MessageStream({
    
    required this.firestore,
    required this.dropValue,
  });

  final String dropValue; 
  final FirebaseFirestore firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      
        stream: firestore.collection("commentaires").orderBy('timestamp').snapshots(),
        builder:(context,snapshot){
          if(!snapshot.hasData){
            return const Center (
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
            
          }
          List<Widget> comList1 = [];
          List<Widget> comList2 = [];
          List<Widget> comList3 = [];
          List<Widget> returnList = [];

          final messages = snapshot.data!.docs.reversed;
          for( var message in messages){
            final messsageTexte = message['text'];
            final messageSender = message['sender'];
            final messageBoite = message['boite'];

            switch(messageBoite){ // remplissage des listes selon la boite du commentaire
              case "boite 1": {
                comList1.add(MessageBubble(sender: messageSender, text: messsageTexte));
              }break;
              case "boite 2" :{
                comList2.add(MessageBubble(sender: messageSender, text: messsageTexte));
              }break;
              case "boite 3" : {
                comList3.add(MessageBubble(sender: messageSender, text: messsageTexte));
              }
            }
            
          }
          switch(dropValue){ // affichage de la liste selon la boite
              case "Boite 1": {
                returnList = comList1;
              }break;
              case "Boite 2" :{
                returnList = comList2;
              }break;
              case "Boite 3" : {
                returnList = comList3;
              }
            }
          
          return Expanded(
            child: ListView(
              
              children: returnList,
            ),
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  

  MessageBubble({required this.sender,required this.text });

  late final String sender;
  late final String text;
  
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        
        children: [
          
          Material(
            color: Colors.orange,
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
            title: Text(text),
            leading: Icon(Icons.book),
            subtitle: Text("De $sender"),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
