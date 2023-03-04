import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/blocs/blocs.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Polyline> polylines;

  const MapView({
    Key? key,
    required this.initialLocation,
    required this.polylines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    CameraPosition cameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15,
    );

    final size = MediaQuery.of(context).size;

    void onMapCreated(GoogleMapController googleMapController) {
      mapBloc.add(OnMapInitializedEvent(googleMapController));
    }

    void onCameraMove(CameraPosition position) {
      mapBloc.mapCenter = position.target;
    }

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerMove: (_) => mapBloc.add(OnStopFollowingUserEvent()),
        child: GoogleMap(
          initialCameraPosition: cameraPosition,
          compassEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          polylines: polylines,
          onMapCreated: onMapCreated,
          onCameraMove: onCameraMove,
        ),
      ),
    );
  }
}
