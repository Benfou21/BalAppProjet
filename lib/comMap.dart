import 'package:map1/createCom.dart';
import 'package:map1/espaceCommentaire.dart';

import 'hero_dialog_route.dart';

import 'package:flutter/material.dart';


class pop_window extends StatelessWidget {

  double p;
  double k;
  pop_window({required this.p, required this.k});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
          bottom: p,
          right: k,
          left: 0,
          duration: Duration(milliseconds: 200),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                return popInfo();
                }));
              },
              child: Hero(
                tag: 'info',
                child: Container(
                  
                  decoration: BoxDecoration(
                    color : Colors.orange,
                    shape: BoxShape.circle),
                  
                  child: const Icon(
                    Icons.add_rounded,
                    size: 56,
            ),
          ),
              ),
            ),
          ),
        );
  }

}




class popInfo extends StatelessWidget {
  popInfo({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Hero(
          tag: 'info',
          child: Container(
                
                decoration: BoxDecoration(color : Colors.orange,borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.fromLTRB(20, 250, 20, 250),
                
                
                
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 5),
                    child: ListView(
                      
                          reverse: false,
                          
                          //mainAxisSize: MainAxisSize.min,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            BoxCard(tit: "Boite 1", access: "Pour tous",adress: "3 rue des Arts",),
                            const Divider(     
                              color: Colors.white,
                              thickness: 0.2,
                            ),
                            BoxCard(tit: "Boite 2", access: "Pour tous",adress: "14 rue des loups",),
                            const Divider(
                              color: Colors.white,
                              thickness: 0.2,
                            ),
                            BoxCard(tit: "Boite 3", access: "Pour tous",adress: "1 boulevard de Pouv",),
                            
                      
                            
                          ],
                        
                      ),
                  ),
                ),
                ),
              ),
        
    );
  
  }
}

class BoxCard extends StatelessWidget {
  BoxCard({required this.tit, required this.adress, required this.access});

  final String tit;
  final String adress;
  final String access;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(tit),
            leading: Icon(Icons.book),
            subtitle: Text("Adresse : $adress\n accéssibilié : $access"),
          ),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                              onPressed: (){
                  //Navigator.popAndPushNamed(context, "/com");
                  var route =  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        espaceCom(box: tit),
                  );
                  Navigator.of(context).push(route);
                              },
                              child: Text("Voir Commentaire",style: TextStyle(fontSize: 12)),
                              style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(width: 2, color: Colors.orange)),
                    foregroundColor: MaterialStateProperty.all(Colors.orange),)
                            ),
                  ),
                ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: (){
                  
                  var route =  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CreateCom(box: tit),
                  );
                  Navigator.of(context).push(route);
                              },
                  child: Text("Mettre un commentaire",style: TextStyle(fontSize: 12),),
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(width: 2, color: Colors.orange)),
                    foregroundColor: MaterialStateProperty.all(Colors.orange),)
                ),
              ),
            ),
              ],
            ),
            
        ],
      ),
    );
  }
}