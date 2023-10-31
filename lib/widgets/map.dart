import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/api/addresses_api.dart';
import 'package:flutter_app/models/address.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(-22.95217437051774, -47.105212648214405),
    zoom: 14.4746,
  );
  List<Marker> markers = [];
  Circle areaCircle = const Circle(circleId: CircleId(''));

  @override
  void initState() {
    getMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: initialPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (marker) async {
              // setState(() {
              //   markers.add(
              //     Marker(
              //         markerId: MarkerId('Marker${markers.length + 1}'),
              //         position: marker,
              //         infoWindow: InfoWindow(
              //           title: 'Marker${markers.length + 1}',
              //           snippet: '${marker.latitude},${marker.longitude}',
              //         ) // InfoWindow padrão
              //         ),
              //   );
              // });
            },
            markers: Set<Marker>.from(markers),
            circles: {areaCircle}));
  }

  Future<List<Marker>> getMarkers() async {
    List<Address> addressList = await AddressesApiService().getAddresses();

    List<Marker> markerList = addressList
        .map(
          (address) => Marker(
            markerId: MarkerId(address.cep ?? ''),
            position: LatLng(
              address.latitude ?? 0.0,
              address.longitude ?? 0.0,
            ),
            infoWindow: InfoWindow(
              title: address.logradouro ?? '',
              snippet: address.bairro ?? '',
            ),
          ),
        )
        .toList();

    setState(() {
      markers = markerList;
    });
    getCoordinates();

    return markerList;
  }

  Future<void> getCoordinates() async {
    final circle = await AddressesApiService().getDeliveryArea();
    setState(() => areaCircle = circle);
  }
}
