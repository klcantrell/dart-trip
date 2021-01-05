import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final Location initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation = const Location(
      latitude: 37.422,
      longitude: -122.084,
    ),
    this.isSelecting = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _selectedLocation;

  void _selectLocation(LatLng selectedLocation) {
    setState(() {
      _selectedLocation = selectedLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your map'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () => _selectedLocation == null
                  ? null
                  : Navigator.of(context).pop(_selectedLocation),
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 16,
        ),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: _selectedLocation == null
            ? null
            : {
                Marker(
                  markerId: MarkerId('m1'),
                  position: _selectedLocation,
                ),
              },
      ),
    );
  }
}
