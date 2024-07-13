import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle styles40(context) => const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w400,
      fontFamily: "DM Serif Display");

  static TextStyle styles15(context) => const TextStyle(
      fontFamily: 'Roboto', fontSize: 15, fontWeight: FontWeight.w300);
}
