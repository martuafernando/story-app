import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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


  MapType selectedMapType = MapType.normal;

  @override
  void initState() {
    super.initState();

    final dicodingOffice = LatLng(widget.latitude, widget.longitude);
    final marker = Marker(
      markerId: const MarkerId("dicoding"),
      position: dicodingOffice,
      onTap: () {
        mapController.animateCamera(
          CameraUpdate.newLatLngZoom(dicodingOffice, 16),
        );
      },
    );
    markers.add(marker);
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
          bottom: 16,
          right: 16,
          child: Column(
            children: [
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
        Positioned(
          top: 16,
          right: 16,
          child: FloatingActionButton.small(
            onPressed: null,
            child: PopupMenuButton<MapType>(
              offset: const Offset(0, 54),
              icon: const Icon(Icons.layers_outlined),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<MapType>>[
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
        ),
      ],
    );
  }
}
