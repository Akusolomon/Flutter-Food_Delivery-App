import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'constant.dart';

class Mapi extends StatefulWidget {
  const Mapi({super.key});

  @override
  State<Mapi> createState() => _MapiState();
}

class _MapiState extends State<Mapi> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_Api_Key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );
   
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      });
      setState(() {});
    }
    
  }

  @override
  void initState() {
   
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(polylineCoordinates);
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition: CameraPosition(target: sourceLocation, zoom: 13.5),
      polylines: {
        Polyline(polylineId: PolylineId("route"), points: polylineCoordinates)
      },
      markers: {
        Marker(
          markerId: MarkerId("source"),
          position: sourceLocation,
        ),
        Marker(
          markerId: MarkerId("destination"),
          position: destination,
        ),
      },
    ));
  }
}
