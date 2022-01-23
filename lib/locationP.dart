import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationP {

  double latitude = 0;

  double longitude = 0;

  Future<void> getLocation() async {
    Location location = new Location();
    LocationData _locationData;
  

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    
    latitude =  _locationData.latitude ?? 0;
    longitude = _locationData.longitude ?? 0;

  }


  
  /* Not working 
  Future<void> getRealTimeLocation() async {
    try{
      Geolocator.getPositionStream().listen((position) {
        latitude = position.latitude;
      longitude = position.longitude; 
      });
    }catch (e){
      print(e);

    }
  }
  */

  /*
  Future<void> getLocationP() async {
    try {

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best,);
      
      latitude = position.latitude;
      longitude = position.longitude;   
    }catch (e){
      print(e);

    }

  }*/

}