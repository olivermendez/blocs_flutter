// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'condition_model.dart';

class Current extends Equatable {
  dynamic lastUpdatedEpoch;
  String? lastUpdated;
  dynamic tempC;
  double? tempF;
  dynamic isDay;
  Condition condition;
  /*
  int? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;
  double? pressureIn;
  double? precipMm;
  int? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  int? windchillC;
  double? windchillF;
  double? heatindexC;
  */

  Current({
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.lastUpdatedEpoch,
    this.isDay,
    required this.condition,
    /*
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    */
  });

  factory Current.fromRawJson(String str) => Current.fromJson(json.decode(str));

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"],
        tempF: json["temp_f"],
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        /*
        windMph: json["wind_mph"],
        windKph: json["wind_kph"],
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"],
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"],
        feelslikeF: json["feelslike_f"],
        windchillC: json["windchill_c"],
        windchillF: json["windchill_f"],
        */
      );

  @override
  List<Object?> get props => [
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        tempF,
        isDay,
        condition,
        /*
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        windchillC,
        windchillF,
        heatindexC,
        */
      ];
}
