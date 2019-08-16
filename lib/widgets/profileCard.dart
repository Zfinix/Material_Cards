import 'package:flutter/material.dart';
import 'package:material_cards/model/cardModel.dart';
import 'package:material_cards/providers/homeController.dart';
import 'package:material_cards/utils/margin.dart';
import 'package:material_cards/views/addCardPage.dart';

class ProfileCard extends StatelessWidget {
  final CardModel cardModel;
  final HomeController controller;
  const ProfileCard({
    Key key,
    @required this.cardModel,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned.fill(
          child: Container(
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
        child: Column(
          children: <Widget>[
            const YMargin(30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image(
                height: 160,
                width: 160,
                image: AssetImage('assets/other.png'),
              ),
            ),
            const YMargin(30),
            Text(
              cardModel?.name ?? '',
              style: TextStyle(
                fontSize: 22,
                color: Colors.pink,
                fontWeight: FontWeight.w300,
              ),
            ),
            const YMargin(10),
            Container(
              width: 200,
              child: Text(
                cardModel?.desc ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  height: 1.1,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const YMargin(20),
            Divider(),
            const YMargin(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _RowTile(
                  value: '${cardModel.photos}',
                  title: 'Photos',
                ),
                const CustomYDiv(),
                _RowTile(
                  value: '${cardModel.followers}K',
                  title: 'Followers',
                ),
                const CustomYDiv(),
                _RowTile(
                  value: '${cardModel.following}',
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
          ],
        ),
        margin: const EdgeInsets.only(bottom: 50.0),
        width: double.infinity,
      )),
      Align(
        alignment: Alignment.bottomCenter,
        child: FAB(controller: controller),
      )
    ]);
  }
}

class FAB extends StatelessWidget {
  final HomeController controller;

  const FAB({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.pink,
          heroTag: null,
          elevation: 4,
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new AddCard(controller)));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
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
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              height: 70,
              width: 70,
            ),
          ),
        ),
      ),
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
  final String value, title;
  const _RowTile({
    Key key,
    @required this.value,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '$value',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
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
    );
  }
}
