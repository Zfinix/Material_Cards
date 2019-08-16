import 'package:flutter/material.dart';
import 'package:material_cards/model/cardModel.dart';
import 'package:material_cards/providers/homeController.dart';
import 'package:provider/provider.dart';

class NameField extends StatelessWidget {
  final HomeController controller;
  const NameField({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: (val) {
          if (val.isNotEmpty) {
            controller.setNewCard = new CardModel(
              name: val,
              desc: controller?.newCard?.desc ?? null,
              following: controller?.newCard?.following ?? null,
              followers: controller?.newCard?.desc ?? null,
              photos: controller?.newCard?.photos ?? null,
            );
            return null;
          } else {
            return "Field Can't be left Empty";
          }
        },
        decoration: new InputDecoration.collapsed(
          hintText: "Name",
        ),
      ),
    );
  }
}

class DescField extends StatelessWidget {
  final HomeController controller;
  const DescField({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: (val) {
          if (val.isNotEmpty) {
            controller.setNewCard = new CardModel(
              desc: val,
              name: controller?.newCard?.name ?? null,
              following: controller?.newCard?.following ?? null,
              followers: controller?.newCard?.desc ?? null,
              photos: controller?.newCard?.photos ?? null,
            );
            return null;
          } else {
            return "Field Can't be left Empty";
          }
        },
        decoration: new InputDecoration.collapsed(
          hintText: "E.g. UI/UX Designer",
        ),
      ),
    );
  }
}

class PhotosField extends StatelessWidget {
  final HomeController controller;
  const PhotosField({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      validator: (val) {
        if (val.isNotEmpty) {
          controller.setNewCard = new CardModel(
            photos: val,
            desc: controller?.newCard?.desc ?? null,
            following: controller?.newCard?.following ?? null,
            followers: controller?.newCard?.desc ?? null,
            name: controller?.newCard?.name ?? null,
          );
          return null;
        } else {
          return "Field Can't be left Empty";
        }
      },
      decoration: new InputDecoration.collapsed(
        hintText: "755",
      ),
      keyboardType: TextInputType.number,
    );
  }
}

class FollowersField extends StatelessWidget {
  final HomeController controller;
  const FollowersField({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: (val) {
          if (val.isNotEmpty) {
            controller.setNewCard = new CardModel(
              followers: val,
              desc: controller?.newCard?.desc ?? null,
              following: controller?.newCard?.following ?? null,
              name: controller?.newCard?.name ?? null,
              photos: controller?.newCard?.photos ?? null,
            );
            return null;
          } else {
            return "Field Can't be left Empty";
          }
        },
        decoration: new InputDecoration.collapsed(
          hintText: "15.8K",
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class FollowingField extends StatelessWidget {
  final HomeController controller;
  const FollowingField({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: (val) {
          if (val.isNotEmpty) {
            controller.setNewCard = new CardModel(
              following: val,
              desc: controller?.newCard?.desc ?? null,
              name: controller?.newCard?.name ?? null,
              followers: controller?.newCard?.followers ?? null,
              photos: controller?.newCard?.photos ?? null,
            );
            return null;
          } else {
            return "Field Can't be left Empty";
          }
        },
        decoration: new InputDecoration.collapsed(
          hintText: "345",
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
