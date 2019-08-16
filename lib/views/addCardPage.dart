import 'package:flutter/material.dart';
import 'package:material_cards/model/cardModel.dart';
import 'package:material_cards/providers/homeController.dart';
import 'package:material_cards/utils/margin.dart';
import 'package:material_cards/widgets/addCard.dart';
import 'package:material_cards/widgets/gradientScaffold.dart';

class AddCard extends StatelessWidget {
  final HomeController controller;
  const AddCard(this.controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GradientScaffold(
      title: "ADD CARD",
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.2, 0.9],
          colors: [
            Color.fromRGBO(247, 84, 149, 1),
            Theme.of(context).primaryColor,
          ],
        )),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const YMargin(20),
              Flexible(
                child: AddProfileCard(
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
