import 'package:flutter/material.dart';

class Mapinfo extends StatefulWidget {
  const Mapinfo({ Key? key }) : super(key: key);

  @override
  _MapinfoState createState() => _MapinfoState();
}

class _MapinfoState extends State<Mapinfo> {


  @override
  Widget build(BuildContext context) {

    return Hero(
      tag: 'info',
      child: Container(
                margin: EdgeInsets.all(20),
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 20,
                        offset: Offset.zero,
                        color: Colors.grey.withOpacity(0.5),
                      )
                    ])),
    );
  }
}