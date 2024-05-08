import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';

List<ImageProvider> img = [
  AssetImage('assets/a0d21da57ef11e05f8a7c656668404b2.jpg'),
  AssetImage('assets/2522892ce4cc698b8318b2cd910171ec.jpg'),
  AssetImage('assets/e2f47c88aec6a5c75dc9ea9d00712c4f.jpg'),
];
List upperTitle = [
  'Life is brief, but the',
  'The world is waiting',
  'People don’t take'
];
List lowerTitle = ['universe is ', 'for you, go ', 'trips, trips take '];
List colored = ['vast', 'discover it', 'people'];
List disc = [
  'At TourEase, we curate unique and\nimmersive travel experiences to\ndestinations around the globe.',
  'Embark on an unforgettable journey by\nventuring outside of your comfort zone.\nThe world is full of hidden gems just\nwaiting to be discovered.',
  'To get the best of your adventure you\njust need to leave and go where you\nlike. we are waiting for you'
];

class wlcome extends StatelessWidget {
  wlcome({Key? key}) : super(key: key);
  @override
  PageController page = PageController(initialPage: 0);

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView.builder(
        controller: page,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(image: img[index], fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    margin: EdgeInsets.only(top: 490),
                    child: Column(
                      children: [
                        Text(upperTitle[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.w700)),
                        Container(
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(lowerTitle[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w700)),
                              Text(colored[index],
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w700)),
                              Text(".",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              disc[index],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            )),
                        Container(
                          width: width,
                          margin: EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                3,
                                (index1) => Container(
                                      width: index == index1 ? 20 : 8,
                                      height: 8,
                                      margin: EdgeInsets.only(right: 6),
                                      decoration: BoxDecoration(
                                          color: index == index1
                                              ? Colors.orange
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 740.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.orange),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 150))),
                          onPressed: () {
                            index == 2
                                ? Navigator.of(context)
                                    .pushNamed("/signInOrUp")
                                : page.nextPage(
                                    duration: Duration(milliseconds: 450),
                                    curve: Curves.ease);
                          },
                          child: index == 2
                              ? Text('Continue',
                                  style: TextStyle(color: Colors.white))
                              : Text(
                                  "next",
                                  style: TextStyle(color: Colors.white),
                                )),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
