import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:material_cards/model/cardModel.dart';
import 'package:material_cards/providers/homeController.dart';
import 'package:material_cards/utils/margin.dart';
import 'package:material_cards/widgets/gradientScaffold.dart';
import 'package:material_cards/widgets/profileCard.dart';
import 'package:provider/provider.dart';

import 'addCardPage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage();
  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<HomeController>(context);
    return new GradientScaffold(
        title: "PROFILE",
        drawer: Drawer(),
        body: _controller.cardList.length > 0
            ? ListView(
                children: <Widget>[
                  _Slider(_controller),
                  const YMargin(10),
                ],
              )
            : AddButton(_controller));
  }
}

class AddButton extends StatelessWidget {
  AddButton(this.controller);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MaterialButton(
          elevation: 1,
          height: 50,
          minWidth: 150,
          textColor: Colors.pink,
          color: Colors.white,
          child: Text('ADD CARD'),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new AddCard(controller)));
          },
        ),
      ],
    );
  }
}

class _Slider extends StatelessWidget {
  final HomeController controller;

  const _Slider(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      child: Swiper(
        scrollDirection: Axis.horizontal,
        
        itemBuilder: (BuildContext context, int i) {
          return new ProfileCard(
            cardModel: controller.cardList[i],
            controller: controller,
          );
        },
        itemCount: controller.cardList.length ?? 0,
        itemWidth: MediaQuery.of(context).size.width * 0.9,
        layout: controller.cardList.length < 1 ? null : SwiperLayout.STACK,
      ),
    );
  }
}
