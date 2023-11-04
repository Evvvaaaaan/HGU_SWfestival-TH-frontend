import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hgu_sw_festival/app/page/global_variables.dart';
import 'package:hgu_sw_festival/app/page/posting.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng customStartingLocation = const LatLng(
      36.10408873540691, 129.38860014080998); // New starting location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: customStartingLocation, // Set a new initial location
          zoom: 15,
        ),
        onTap: (LatLng location) {
          setState(() {
            print(
                'Latitude: ${location.latitude}, Longitude: ${location.longitude}');
            globalSelectedLocation = location; // Update the global variable
          });
        },
        markers: globalSelectedLocation != const LatLng(0, 0)
            ? <Marker>{
                Marker(
                  markerId: const MarkerId('selected-location'),
                  position: globalSelectedLocation,
                ),
              }
            : <Marker>{},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: '현재 위치',
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
