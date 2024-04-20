// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  bool? status;
  String? message;
  List<Datum>? data;

  CountryModel({
    this.status,
    this.message,
    this.data,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? name;
  String? code;
  String? telCode;
  String? timezone;
  String? flag;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.code,
    this.telCode,
    this.timezone,
    this.flag,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        telCode: json["tel_code"],
        timezone: json["timezone"],
        flag: json["flag"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "tel_code": telCode,
        "timezone": timezone,
        "flag": flag,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
