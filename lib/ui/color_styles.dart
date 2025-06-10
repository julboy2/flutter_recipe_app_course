import 'package:flutter/material.dart';

abstract class ColorStyles {
  // 0x: 16진수 , FF : 투명도를 나타냄
  static const Color black = Color(0xFF000000);
  static const Color gray1 = Color(0xFF484848);
  static const Color gray2 = Color(0xFF797979);
  static const Color gray3 = Color(0xFFa9a9a9);
  static const Color gray4 = Color(0xFFd9d9d9);
  static const Color white = Color(0xFFffffff);

  static const Color primary100 = Color(0xFF129575);
  static const Color primary80 = Color(0xFF71b1a1);
  static const Color primary60 = Color(0xFFafd3ca);
  static const Color primary40 = Color(0xFFdbebe7);
  static const Color primary20 = Color(0xFFf6faf9);

  static const Color secondary100 = Color(0xFFff9c00);
  static const Color secondary80 = Color(0xFFffa61a);
  static const Color secondary60 = Color(0xFFffba4d);
  static const Color secondary40 = Color(0xFFffcb80);
  static const Color secondary20 = Color(0xFFffe1b3);

  static const Color error = Color(0xFFe94a59);
  static const Color warning = Color(0xFFffe1e7);

  static const Color success = Color(0xFF31b057);
  static const Color success10 = Color(0xFFeaf7ee);

  static const Color rating = Color(0xFFffad30);

  static const Color primaryColor = primary100;
  static const Color secondaryColor = secondary100;
  static const Color labelColor = Color(0xFF121212);
}