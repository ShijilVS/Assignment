import 'package:flutter/material.dart';

class ColorConstant{
  static Color mainBlack = const Color(0xff000000);
  static Color mainWhite = const Color(0xffe6e6e6);
  static Color mainOrange = const Color(0xffee741f);
  static Color mainBlue = const Color(0xff0e70b9);
  static Color mainGreen = const Color(0xff16b31c);

}
class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff0e70b9, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffe2eef7),//10%
      100: const Color(0xffb7d4ea),//20%
      200: const Color(0xff87b8dc),//30%
      300: const Color(0xff569bce),//40%
      400: const Color(0xff3285c4),//50%
      500: const Color(0xff0e70b9),//60%
      600: const Color(0xff0c68b2),//70%
      700: const Color(0xff0a5daa),//80%
      800: const Color(0xff0853a2),//90%
      900: const Color(0xff044193),//100%
    },
  );
}