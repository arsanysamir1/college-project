import 'package:flutter/material.dart';

class suggest extends StatefulWidget {
  const suggest({Key? key}) : super(key: key);

  @override
  State<suggest> createState() => _suggestState();
}

class _suggestState extends State<suggest> {
  @override
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
  List<String> dist = ["12min", "11min", "45min", "50min", "107min", "120min"];
  List<String> price = [
    "1,200",
    "11,021",
    "45,564",
    "50,000",
    "1,900",
    "3,200"
  ];

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Last minute ideas",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Container(
            height: 310,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return last(index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget last(int index) {
    return InkWell(
      onTap: () {},
      child: Card(

        elevation: 3,
        child: Stack(
          children: [
            Container(decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: Image(
                  image: AssetImage(catList[index]),
                  width: 170,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4, top: 235),
              child: Container(
                width: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(par[index],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    Text(dist[index], style: TextStyle(fontSize: 15)),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "EGP " + price[index],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
