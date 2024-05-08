import 'package:flutter/material.dart';

List<String> catList = [
  "assets/deadshot-poster-feature.jpg",
  "assets/FwuKgV0XsAQydf8.jpg",
  "assets/images.jpg",
  "assets/LAND_16_9.jpg",
  "assets/5eMvCxuWYwXJEE685B8YRE.jpg"
];
List<String> par = [
  "Pyrameds expres",
  "Star of Giza py",
  "Celia Pyramids V",
  "ZYA Palmera El ",
  "tolip resort El  El "
];

class special extends StatelessWidget {
  const special({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 450,
      child: GridView.count(
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            specialCard(catList[0], par[0]),
            specialCard(catList[1], par[1]),
            specialCard(catList[2], par[2]),
            specialCard(catList[3], par[3])
          ]),
    );
  }

  Widget specialCard(String img, String str) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 0),
            borderRadius: BorderRadius.circular(15)),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage(img),
              height: 500,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 180),
              child: Text(
                str,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}
