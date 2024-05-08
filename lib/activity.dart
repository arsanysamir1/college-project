import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/runtime%20arg/toActivity.dart';
import 'Provider/User.dart';
import 'Provider/activity.dart';
import 'package:untitled3/service/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Provider/hotel.dart';
class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  final Commment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    late activity activity1=activity();


    final activityindex =
    ModalRoute.of(context)?.settings.arguments as activityIndex;
    myActivity.forEach((key, value) {if(value.id==activityindex.Id){activity1=value;}});
    return Scaffold(
        bottomSheet: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.orange,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
            height: 65,
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Price: ${activity1?.price}",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 60)),
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/activityBooking',arguments: activityIndex(activity1.id));
                      },
                      child: Text(
                        'Book Now',
                        style: TextStyle(color: Colors.orange),
                      ))
                ])),
        body: Container(
            color: Colors.blueAccent,
            child: ListView(padding: EdgeInsets.all(0), children: [
              Stack(children: [
                Column(
                  children: [
                    Stack(children: [
                      Container(
                          height: height / 2.6,
                          width: 5000,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(activity1!
                                      .homePic),
                                  fit: BoxFit.cover))),
                      Container(
                          margin: EdgeInsets.only(top: 25),
                          child: IconButton(

                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back_rounded,color: Colors.white,))),
                      Container(
                        padding: EdgeInsets.only(left: 300, top: 20),
                        child: ElevatedButton(
                          onPressed: () async {

                            await activity().changeFavurate(activity1!.id, activity1!.favourite);
                            setState(() {
                              if (activity1!.favourite != true) {
                                MyUser1.removeFavouriteActivities(activity1!.id);

                              } else {

                                MyUser1.addFavouriteActivities(activity1!.id);
                              }
                            });

                          },
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(CircleBorder(
                                  side: BorderSide(width: 0,color: Colors.white))),
                              backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                          child: Icon(
                              activity1?.favourite == true
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.orange,size: 20,),
                        ),
                      ),
                    ]),
                    Container(
                        color: Colors.transparent,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              FontAwesomeIcons.circleChevronLeft,
                              color: Colors.white,
                              size: 30,
                            ))),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: height / 2.670),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 18, left: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 300,
                                          child: Text(
                                            activity1!
                                                  .name,
                                              style: TextStyle(fontSize: 16)),
                                        ),
                                      ],
                                    )),
                                Container(
                                    margin:
                                    EdgeInsets.only(left: 12, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_outlined,
                                                size: 18,
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.6)),
                                            Text(
                                             activity1!
                                                  .location[0] +
                                                  ' ' +
                                                 activity1!
                                                      .location[1],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.6)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(" 4.5 ",
                                            style: TextStyle(fontSize: 19)),
                                        Icon(Icons.star, color: Colors.orange),
                                      ],
                                    ),
                                    Text(
                                      "(4.5 Views)",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.6)),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.all(12),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Overview",
                                      style: TextStyle(fontSize: 18))),
                              Text(
                                  activity1!.disc,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.65)))
                            ]),
                      ),
                      Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                top: BorderSide(width: 1, color: Colors.grey))),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Highlights", style: TextStyle(fontSize: 18)),
                            Column(
                                children: List.generate(
                                  activity1!
                                      .highlights.length,
                                      (index) {
                                    return Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 4),
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle)),
                                            Container(
                                              width: 342,
                                              child: Text(
                                                  activity1!
                                                      .highlights[index],
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.65))),
                                            )
                                          ],
                                        ));
                                  },
                                ))
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ExpansionTile(
                              tilePadding: EdgeInsets.symmetric(horizontal: 5),
                              title: Text("What's Included"),
                              children: [
                                Column(
                                    children: List.generate(
                                      activity1!
                                          .whatIsIncluded
                                          .length,
                                          (index) => Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              child: Icon(
                                                FontAwesomeIcons.check,
                                                color: Colors.green,
                                              )),
                                          Container(
                                              width: 330,
                                              child: Text(activity1!
                                                  .whatIsIncluded[index]))
                                        ],
                                      ),
                                    ))
                              ])),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(horizontal: 5),
                            title: Text("Meeting and Pickup "),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        'Meeting Point',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: List.generate(
                                          activity1!
                                              .meetingPoint
                                              .length,
                                              (index) => Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 3),
                                              child: Text(
                                                  activity1!
                                                      .meetingPoint[index],
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.65)))))),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        'Pick up Poit',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: List.generate(
                                          activity1!.pickUp.length,
                                              (index) => Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 3),
                                              child: Text(
                                                  activity1!
                                                      .pickUp[index],
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.65)))))),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(horizontal: 5),
                            title: Text("What To Expect "),
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  width: 4000,
                                  margin: EdgeInsets.all(5),
                                  child: Column(children: [
                                    Container(
                                      child: Text(activity1!
                                          .whatToExpect),
                                    ),
                                    SizedBox(height: 20),
                                    Column(
                                      children: List.generate(
                                          activity1!
                                              .whatToExpectlist
                                              .length,
                                              (index) => Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 8),
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(55)),
                                                    child: Text(
                                                        style: TextStyle(
                                                            color:
                                                            Colors.white),
                                                        (index + 1).toString()),
                                                    alignment: Alignment.center,
                                                  ),
                                                  Container(
                                                    width: 300,
                                                    child: Text(
                                                        activity1!
                                                            .whatToExpectlist[
                                                        index],
                                                        style: TextStyle(
                                                            color:
                                                            Color.fromRGBO(
                                                                0,
                                                                0,
                                                                0,
                                                                0.65))),
                                                  )
                                                ],
                                              ))),
                                    )
                                  ]))
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(horizontal: 5),
                            title: Text("Additional Info "),
                            children: List.generate(
                                activity1!
                                    .aditionalInfo
                                    .length,
                                    (index) => Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(55),
                                                color: Colors.black)),
                                        Container(
                                          width: 300,
                                          child: Text(
                                              activity1!
                                                  .aditionalInfo[index],
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.65))),
                                        )
                                      ],
                                    )))),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(horizontal: 5),
                            title: Text("Cancellation Policy"),
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: 12, bottom: 12, left: 12),
                                width: 500,
                                child: Text(
                                    activity1!
                                        .cancellation,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.65))),
                              )
                            ]),
                      ),
                      Reviews( activityindex),
                      SizedBox(
                        height: 55,
                      )
                    ]))
              ])
            ])));
  }

  Widget Reviews( activity1) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(
                        width: 0, color: Color.fromRGBO(0, 0, 0, 0.4)))),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Colors.white)),
                    child: ClipOval(
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/jj2Gcobpopokal0YstuCQW0ldJ4.jpg'),
                                  fit: BoxFit.cover))),
                    ),
                  ),
                  SizedBox(width: 8),

                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                child: Text(
                    "Ocean Vida Beach and Dive Resort features a fitness centre, garden, a terrace and restaurant in Daanbantayan.",
                    style: TextStyle(fontSize: 14)),
              ),

            ]),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(
                        width: 0, color: Color.fromRGBO(0, 0, 0, 0.4)))),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Colors.white)),
                    child: ClipOval(
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/jj2Gcobpopokal0YstuCQW0ldJ4.jpg'),
                                  fit: BoxFit.cover))),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('This is Data', style: TextStyle(fontSize: 18)),
                      Row(
                        children: List.generate(
                            5,
                                (index) => Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  FontAwesomeIcons.solidStar,
                                  size: 14,
                                  color: Colors.yellowAccent,
                                ))),
                      )
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                child: Text(
                    "Ocean Vida Beach and Dive Resort features a fitness centre, garden, a terrace and restaurant in Daanbantayan.",
                    style: TextStyle(fontSize: 14)),
              ),

            ]),
          ),
          Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 12, right: 12, top: 20),
              child: TextField(
                controller: Commment,
                maxLines: 2,
                decoration: InputDecoration(
                    hintText: ' Comment', border: OutlineInputBorder()),
              )),
          Row(
            children: [
              Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  margin:
                  EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll(Colors.orange),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                      onPressed: () {

                        final user = FirebaseAuth.instance.currentUser!.uid;
                        databaseService(uid: user).addUserComment(
                            user,
                            activity1!.id,
                            Commment.text);
                        databaseService(
                            uid: activity1!.id)
                            .addActivityComment(user, Commment.text);
                        Commment.clear();
                      },
                      child:
                      Text('Add', style: TextStyle(color: Colors.white))))
            ],
          ),
        ],
      ),
    );
  }
}
