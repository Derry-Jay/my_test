import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/common/screen_layout.dart';
import '../../widgets/common/themed_material_app_bar.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
        appBar: ThemedMaterialAppBar(),
        content: GoogleMap(
          initialCameraPosition:
              CameraPosition(zoom: 12.0, target: LatLng(0, 0)),
          // circles: circles,
          // markers: markers,
          // onMapCreated: (GoogleMapController mapController) {
          //   controller = mapController;
          // },
        ));
  }
}
