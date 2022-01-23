// ignore_for_file: prefer_const_constructors, file_names


import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'locationP.dart';


import 'comMap.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({ Key? key }) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();

}

class _GoogleMapScreenState extends State<GoogleMapScreen> {


  
  late GoogleMapController googleMapController ;

  final BitmapDescriptor icon =  BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
  
  
  
  void _onMapCreater (GoogleMapController controller){
    googleMapController = controller;
    
  }

  // Custom marker from asset image

  //static late BitmapDescriptor mapMarker; 

  /*void setCustomMarker()  {
    
    //await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/markerBlue.png').then((d){ mapMarker = d;});
  }*/

  @override
  void initState (){
    super.initState();
    
   
    //setCustomMarker(); 
    
    
  }
   
 
  // ignore: prefer_final_fields
  Set<Marker> _marker = {
    
     Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(50.37210738012905,3.077964133548412),
          infoWindow: const InfoWindow(title: "Boîte 3"), 
          
        ),
        Marker(
          markerId: MarkerId('boite-1'),
          position: LatLng(50.36667,3.06667),
          infoWindow: const InfoWindow(title: "Boîte 1"),
        ),
        Marker(
          markerId: MarkerId('boite-2'),
          position: LatLng(50.367793265385316,3.08050155594401089),
          infoWindow: const InfoWindow(title: "Boîte 2"),
        ),
  };



  LocationP location = LocationP();

 


  

  // not working 
  /*void getRealTimeLocation() async {
    
    
    await location.getRealTimeLocation();
    setState(() {
      lat = location.latitude;
      lng = location.longitude;
    });
    
  }*/

  void getcurrentLocation() async {
    
    await location.getLocation();
    

    setState(() {
      _marker.add(
    
      Marker(
          markerId: MarkerId('You'),
          position: LatLng(location.latitude,location.longitude),
          icon : icon,
          infoWindow: const InfoWindow(title: "You"),
          
          
        ),
    );
    });
    
    
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Stack(
        children: <Widget>[ 

          GoogleMap(
          
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          onMapCreated: _onMapCreater,
          markers: _marker,
              
          initialCameraPosition: CameraPosition(
            target: LatLng(50.3675677,3.0804641),
            zoom: 15,
            ),
          
          ),
          pop_window(p: 0, k: 120)
        ]
      ),
        
        floatingActionButton: FloatingActionButton(
          
          child: const Icon(Icons.center_focus_strong),
           onPressed: () => googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target : LatLng(50.3675677,3.0804641),
                  zoom: 14,
                )
              )
            ),
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      

    );
  }


}

