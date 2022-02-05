import 'package:flutter/material.dart';
import 'package:youtube_app/components/screens/home/home_screen.dart';
import 'package:youtube_app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primarySwatch: customColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor)),
      home: Home(),
    );
  }
}
