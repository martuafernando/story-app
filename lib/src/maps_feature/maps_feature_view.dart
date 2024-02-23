import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:story_app/src/maps_feature/pick_location_view.dart';

class MapsFeatureView extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapsFeatureView({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<MapsFeatureView> createState() => _MapsfeatureViewState();
}

class _MapsfeatureViewState extends State<MapsFeatureView> {
  final Set<Marker> markers = {};
  late GoogleMapController mapController;
  geo.Placemark? placemark;

  MapType selectedMapType = MapType.normal;

  @override
  void initState() {
    super.initState();

    final location = LatLng(widget.latitude, widget.longitude);
    defineMarker(location);
  }

  void defineMarker(LatLng latLng) async {
    try {
      final info =
          await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      final place = info[0];
      final street = place.street!;
      final address =
          '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      setState(() {
        placemark = place;
      });
      final marker = Marker(
        markerId: const MarkerId("source"),
        position: latLng,
        infoWindow: InfoWindow(
          title: street,
          snippet: address,
        ),
      );
      setState(() {
        markers.clear();
        markers.add(marker);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude),
          ),
          mapType: selectedMapType,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
          markers: markers,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Column(
            children: [
              FloatingActionButton.small(
                onPressed: null,
                child: PopupMenuButton<MapType>(
                  offset: const Offset(0, 54),
                  icon: const Icon(Icons.layers_outlined),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<MapType>>[
                    const PopupMenuItem<MapType>(
                      value: MapType.normal,
                      child: Text('Normal'),
                    ),
                    const PopupMenuItem<MapType>(
                      value: MapType.satellite,
                      child: Text('Satellite'),
                    ),
                    const PopupMenuItem<MapType>(
                      value: MapType.terrain,
                      child: Text('Terrain'),
                    ),
                    const PopupMenuItem<MapType>(
                      value: MapType.hybrid,
                      child: Text('Hybrid'),
                    ),
                  ],
                  onSelected: (MapType item) {
                    setState(() {
                      selectedMapType = item;
                    });
                  },
                ),
              ),
              FloatingActionButton.small(
                heroTag: "zoom-in",
                onPressed: () {
                  mapController.animateCamera(
                    CameraUpdate.zoomIn(),
                  );
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton.small(
                heroTag: "zoom-out",
                onPressed: () {
                  mapController.animateCamera(
                    CameraUpdate.zoomOut(),
                  );
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
        if (placemark == null)
          const SizedBox()
        else
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: PlacemarkWidget(
              placemark: placemark!,
            ),
          ),
      ],
    );
  }
}
