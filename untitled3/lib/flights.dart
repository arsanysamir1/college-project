import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl_standalone.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:location/location.dart";
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:uuid/uuid.dart';

class flights extends StatefulWidget {
  const flights({Key? key}) : super(key: key);

  @override
  State<flights> createState() => _flightsState();
}

class _flightsState extends State<flights> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (mounted) {
      super.setState(fn);
    }
  }

  Location locationControler = new Location();
  late LatLng intial = LatLng(30.033333, 31.233334);
  late CameraPosition current = CameraPosition(target: intial, zoom: 13);
  LatLng? currerntP = null;
  Location location = new Location();
  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();
  var uid=Uuid();
  String str="123";
  TextEditingController textCollector = TextEditingController();
  TextEditingController textCollector2 = TextEditingController();
  @override
  void initState() {
    super.initState();
    getUserLocation();
    textCollector.addListener(() {});
  }

  Widget build(BuildContext context) {
    
    return Scaffold(
      body: currerntP == null
          ? Center(child: Text("loading..."))
          : Stack(
              children: [
                GoogleMap(
                    onMapCreated: (GoogleMapController controller) =>
                        googleMapController.complete(controller),
                    initialCameraPosition:
                        CameraPosition(target: currerntP!, zoom: 13),
                    markers: {
                      Marker(
                        markerId: MarkerId("new"),
                        position: intial,
                        icon: BitmapDescriptor.defaultMarker,
                      ),
                      Marker(
                        markerId: MarkerId("currentlocation"),
                        position: currerntP!,
                        icon: BitmapDescriptor.defaultMarker,
                      ),
                      Marker(
                        markerId: MarkerId("new"),
                        position: intial,
                        icon: BitmapDescriptor.defaultMarker,
                      ),
                    }),
                Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    height: 130,
                    margin: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: TextField(
                            controller: textCollector,
                            decoration: InputDecoration(
                                icon: Icon(CupertinoIcons.airplane),
                                hintText: "Enter your location"),
                          ),
                        ),TextField(
                          
                          controller: textCollector2,
                          decoration: InputDecoration(
                              icon: Icon(CupertinoIcons.airplane),
                              hintText: "Enter Your Destination"),
                        )
                      ],
                    ))
              ],
            ),
    );
  }

  Future<void> newCamiraPostion(LatLng pos) async {
    GoogleMapController newController = await googleMapController.future;
    CameraPosition newCamiraposition = CameraPosition(target: pos, zoom: 13);
    await newController
        .animateCamera(CameraUpdate.newCameraPosition(newCamiraposition));
  }

  Future<void> getUserLocation() async {
    bool serviceEnabled;
    PermissionStatus permission;
    serviceEnabled = await locationControler.serviceEnabled();
    if (serviceEnabled) {
      print("this" + serviceEnabled.toString());
      serviceEnabled = await locationControler.requestService();
    } else {
      return;
    }
    permission = await locationControler.hasPermission();
    if (permission == PermissionStatus.denied) {
      print("this" + serviceEnabled.toString());
      permission = await locationControler.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }
    locationControler.onLocationChanged.listen((LocationData locationData) {
      if (locationData.latitude != null && locationData.longitude != null) {
        setState(() {
          currerntP = LatLng(locationData.latitude!, locationData.longitude!);
          newCamiraPostion(currerntP!);
        });
      }
    });
  }
}
