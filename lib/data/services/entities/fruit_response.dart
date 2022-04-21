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
    this.imagesReferences,
    required this.fruits,
  });

  ImagesReferences? imagesReferences;
  List<Fruit> fruits;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        imagesReferences: ImagesReferences.fromJson(json["imagesReferences"]),
        fruits: List<Fruit>.from(json["fruits"].map((x) => Fruit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "imagesReferences": imagesReferences?.toJson(),
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

class ImagesReferences {
  ImagesReferences({
    required this.apple,
    required this.manggo,
    required this.banana,
    required this.avocado,
    required this.melon,
  });

  String apple;
  String manggo;
  String banana;
  String avocado;
  String melon;

  factory ImagesReferences.fromJson(Map<String, dynamic> json) =>
      ImagesReferences(
        apple: json["apple"],
        manggo: json["manggo"],
        banana: json["banana"],
        avocado: json["avocado"],
        melon: json["melon"],
      );

  Map<String, dynamic> toJson() => {
        "apple": apple,
        "manggo": manggo,
        "banana": banana,
        "avocado": avocado,
        "melon": melon,
      };
}
