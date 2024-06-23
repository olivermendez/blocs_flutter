import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'current_model.dart';
import 'location_model.dart';

class Weather extends Equatable {
  final Location location;
  final Current current;

  const Weather({
    required this.location,
    required this.current,
  });

  factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
      );

  @override
  List<Object?> get props => [location, current];
}
