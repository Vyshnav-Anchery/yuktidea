// To parse this JSON data, do
//
//     final termsModel = termsModelFromJson(jsonString);

import 'dart:convert';

TermsModel termsModelFromJson(String str) =>
    TermsModel.fromJson(json.decode(str));

String termsModelToJson(TermsModel data) => json.encode(data.toJson());

class TermsModel {
  bool? status;
  String? message;
  Data? data;

  TermsModel({
    this.status,
    this.message,
    this.data,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? title;
  String? content;
  DateTime? publishedAt;
  int? enabled;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.title,
    this.content,
    this.publishedAt,
    this.enabled,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        enabled: json["enabled"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "published_at": publishedAt?.toIso8601String(),
        "enabled": enabled,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
