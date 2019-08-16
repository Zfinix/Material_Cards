import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Drawer drawer;
  const GradientScaffold({
    this.body,
    this.title,
    this.drawer,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 249, 249, 1),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          '${title ?? ''}',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Color.fromRGBO(247, 84, 149, 1),
      ),
      drawer: drawer,
      body: Container(
        height: double.infinity,
        width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.2, 0.9],
            colors: [
              Color.fromRGBO(247, 84, 149, 1),
              Theme.of(context).primaryColor
            ],
          )),
          child: Container(child: body ?? Container())),
    );
  }
}
