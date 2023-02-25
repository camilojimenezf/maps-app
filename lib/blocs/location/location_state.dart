part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool followingUser;
  final LatLng? lastKnownLocation;
  final List<LatLng> myLocationHistory;

  const LocationState({
    this.followingUser = true,
    this.lastKnownLocation,
    this.myLocationHistory = const [],
  });

  LocationState copyWith({
    followingUser,
    lastKnownLocation,
    myLocationHistory,
  }) =>
      LocationState(
        followingUser: followingUser ?? this.followingUser,
        lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
        myLocationHistory: myLocationHistory ?? this.myLocationHistory,
      );

  @override
  List<Object?> get props => [followingUser, lastKnownLocation, myLocationHistory];
}
