import 'package:flutter/material.dart';

class CardModel {
  final String name;
  final String desc;
  final String photos;
  final String followers;
  final String following;

  const CardModel(
      {@required this.photos,
      @required this.followers,
      @required this.following,
      @required this.name,
      @required this.desc});
}
