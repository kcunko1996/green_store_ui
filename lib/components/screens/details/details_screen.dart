import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube_app/constants.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconsWithPicture(size: size),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Angleica\n",
                        style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    TextSpan(
                        text: "Russia\n",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ])),
                  Spacer(),
                  Text("\$400", style: TextStyle(fontSize: 18))
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: DetailsBottomNavigation(size: size),
    );
  }
}

class IconsWithPicture extends StatelessWidget {
  const IconsWithPicture({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      child: SizedBox(
        height: size.height * 0.79,
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        icon: SvgPicture.asset("assets/icons/back_arrow.svg")),
                  ),
                  Spacer(),
                  IconCard(
                    size: size,
                    image: "assets/icons/sun.svg",
                  ),
                  IconCard(
                    size: size,
                    image: "assets/icons/icon_2.svg",
                  ),
                  IconCard(
                    size: size,
                    image: "assets/icons/icon_3.svg",
                  ),
                  IconCard(
                    size: size,
                    image: "assets/icons/icon_4.svg",
                  ),
                ],
              ),
            )),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(64),
                      bottomLeft: Radius.circular(64)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 60,
                        color: kPrimaryColor.withOpacity(0.29))
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                      image: AssetImage("assets/images/img.png"))),
            )
          ],
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53,
      height: 53,
      padding: EdgeInsets.all(kDefaultPadding / 2),
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: kPrimaryColor.withOpacity(0.22),
                blurRadius: 22,
                offset: Offset(0, 15)),
            BoxShadow(
                color: Colors.white, blurRadius: 20, offset: Offset(-15, -15))
          ]),
      child: SvgPicture.asset(image),
    );
  }
}

class DetailsBottomNavigation extends StatelessWidget {
  const DetailsBottomNavigation({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.09,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            // color: kPrimaryColor,
            width: size.width / 2,
            height: size.height * 0.09,
            child: FlatButton(
              child: Text(
                "Buy now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20))),
              color: kPrimaryColor,
            ),
          ),
          Container(
            child: FlatButton(
              child: SizedBox(
                child: Text("Cancle"),
              ),
              onPressed: () {},
            ),
            width: size.width / 2,
          ),
        ],
      ),
    );
  }
}
