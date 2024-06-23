import 'dart:convert';

import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final String region;
  final String country;
  final dynamic lat;
  final dynamic lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"],
        lon: json["lon"],
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  @override
  List<Object?> get props => [
        name,
        region,
        country,
        lat,
        lon,
        tzId,
        localtimeEpoch,
        localtime,
      ];
}
