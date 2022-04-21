// To parse this JSON data, do
//
//     final fruitResponse = fruitResponseFromJson(jsonString);

import 'dart:convert';

FruitResponse fruitResponseFromJson(String str) =>
    FruitResponse.fromJson(json.decode(str));

String fruitResponseToJson(FruitResponse data) => json.encode(data.toJson());

class FruitResponse {
  FruitResponse({
    this.message,
    this.code,
    this.data,
  });

  String? message;
  int? code;
  Data? data;

  factory FruitResponse.fromJson(Map<String, dynamic> json) => FruitResponse(
        message: json["message"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.imagesReferences,
    required this.fruits,
  });

  Map<String, String> imagesReferences;
  List<Fruit> fruits;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        imagesReferences: Map<String, String>.from(json["imagesReferences"]),
        fruits: List<Fruit>.from(json["fruits"].map((x) => Fruit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "imagesReferences": imagesReferences,
        "fruits": List<dynamic>.from(fruits.map((x) => x.toJson())),
      };
}

class Fruit {
  Fruit({
    required this.name,
    required this.price,
  });

  String name;
  int price;

  factory Fruit.fromJson(Map<String, dynamic> json) => Fruit(
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
      };
}
