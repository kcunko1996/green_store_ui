import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube_app/components/screens/details/details_screen.dart';
import 'package:youtube_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        HeaderWithSearchBox(size: size),
        TitleWithMoreBtn("Recommended"),
        RecommendedPlants(),
        TitleWithMoreBtn("Featured Plants"),
        FeaturePlants(),
        SizedBox(
          height: kDefaultPadding,
        )
      ],
    ));
  }
}

class FeaturePlants extends StatelessWidget {
  const FeaturePlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FeaturePlantCard("assets/images/bottom_img_1.png"),
            FeaturePlantCard("assets/images/bottom_img_2.png"),
          ],
        ));
  }
}

class FeaturePlantCard extends StatelessWidget {
  String image;
  FeaturePlantCard(this.image);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2),
      width: size.width * 0.7,
      height: 185,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(image: AssetImage(image), fit: BoxFit.fitWidth)),
    );
  }
}

class TitleWithMoreBtn extends StatelessWidget {
  String title;
  TitleWithMoreBtn(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      child: Row(
        children: [
          TitleWithCustomeUnderline(
            text: title,
          ),
          Spacer(),
          FlatButton(
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Text(
                'More',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

class RecommendedPlants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(bottom: 50),
        child: Row(
          children: [
            RecomendedPlantCard(
              image: "assets/images/image_1.png",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DetailsScreen()));
              },
              title: "Plant 1",
              country: "CRO",
              price: 12,
            ),
            RecomendedPlantCard(
              image: "assets/images/image_3.png",
              press: () {
                print("Heelo");
              },
              title: "Plant 2",
              country: "GER",
              price: 11,
            ),
            RecomendedPlantCard(
              image: "assets/images/image_2.png",
              press: () {
                print("Heelo");
              },
              title: "Plant 3",
              country: "USA",
              price: 13,
            ),
          ],
        ),
      ),
    );
  }
}

class RecomendedPlantCard extends StatelessWidget {
  RecomendedPlantCard(
      {key,
      required this.country,
      required this.image,
      required this.price,
      required this.press,
      required this.title});
  String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(press);
    return InkWell(
      onTap: () => {
        //  Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (BuildContext context) => DetailsScreen()));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsScreen()))
      },
      child: Container(
        width: size.width * 0.4,
        margin:
            EdgeInsets.only(top: kDefaultPadding / 2, left: kDefaultPadding),
        child: Column(
          children: [
            Image.asset(image),
            Container(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(kDefaultPadding / 2),
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.2)),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '$title'.toUpperCase(),
                                  style: Theme.of(context).textTheme.button),
                            ])),
                        RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '$country'.toUpperCase(),
                                  style: TextStyle(
                                      color: kPrimaryColor.withOpacity(0.2))),
                            ]))
                      ],
                    ),
                    Spacer(),
                    Text(
                      '\$$price',
                      style: TextStyle(color: kPrimaryColor),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleWithCustomeUnderline extends StatelessWidget {
  const TitleWithCustomeUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding / 4),
          child: Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 7,
              margin: const EdgeInsets.only(left: kDefaultPadding / 4),
              color: kPrimaryColor.withOpacity(0.2),
            ))
      ],
    );
  }
}

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.2 - 27,
            padding: EdgeInsets.only(
                right: kDefaultPadding,
                left: kDefaultPadding,
                bottom: kDefaultPadding + 36),
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: Row(
              children: <Widget>[
                Text("Hello Guest",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                Spacer(),
                Image.asset('assets/images/logo.png'),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 55,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: kPrimaryColor.withOpacity(0.23),
                        blurRadius: 53,
                        offset: Offset(0, 10))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(36))),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: kPrimaryColor.withOpacity(0.28))),
                  ),
                ),
                SvgPicture.asset('assets/icons/search.svg')
              ]),
            ),
          )
        ],
      ),
    );
  }
}
