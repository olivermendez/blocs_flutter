import 'dart:convert';

import 'package:equatable/equatable.dart';

class Condition extends Equatable {
  final String text;
  final String icon;
  final int code;

  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromRawJson(String str) =>
      Condition.fromJson(json.decode(str));

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"].replaceAll(RegExp(r'^//'), 'https://'),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };

  @override
  List<Object?> get props => [text, icon, code];
}
