import 'dart:convert';

class TrafficResponse {
  TrafficResponse({
    required this.routes,
    required this.waypoints,
    required this.code,
    required this.uuid,
  });

  final List<Route> routes;
  final List<Waypoint> waypoints;
  final String code;
  final String uuid;

  factory TrafficResponse.fromRawJson(String str) => TrafficResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrafficResponse.fromJson(Map<String, dynamic> json) => TrafficResponse(
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        waypoints: List<Waypoint>.from(json["waypoints"].map((x) => Waypoint.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
      };
}

class Route {
  Route({
    required this.weightName,
    required this.weight,
    required this.duration,
    required this.distance,
    required this.legs,
    required this.geometry,
  });

  final String weightName;
  final double weight;
  final double duration;
  final double distance;
  final List<Leg> legs;
  final String geometry;

  factory Route.fromRawJson(String str) => Route.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        weightName: json["weight_name"],
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        geometry: json["geometry"],
      );

  Map<String, dynamic> toJson() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "geometry": geometry,
      };
}

class Leg {
  Leg({
    required this.viaWaypoints,
    required this.admins,
    required this.weight,
    required this.duration,
    required this.steps,
    required this.distance,
    required this.summary,
  });

  final List<dynamic> viaWaypoints;
  final List<Admin> admins;
  final double weight;
  final double duration;
  final List<Step> steps;
  final double distance;
  final String summary;

  factory Leg.fromRawJson(String str) => Leg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        viaWaypoints: List<dynamic>.from(json["via_waypoints"].map((x) => x)),
        admins: List<Admin>.from(json["admins"].map((x) => Admin.fromJson(x))),
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        distance: json["distance"]?.toDouble(),
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "via_waypoints": List<dynamic>.from(viaWaypoints.map((x) => x)),
        "admins": List<dynamic>.from(admins.map((x) => x.toJson())),
        "weight": weight,
        "duration": duration,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
        "distance": distance,
        "summary": summary,
      };
}

class Admin {
  Admin({
    required this.iso31661Alpha3,
    required this.iso31661,
  });

  final String iso31661Alpha3;
  final String iso31661;

  factory Admin.fromRawJson(String str) => Admin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661: json["iso_3166_1"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1_alpha3": iso31661Alpha3,
        "iso_3166_1": iso31661,
      };
}

class Step {
  Step({
    required this.intersections,
    required this.maneuver,
    required this.name,
    required this.duration,
    required this.distance,
    required this.drivingSide,
    required this.weight,
    required this.mode,
    required this.geometry,
    this.destinations,
    this.ref,
  });

  final List<Intersection> intersections;
  final Maneuver maneuver;
  final String name;
  final double duration;
  final double distance;
  final DrivingSide drivingSide;
  final double weight;
  final Mode mode;
  final String geometry;
  final String? destinations;
  final String? ref;

  factory Step.fromRawJson(String str) => Step.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        intersections:
            List<Intersection>.from(json["intersections"].map((x) => Intersection.fromJson(x))),
        maneuver: Maneuver.fromJson(json["maneuver"]),
        name: json["name"],
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        drivingSide: drivingSideValues.map[json["driving_side"]]!,
        weight: json["weight"]?.toDouble(),
        mode: modeValues.map[json["mode"]]!,
        geometry: json["geometry"],
        destinations: json["destinations"],
        ref: json["ref"],
      );

  Map<String, dynamic> toJson() => {
        "intersections": List<dynamic>.from(intersections.map((x) => x.toJson())),
        "maneuver": maneuver.toJson(),
        "name": name,
        "duration": duration,
        "distance": distance,
        "driving_side": drivingSideValues.reverse[drivingSide],
        "weight": weight,
        "mode": modeValues.reverse[mode],
        "geometry": geometry,
        "destinations": destinations,
        "ref": ref,
      };
}

enum DrivingSide { STRAIGHT, RIGHT }

final drivingSideValues =
    EnumValues({"right": DrivingSide.RIGHT, "straight": DrivingSide.STRAIGHT});

class Intersection {
  Intersection({
    required this.entry,
    required this.bearings,
    this.duration,
    this.mapboxStreetsV8,
    this.isUrban,
    required this.adminIndex,
    this.out,
    this.weight,
    required this.geometryIndex,
    required this.location,
    this.intersectionIn,
    this.turnWeight,
    this.turnDuration,
    this.trafficSignal,
    this.stopSign,
    this.lanes,
    this.classes,
    this.tollCollection,
    this.yieldSign,
  });

  final List<bool> entry;
  final List<int> bearings;
  final double? duration;
  final MapboxStreetsV8? mapboxStreetsV8;
  final bool? isUrban;
  final int adminIndex;
  final int? out;
  final double? weight;
  final int geometryIndex;
  final List<double> location;
  final int? intersectionIn;
  final double? turnWeight;
  final double? turnDuration;
  final bool? trafficSignal;
  final bool? stopSign;
  final List<Lane>? lanes;
  final List<ClassElement>? classes;
  final TollCollection? tollCollection;
  final bool? yieldSign;

  factory Intersection.fromRawJson(String str) => Intersection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Intersection.fromJson(Map<String, dynamic> json) => Intersection(
        entry: List<bool>.from(json["entry"].map((x) => x)),
        bearings: List<int>.from(json["bearings"].map((x) => x)),
        duration: json["duration"]?.toDouble(),
        mapboxStreetsV8: json["mapbox_streets_v8"] == null
            ? null
            : MapboxStreetsV8.fromJson(json["mapbox_streets_v8"]),
        isUrban: json["is_urban"],
        adminIndex: json["admin_index"],
        out: json["out"],
        weight: json["weight"]?.toDouble(),
        geometryIndex: json["geometry_index"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
        intersectionIn: json["in"],
        turnWeight: json["turn_weight"]?.toDouble(),
        turnDuration: json["turn_duration"]?.toDouble(),
        trafficSignal: json["traffic_signal"],
        stopSign: json["stop_sign"],
        lanes: json["lanes"] == null
            ? []
            : List<Lane>.from(json["lanes"]!.map((x) => Lane.fromJson(x))),
        classes: json["classes"] == null
            ? []
            : List<ClassElement>.from(json["classes"]!.map((x) => classElementValues.map[x]!)),
        tollCollection: json["toll_collection"] == null
            ? null
            : TollCollection.fromJson(json["toll_collection"]),
        yieldSign: json["yield_sign"],
      );

  Map<String, dynamic> toJson() => {
        "entry": List<dynamic>.from(entry.map((x) => x)),
        "bearings": List<dynamic>.from(bearings.map((x) => x)),
        "duration": duration,
        "mapbox_streets_v8": mapboxStreetsV8?.toJson(),
        "is_urban": isUrban,
        "admin_index": adminIndex,
        "out": out,
        "weight": weight,
        "geometry_index": geometryIndex,
        "location": List<dynamic>.from(location.map((x) => x)),
        "in": intersectionIn,
        "turn_weight": turnWeight,
        "turn_duration": turnDuration,
        "traffic_signal": trafficSignal,
        "stop_sign": stopSign,
        "lanes": lanes == null ? [] : List<dynamic>.from(lanes!.map((x) => x.toJson())),
        "classes": classes == null
            ? []
            : List<dynamic>.from(classes!.map((x) => classElementValues.reverse[x])),
        "toll_collection": tollCollection?.toJson(),
        "yield_sign": yieldSign,
      };
}

enum ClassElement { MOTORWAY, TOLL }

final classElementValues =
    EnumValues({"motorway": ClassElement.MOTORWAY, "toll": ClassElement.TOLL});

class Lane {
  Lane({
    required this.indications,
    this.validIndication,
    required this.valid,
    required this.active,
  });

  final List<DrivingSide> indications;
  final DrivingSide? validIndication;
  final bool valid;
  final bool active;

  factory Lane.fromRawJson(String str) => Lane.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Lane.fromJson(Map<String, dynamic> json) => Lane(
        indications:
            List<DrivingSide>.from(json["indications"].map((x) => drivingSideValues.map[x]!)),
        validIndication: drivingSideValues.map[json["valid_indication"]]!,
        valid: json["valid"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "indications": List<dynamic>.from(indications.map((x) => drivingSideValues.reverse[x])),
        "valid_indication": drivingSideValues.reverse[validIndication],
        "valid": valid,
        "active": active,
      };
}

class MapboxStreetsV8 {
  MapboxStreetsV8({
    required this.mapboxStreetsV8Class,
  });

  final MapboxStreetsV8Class mapboxStreetsV8Class;

  factory MapboxStreetsV8.fromRawJson(String str) => MapboxStreetsV8.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MapboxStreetsV8.fromJson(Map<String, dynamic> json) => MapboxStreetsV8(
        mapboxStreetsV8Class: mapboxStreetsV8ClassValues.map[json["class"]]!,
      );

  Map<String, dynamic> toJson() => {
        "class": mapboxStreetsV8ClassValues.reverse[mapboxStreetsV8Class],
      };
}

enum MapboxStreetsV8Class {
  TERTIARY,
  SECONDARY,
  STREET,
  PRIMARY,
  PRIMARY_LINK,
  MOTORWAY_LINK,
  MOTORWAY
}

final mapboxStreetsV8ClassValues = EnumValues({
  "motorway": MapboxStreetsV8Class.MOTORWAY,
  "motorway_link": MapboxStreetsV8Class.MOTORWAY_LINK,
  "primary": MapboxStreetsV8Class.PRIMARY,
  "primary_link": MapboxStreetsV8Class.PRIMARY_LINK,
  "secondary": MapboxStreetsV8Class.SECONDARY,
  "street": MapboxStreetsV8Class.STREET,
  "tertiary": MapboxStreetsV8Class.TERTIARY
});

class TollCollection {
  TollCollection({
    required this.name,
    required this.type,
  });

  final String name;
  final String type;

  factory TollCollection.fromRawJson(String str) => TollCollection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TollCollection.fromJson(Map<String, dynamic> json) => TollCollection(
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
      };
}

class Maneuver {
  Maneuver({
    required this.type,
    required this.instruction,
    required this.bearingAfter,
    required this.bearingBefore,
    required this.location,
    this.modifier,
  });

  final String type;
  final String instruction;
  final int bearingAfter;
  final int bearingBefore;
  final List<double> location;
  final String? modifier;

  factory Maneuver.fromRawJson(String str) => Maneuver.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Maneuver.fromJson(Map<String, dynamic> json) => Maneuver(
        type: json["type"],
        instruction: json["instruction"],
        bearingAfter: json["bearing_after"],
        bearingBefore: json["bearing_before"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
        modifier: json["modifier"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "instruction": instruction,
        "bearing_after": bearingAfter,
        "bearing_before": bearingBefore,
        "location": List<dynamic>.from(location.map((x) => x)),
        "modifier": modifier,
      };
}

enum Mode { DRIVING }

final modeValues = EnumValues({"driving": Mode.DRIVING});

class Waypoint {
  Waypoint({
    required this.distance,
    required this.name,
    required this.location,
  });

  final double distance;
  final String name;
  final List<double> location;

  factory Waypoint.fromRawJson(String str) => Waypoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
        distance: json["distance"]?.toDouble(),
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
