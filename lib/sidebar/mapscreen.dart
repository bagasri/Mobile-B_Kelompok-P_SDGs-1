import 'package:flutter/material.dart';
import 'dart:math' as mathdart;
import 'package:mapbox_gl/mapbox_gl.dart' as mb;
import 'package:geolocator/geolocator.dart' as geo;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var token =
      'pk.eyJ1IjoicHJhZGFuYXJpemtpIiwiYSI6ImNrand6NzVuNDBjdGgyb253azhuZGJ4NXIifQ.6bWIvnujOhxTbSYlptcf3g';

  mb.MapboxMapController mapController;
  mb.LatLng gpsLoc;
  mb.Circle curPosCircle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map Screen')),
      body: Center(
        child: Column(
          children: [
            buildMap(),
            // buildBtnBottomRow(),
          ],
        ),
      ),
    );
  }

  Widget buildMap() {
    return Container(
      height: 600,
      child: mb.MapboxMap(
        accessToken: token,
        styleString: 'mapbox://styles/mapbox/navigation-preview-night-v4',
        initialCameraPosition: mb.CameraPosition(
          target: mb.LatLng(-8.1766639, 113.6916075),
          zoom: 8,
        ),
        onMapCreated: mapCreated,
        onMapClick: mapClicked,
      ),
    );
  }

  void mapClicked(mathdart.Point<double> point, mb.LatLng latLng) {
    if (mapController != null) {
      mapController.addCircle(
        mb.CircleOptions(
          circleRadius: 8,
          circleColor: 'green',
          circleOpacity: 1,
          geometry: latLng,
          draggable: false,
        ),
      );
    }
  }

  void mapCreated(mb.MapboxMapController controller) {
    mapController = controller;
    print('map created');

    var lokasi = mb.LatLng(-8.1766639, 113.6916075);

    mapController.addCircle(mb.CircleOptions(
      circleRadius: 80,
      circleColor: 'blue',
      circleOpacity: 1,
      geometry: lokasi,
      draggable: false,
    ));
    // checPermissionGps();
  }

  void checPermissionGps() {
    print('CHECK LOKASI');
    geo.Geolocator.isLocationServiceEnabled().then((bool isEnabled) {
      print("Location enabled?: $isEnabled");
      // if (isEnabled == false) {
      //   msgLocError("Layanan lokasi tidak tersedia");
      // }
      // else {
      //   geo.Geolocator.checkPermission().then((geo.LocationPermission locPerm){
      //     if (locPerm == geo.LocationPermission.deniedForever){
      //       msgLocError("Layanan lokasi tidak tersedia");
      //     }
      //     else if (locPerm == geo.LocationPermission.denied){
      //       geo.Geolocator.requestPErmission().then((geo.LocationPermission permRes){
      //         if (permRes == geo.LocationPermission.whileInUse|| permRes == geo.LocationPermission.always){
      //           getCurrentLoc();
      //         }else{
      //           msgLocError('User tidak mengizinkan akses ');
      //         }
      //       });
      //     }
      //   });
      // }
    });
  }

  void getCurrentLoc() {
    geo.Geolocator.getCurrentPosition().then((geo.Position pos) {
      if (mapController != null) {
        gpsLoc = mb.LatLng(pos.latitude, pos.longitude);
        var newCamLoc = mb.CameraUpdate.newLatLng(gpsLoc);
        mapController.animateCamera(newCamLoc);

        mapController.addCircle(mb.CircleOptions(
          geometry: gpsLoc,
          circleColor: 'yellow',
          circleStrokeColor: 'black',
          circleStrokeWidth: 1,
          circleRadius: 10,
          draggable: false,
        ));
      }
    });
  }
}