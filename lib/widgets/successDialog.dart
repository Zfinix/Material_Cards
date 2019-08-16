import 'package:flutter/material.dart';

Future successDialog(_) => showDialog(
    context: _,
    builder: (_) => new AlertDialog(
          title: new Text("Yayyy!!!"),
          content: new Text("A New Card Has been Added"),
        ));
