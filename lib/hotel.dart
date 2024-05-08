import 'dart:developer';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled3/Provider/User.dart';
import 'package:untitled3/runtime%20arg/toHotel.dart';
import 'package:untitled3/service/firebase.dart';

import 'Provider/hotel.dart';
import 'Provider/hotelPageState.dart';

class Hotel extends StatefulWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  final Commment = TextEditingController();

  late String viewList;
  @override
  void initState() {
    // TODO: implement initState
    viewList="Overview";
    super.initState();
  }
  void changeViewList(newState){
    viewList=newState;

  }
  Widget build(BuildContext context) {

    final a = ModalRoute.of(context)?.settings.arguments as hotelIndex;
    final height = MediaQuery.of(context).size.height;
    hotel hotel1=hotel();
    myHotels.forEach((key, value) {if(value.id==a.Id){hotel1=value;}});
    print(myHotels.length);
    List title = ["Overview", "Stay rules", "reviews"];
    print("arsany");



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
                  Text(" \$80,800/night",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 60)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/hotelBooking",arguments: hotelIndex(hotel1.id));
                      },
                      child: Text(
                        'Book Now',
                        style: TextStyle(color: Colors.orange),
                      ))
                ])),
        body: Container(
            color: Colors.green,
            child: ListView(padding: EdgeInsets.all(0), children: [
              Stack(children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8, top: 20),
                      height: height / 1.58,
                      width: 5000,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(hotel1!.homePic),
                              fit: BoxFit.cover)),
                      child: Container(
                          color: Colors.transparent,
                          child: Stack(
                              alignment: AlignmentDirectional(4000, 4000),
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.circleChevronLeft,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              ])),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: height / 1.68),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(15))),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: 18, left: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(hotel1!.hotelName,
                                              style: TextStyle(fontSize: 18)),
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
                                                hotel1!.location[0] +
                                                    ' ,  ' +
                                                    hotel1!
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
                                  margin: EdgeInsets.only(left: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(" 4.5 ",
                                              style: TextStyle(fontSize: 19)),
                                          Icon(Icons.star,
                                              color: Colors.orange),
                                        ],
                                      ),
                                      Text(
                                        "(${hotel1!.rating} Views)",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.6)),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 400,
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                  3,
                                  (index) => Container(
                                      width: 125,
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              changeViewList(title[index]);
                                            });
                                          },
                                          child: title[index]! ==
                                                  viewList
                                              ? Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color:
                                                                Colors.orange)),
                                                  ),
                                                  child: Text(
                                                    title[index],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.orange),
                                                    textAlign: TextAlign.center,
                                                  ))
                                              : Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                  child: Text(
                                                    title[index],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                    textAlign: TextAlign.center,
                                                  )))))),
                        ),
                        if (viewList == title[0])
                          Overview(hotel1)
                        else if (viewList == title[1])
                          Policies(hotel1)
                        else
                          Reviews(hotel1)
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(left: 250, top: 485),
                  child: ElevatedButton(
                    onPressed: () async {
                      await hotel().changeFavurate(hotel1!.id, hotel1!.favourite);
                      setState(() {
                      if (hotel1!.favourite != true) {
                        MyUser1.removeFavouriteHotels(hotel1!.id);

                      } else {

                        MyUser1.addFavouriteHotels(hotel1!.id);
                      }
                      });

                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(CircleBorder(
                            side: BorderSide(width: 1, color: Colors.orange))),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    child: Icon(
                        hotel1?.favourite == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.orange),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_rounded,
                        color: Colors.white, size: 27),
                  ),
                ),
              ])
            ])));
  }

  Widget Overview(hotel1) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.only(bottom: 12, left: 8, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Discription', style: TextStyle(fontSize: 18)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              child: Text(hotel1!.disc.substring(0, 230) + '...',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.6))),
            )
          ]),
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
                width: 4000,
                margin: EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Highlights',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            children: List.generate(
                                (hotel1!.future.length - 1),
                                (index) => MyGrid(index + 1, hotel1))),
                      )
                    ]))),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.people_outline, color: Colors.orange),
                    Text(
                      '  ${hotel1!.guest} Guests',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Text('.', style: TextStyle(fontSize: 20)),
                Row(
                  children: [
                    Icon(
                      Icons.bed_outlined,
                      color: Colors.orange,
                    ),
                    Text(
                      '  ${int.parse(hotel1!.doubleBedNum) + int.parse(hotel1!.singleBedNum)} Beds',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Text('.', style: TextStyle(fontSize: 20)),
                Row(
                  children: [
                    Icon(Icons.bathtub_outlined, color: Colors.orange),
                    Text(
                      '  ${int.parse(hotel1!.doubleBedNum)} baths',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            )),
        SizedBox(
          height: 80,
        )
      ],
    );
  }

  Widget Policies(hotel1) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Policies', style: TextStyle(fontSize: 22)),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
          child:
              Text(hotel1!.policies, style: TextStyle(fontSize: 18)),
        ),
        SizedBox(
          height: 80,
        )
      ]),
    );
  }

  Widget Reviews(hotel1) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(30, 0, 0, 0)),
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
                                  image:
                                      NetworkImage(hotel1!.homePic),
                                  fit: BoxFit.cover))),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('This is Data', style: TextStyle(fontSize: 18)),
                      Text('Data')
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                child: Text(
                    "Ocean Vida Beach and Dive Resort features a fitness centre, garden, a terrace and restaurant in Daanbantayan.",
                    style: TextStyle(fontSize: 18)),
              ),

            ]),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(30, 0, 0, 0)),
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
                                  image:
                                      NetworkImage(hotel1!.homePic),
                                  fit: BoxFit.cover))),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('This is Data', style: TextStyle(fontSize: 18)),
                      Text('Data')
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                child: Text(
                    "Ocean Vida Beach and Dive Resort features a fitness centre, garden, a terrace and restaurant in Daanbantayan.",
                    style: TextStyle(fontSize: 18)),
              ),

            ]),
          ),
          Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 12, right: 12, top: 20),
              child: TextField(
                controller: Commment,
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
                        databaseService(uid: user).addComment(user, Commment.text);
                        Commment.clear();
                      },
                      child:
                          Text('Add', style: TextStyle(color: Colors.white))))
            ],
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }

  Widget MyGrid(int index, hotel1) {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.orange),
        child: Text(
          hotel1!.future[index],
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
