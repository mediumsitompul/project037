import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child:
                  Text("Google Map, Stack &\n(Marker ClipOval Multi Layer)")),
        ),
        body: MyMarker(),
      ),
    );
  }
}

class MyMarker extends StatefulWidget {
  const MyMarker({super.key});

  @override
  State<MyMarker> createState() => _MyMarkerState();
}

class _MyMarkerState extends State<MyMarker> {
  LatLng cameraPosition1 = LatLng(0.0, 0.0);
  Set<Marker> marker1 = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: cameraPosition1,
              zoom: 1,
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.center,
            child: _getMarker(),
          ))
        ],
      ),
    );
  }

//.......................................
  Widget _getMarker() {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
                color: Colors.deepOrange,
                offset: Offset(1, 1),
                spreadRadius: 6,
                blurRadius: 16)
          ]),
      child: ClipOval(
        child: Image.asset("assets/profile.jpg"),
      ),
    );
  }

//.......................................
}
