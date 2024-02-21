import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

class PickLocationView extends StatefulWidget {
  final Function(LatLng) onLocationSelected;

  const PickLocationView({
    super.key,
    required this.onLocationSelected
  });

  @override
  State<PickLocationView> createState() => _MapsfeatureViewState();
}

class _MapsfeatureViewState extends State<PickLocationView> {
  final Set<Marker> markers = {};
  late GoogleMapController mapController;
  final dicodingOffice = const LatLng(-6.1753924, 106.8271528);
  geo.Placemark? placemark;

  MapType selectedMapType = MapType.normal;

  void defineMarker(LatLng latLng, String street, String address) {
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
    widget.onLocationSelected(latLng);
  }

  void onMyLocationButtonPress() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      placemark = place;
    });
    defineMarker(latLng, street, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  @override
  void initState() {
    super.initState();

    final marker = Marker(
      markerId: const MarkerId("dicoding"),
      position: const LatLng(0, 0),
      onTap: () {
        mapController.animateCamera(
          CameraUpdate.newLatLngZoom(const LatLng(0, 0), 16),
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
          myLocationEnabled: true,
          initialCameraPosition: const CameraPosition(
            target: LatLng(0, 0),
          ),
          mapType: selectedMapType,
          onMapCreated: (controller) async {
            final info = await geo.placemarkFromCoordinates(
                dicodingOffice.latitude, dicodingOffice.longitude);
            final place = info[0];
            final street = place.street!;
            final address =
                '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
            setState(() {
              placemark = place;
            });
            defineMarker(dicodingOffice, street, address);

            setState(() {
              mapController = controller;
            });
          },
          markers: markers,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          onLongPress: (LatLng latLng) {
            onLongPressGoogleMap(latLng);
          },
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
        Positioned(
          top: 16,
          right: 16,
          child: FloatingActionButton(
            child: const Icon(Icons.my_location),
            onPressed: () {
              onMyLocationButtonPress();
            },
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

  void onLongPressGoogleMap(LatLng latLng) async {
    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      placemark = place;
    });
    defineMarker(latLng, street, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }
}

class PlacemarkWidget extends StatelessWidget {
  const PlacemarkWidget({
    super.key,
    required this.placemark,
  });
  final geo.Placemark placemark;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 700),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            offset: Offset.zero,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  placemark.street!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
