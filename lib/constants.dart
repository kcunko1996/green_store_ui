import 'package:flutter/material.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const customColor = MaterialColor(
  0xFF0C9869, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: const Color(0xffce5641), //10%
    100: const Color(0xffb74c3a), //20%
    200: const Color(0xffa04332), //30%
    300: const Color(0xff89392b), //40%
    400: const Color(0xff733024), //50%
    500: const Color(0xff5c261d), //60%
    600: const Color(0xff451c16), //70%
    700: const Color(0xff2e130e), //80%
    800: const Color(0xff170907), //90%
    900: const Color(0xff000000), //100%
  },
);

const double kDefaultPadding = 20.0;
