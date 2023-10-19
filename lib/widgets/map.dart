import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-22.95217437051774, -47.105212648214405),
    zoom: 14.4746,
  );
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (argument) {
          setState(() {
            markers.add(
              Marker(
                  markerId: MarkerId('Marker${markers.length + 1}'),
                  position: LatLng(argument.latitude, argument.longitude),
                  infoWindow: InfoWindow(
                    title: 'Marker${markers.length + 1}',
                    onTap: () {
                      markers.removeWhere((element) =>
                          element.markerId.value ==
                          'Marker${markers.length + 1}');
                    },
                  ) // InfoWindow padrão
                  ),
            );
          });
        },
        markers: Set<Marker>.from(markers),
      ),
    );
  }
}
