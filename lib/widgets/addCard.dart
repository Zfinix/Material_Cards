import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_cards/model/cardModel.dart';
import 'package:material_cards/providers/homeController.dart';
import 'package:material_cards/utils/margin.dart';
import 'package:provider/provider.dart';

import 'addCardTextFields.dart';
import 'successDialog.dart';

class AddProfileCard extends StatelessWidget {
  final HomeController controller;
  const AddProfileCard({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: Colors.white,
              boxShadow: [
                new BoxShadow(
                  offset: Offset(-4, 2),
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Form(
              key: controller.formKey,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  const YMargin(30),
                  Container(
                    child: Image(
                      height: 160,
                      width: 160,
                      image: AssetImage('assets/other.png'),
                    ),
                  ),
                  const YMargin(30),
                  NameField(controller: controller),
                  const YMargin(10),
                  DescField(controller: controller),
                  const YMargin(20),
                  Divider(),
                  const YMargin(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _RowTile(
                        value: PhotosField(controller: controller),
                        title: 'Photos',
                      ),
                      const CustomYDiv(),
                      _RowTile(
                        value: FollowersField(controller: controller),
                        title: 'Followers',
                      ),
                      const CustomYDiv(),
                      _RowTile(
                        value: FollowingField(controller: controller),
                        title: 'Following',
                      ),
                    ],
                  ),
                  const YMargin(20),
                  Divider(),
                  const YMargin(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SocialIcons(image: 'twitter'),
                      SocialIcons(image: 'ig'),
                      SocialIcons(image: 'facebook'),
                      SocialIcons(image: 'google')
                    ],
                  ),
                  const YMargin(60),
                  AddButton(controller),
                ],
              ),
            ),
            margin: EdgeInsets.only(bottom: 30.0),
          ),
        ]),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final HomeController controller;
  AddButton(this.controller);
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: 0.6,
      padding: EdgeInsets.symmetric(vertical: 20),
      borderRadius: BorderRadius.circular(2),
      color: Colors.pink,
      child: Text(
        'ADD NEW CARD',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      onPressed: ()async {
        if (controller.formKey.currentState.validate())  {
          controller.addCard();
          await successDialog(context);
        }
      },
    );
  }
}

class SocialIcons extends StatelessWidget {
  final String image;
  const SocialIcons({
    this.image,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Image.asset(
      'assets/$image.png',
      scale: 1.8,
    );
  }
}

class CustomYDiv extends StatelessWidget {
  const CustomYDiv({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      width: 1,
      height: 40,
    );
  }
}

class _RowTile extends StatelessWidget {
  final Widget value;
  final String title;
  const _RowTile({
    Key key,
    @required this.value,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: Column(
        children: <Widget>[
          value ?? Container(),
          const YMargin(6),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
