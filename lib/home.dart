import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled3/Provider/User.dart';
import 'package:untitled3/Provider/hotel.dart';
import 'package:untitled3/Provider/popular.dart';
import 'package:untitled3/activity.dart';
import 'package:untitled3/homepagecon.dart';
import 'package:untitled3/specialTravels.dart';
import 'package:untitled3/suggition.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

import 'Provider/activity.dart';
import 'Provider/favourite.dart';
import 'homeActivitys.dart';

late int pageNum = 1;
final cridential = FirebaseAuth.instance;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Stream<QuerySnapshot> userStream =
      FirebaseFirestore.instance.collection('MyUser').snapshots();
  Stream<QuerySnapshot> hotelStream =
      FirebaseFirestore.instance.collection('hotel').snapshots();
  Stream<QuerySnapshot> popularStream =
      FirebaseFirestore.instance.collection('popular').snapshots();
  Stream<QuerySnapshot> activityStream =
      FirebaseFirestore.instance.collection('activity').snapshots();
  Stream<QuerySnapshot> favouriteStream = FirebaseFirestore.instance
      .collection('MyUser')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Favourite')
      .snapshots();


  Widget build(BuildContext context) {
    // FirebaseFirestore.instance
    //     .collection('activity')
    //     .get()
    //     .then((value) {
    //   value.docs.forEach((element) {
    //     print('object');
    //     print(element.id);
    //   });
    // });

    return StreamBuilder<QuerySnapshot>(
        stream: userStream,
        builder: (context, snapshot1) {
          return StreamBuilder<QuerySnapshot>(
            stream: hotelStream,
            builder: (context, snapshot2) {
              return StreamBuilder<QuerySnapshot>(
                  stream: activityStream,
                  builder: (context, snapshot4) {
                    return StreamBuilder<QuerySnapshot>(
                        stream: favouriteStream,
                        builder: (context, snapshot5) {
                          return StreamBuilder<QuerySnapshot>(
                              stream: popularStream,
                              builder: (context, snapshot3) {
                                if (snapshot1.hasData &&
                                    snapshot2.hasData &&
                                    snapshot3.hasData) {
                                  QuerySnapshot querySnapshot1 =
                                      snapshot1.data!;
                                  QuerySnapshot querySnapshot2 =
                                      snapshot2.data!;
                                  QuerySnapshot querySnapshot3 =
                                      snapshot3.data!;
                                  QuerySnapshot querySnapshot4 =
                                      snapshot4.data!;
                                  QuerySnapshot querySnapshot5 =
                                      snapshot5.data!;
                                  dynamic User, Popular;
                                  //print(s);
                                  dynamic thisUser =
                                      FirebaseAuth.instance.currentUser?.uid;

                                  myHotels.clear();
                                  querySnapshot2.docs.forEach((element) {
                                    hotel().getIntialized(
                                        element.id,
                                        element['hotelName'],
                                        element['homePic'],
                                        element['price'],
                                        element['offer'],
                                        element['rating'],
                                        element['views'],
                                        element['disc'],
                                        element['availableDuration'],
                                        element['policies'],
                                        element['location'],
                                        element['guest'],
                                        element['doubleBedNum'],
                                        element['singleBedNum'],
                                        element['futures'],
                                        element['favourite'],
                                        element['startDate'],
                                        element['endDate'],
                                        querySnapshot2.docs.length);


                                  });
                                  querySnapshot5.docs.forEach((element) {
                                    favourite().getIntialized(
                                        element.id,
                                        element['name'],
                                        element['image'],
                                        element['price'],
                                        element['location'][0],
                                        element['location'][1],
                                        querySnapshot5.docs.length);
                                  });
                                  querySnapshot1.docs.forEach((element) {
                                    element.id == thisUser
                                        ? User = element
                                        : null;
                                  });
                                  if (thisUser != null) {



                                    MyUser().getIntialized(
                                        User['firstName'],
                                        User['lastName'],
                                        User['userName'],
                                        User['email'],
                                        User['phoneNum'],
                                        '',
                                        (User['age']),
                                        User['location'],

                                      User['favouriteHotels'],
                                        User['favouriteActivities'],


                                       );
                                  } else {}
                                  myActivity.clear();
                                  // for(int i=0;i<querySnapshot4.docs.length;i++){
                                  //   Activity=querySnapshot4.docs.elementAt(i);
                                  querySnapshot4.docs.forEach((element) {

                                    activity().getIntialized(
                                        element.id,
                                        element['name'],
                                        element['image'],
                                        element['startDate'],
                                        element['endDate'],
                                        element['price'],
                                        element['rating'],
                                        element['views'],
                                        element['cancellation'],
                                        element['location'][0],
                                        element['location'][1],
                                        element['availableDuration'],
                                        element['highlight'],
                                        element['included'],
                                        element['meetingPoint'],
                                        element['expectText'],
                                        element['expectList'],
                                        element['additional'],
                                        element['disc'],
                                        element['pickUp'],
                                        element['favourite'],
                                        element['slots'],
                                        querySnapshot4.docs.length);
                                  });


                                  myPopularPlaces.clear();
                                  for (int i = 0;
                                      i < querySnapshot3.docs.length;
                                      i++) {
                                    Popular = querySnapshot3.docs.elementAt(i);
                                    popular().getIntialized(
                                        Popular['name'], Popular['url']);
                                  }

                                  return Scaffold(
                                    bottomNavigationBar: BottomAppBar(
                                        child: Container(
                                      decoration: BoxDecoration(),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Icon(
                                                    Icons.search,
                                                    size: 28,
                                                    color: Color(0xffFFA985),
                                                  ),
                                                  Text(
                                                    "Search",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFFA985)),
                                                  ),
                                                ]),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          '/trips');
                                                });
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Icon(
                                                    Icons.favorite,
                                                    size: 28,
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          top: 0),
                                                      child: Text("Favourite")),
                                                ],
                                              )),
                                          Container(
                                            padding: EdgeInsets.only(top: 0),
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            "/settings");
                                                  });
                                                },
                                                child: signin()),
                                          )
                                        ],
                                      ),
                                    )),
                                    body: Container(
                                        child: ListView(
                                      children: [
                                        homepage(),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Card(
                                                child: Container(
                                                  height: 90,
                                                  width: 110,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Icon(
                                                            FontAwesomeIcons
                                                                .hotel,
                                                            size: 50),
                                                        Text(
                                                          "Hotel",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        )
                                                      ]),
                                                ),
                                              ),
                                              Card(
                                                child: Container(
                                                  height: 90,
                                                  width: 110,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Icon(
                                                            FontAwesomeIcons
                                                                .swimmer,
                                                            size: 50),
                                                        Text(
                                                          "activity",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        )
                                                      ]),
                                                ),
                                              ),

                                            ]),
                                        special(),
                                        homeActivity(),
                                        suggest(),
                                      ],
                                    )),
                                  );
                                } else {
                                  return Container();
                                }
                              });
                        });
                  });
            },
          );
        });
  }

  Widget signin() {
    if (cridential.currentUser == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 29,
          ),
          Text("Sign in"),
        ],
      );
    } else {
      return Column(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage:
                AssetImage("assets/jj2Gcobpopokal0YstuCQW0ldJ4.jpg"),
          ),
          Text("Profile"),
        ],
      );
    }
  }

  StatelessWidget mass() {
    if (cridential.currentUser != null) {
      return IconButton(
          onPressed: () {
            setState(() async {
              await childWidget(50, 60);
            });
          },
          icon: Icon(Icons.add));
    } else {
      return Container();
    }
  }

  Widget childWidget(double mWidth, mHeight) {
    return Container(
        color: Color(0xffFFA985),
        width: mWidth,
        height: mHeight * 0.75,
        child: Container(
          child: Text("hello warld"),
        ));
  }

  Widget Wrapper() {
    if (pageNum == 1) {
      return homepage();
    } else if (pageNum == 2) {
      return Column(
        children: [Text("Page Number 2")],
      );
    } else {
      return Text("Error Page number is not from 1 to 4");
    }
  }
/*

    final userId = FirebaseAuth.instance.currentUser!.uid;
     myUser;
    FirebaseFirestore.instance
        .collection("MyUser")
        .doc(userId)
        .get()
        .then((value) => myUser = value);

*/
}
