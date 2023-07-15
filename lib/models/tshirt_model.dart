import 'package:flutter/material.dart';

class TshirtModel {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final Color color;
  final String gender;
  final double price;
  // final bool isFavourite;
  // final bool isPopular;
  bool isAddedToCart=false;

  TshirtModel(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.description,
      required this.color,
      required this.gender,
      required this.price, 
      // required this.isAddedToCart
      });
}
