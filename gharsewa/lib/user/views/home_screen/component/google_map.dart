import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget buildMap() {
    return Container(
      height: 200, // Adjust the height of the map as needed
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: const LatLng(37.422, -122.084), // Replace with your location coordinates
          zoom: 15, // Adjust the zoom level as needed
        ),
        markers: {
          Marker(
            markerId: const MarkerId('your-location'),
            position: const LatLng(37.422, -122.084), // Replace with your location coordinates
          ),
        },
        zoomControlsEnabled: false,
        scrollGesturesEnabled: false,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
      ),
    );
  }
