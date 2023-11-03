import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/services/api/addresses_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

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
    super.initState();
    getMarkers();
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
        markers: Set<Marker>.from(markers),
        circles: {areaCircle},
      ),
    );
  }

  Future<void> getMarkers() async {
    final addressList = await AddressesApiService().getAddresses();

    final markerList = addressList.map((address) {
      return Marker(
        markerId: MarkerId(address.cep ?? ''),
        position: LatLng(
          address.latitude ?? 0.0,
          address.longitude ?? 0.0,
        ),
        infoWindow: InfoWindow(
          title: address.logradouro ?? '',
          snippet: address.bairro ?? '',
        ),
      );
    }).toList();

    setState(() {
      markers = markerList;
    });

    await getCoordinates();
  }

  Future<void> getCoordinates() async {
    final circle = await AddressesApiService().getDeliveryArea();
    setState(() => areaCircle = circle);
  }
}
