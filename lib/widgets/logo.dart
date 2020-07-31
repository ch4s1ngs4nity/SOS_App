import 'package:flutter/material.dart';
import 'package:sos_app/constants.dart' as constant;

Widget logoWidget() {
  return new Hero(
      tag: 'logo',
      child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 100.0,
            child: Image.asset(constant.Image.logo),
          )));
}
