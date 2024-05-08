import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Hotel extends StatefulWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  var thisUser = FirebaseAuth.instance.currentUser?.uid;
  Stream<QuerySnapshot> Sstream =
      FirebaseFirestore.instance.collection('hotel').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: Sstream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot querySnapshot = snapshot.data!;
                    var Video;
                    querySnapshot.docs.forEach((element) {
                      Video = element;
                    });
                    return ListView(children: [
                      Column(children: [
                        Container(
                            height: 350,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(File(Video['homePic'])),
                                    fit: BoxFit.cover))),
                        /* 'hotelName': hotelName,
      'homePic': homePic,
      'price': price,
      'rating': rating,
      'views': views,
      'offer': offer,
      'location': [country, city],
      'availableDuration': availableDuration,
      'roomNum': roomNum,
      'singleBedNum': singleBedNum,
      'doubleBedNum': doubleBedNum,
      'publisher': publisher,*/
                        Container(
                            color: Color.fromARGB(17, 0, 0, 0),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${Video['hotelName']} ',
                                            style: TextStyle(fontSize: 24)),
                                      ],
                                    )),
                                Container(
                                    margin:
                                        EdgeInsets.only(left: 8, bottom: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.location_on),
                                            Text(
                                              '${Video['location'][0]}, ${Video['location'][1]}',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: Text(
                                              '${Video['rating']}, ${Video['views']}',
                                              style: TextStyle(fontSize: 18)),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.favorite_border_outlined,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons.share,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 12, bottom: 12, right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.people_outline),
                                            Text(
                                              '  ${int.parse(Video['doubleBedNum']) + int.parse(Video['singleBedNum']) + 1} Guests',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        Text('.',
                                            style: TextStyle(fontSize: 20)),
                                        Row(
                                          children: [
                                            Icon(Icons.people_outline),
                                            Text(
                                              '  ${int.parse(Video['doubleBedNum']) + int.parse(Video['singleBedNum'])} Beds',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        Text('.',
                                            style: TextStyle(fontSize: 20)),
                                        Row(
                                          children: [
                                            Icon(Icons.bathtub_outlined),
                                            Text(
                                              '  ${int.parse(Video['doubleBedNum']) + 1} baths',
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 5),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Highlights',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Container(
                                            height: 56 * 4 / 2,
                                            child: GridView.builder(
                                              itemCount: 4,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      childAspectRatio: 3.2),
                                              itemBuilder: (context, index) {
                                                return MyGrid(index + 1);
                                              },
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 12),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(17, 0, 0, 0)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Discription',
                                            style: TextStyle(fontSize: 22)),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 12),
                                          child: Text(
                                              "Ocean Vida Beach and Dive Resort features a fitness centre, garden, a terrace and restaurant in Daanbantayan. I think it's one of the best place to stay in this tiny island. Room is spacious and clean. I like it the most that the aircon is not directly facing the bed. Nice balcony looking right into the ocean. And popular restaurant and dive shop inside the resort.",
                                              style: TextStyle(fontSize: 18)),
                                        )
                                      ]),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 12),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Policies',
                                            style: TextStyle(fontSize: 22)),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 12),
                                          child: Text(
                                              "Ocean Vida Beach and Dive Resort features a fitness centre, garden, a terrace and restaurant in Daanbantayan. ",
                                              style: TextStyle(fontSize: 18)),
                                        ),
                                      ]),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(17, 0, 0, 0)),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color.fromARGB(30, 0, 0, 0)),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        border: Border.all(
                                                            width: 2,
                                                            color:
                                                                Colors.white)),
                                                    child: ClipOval(
                                                      child: Container(
                                                          height: 50,
                                                          width: 50,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/LeonardoDiCaprio.jpg'),
                                                                  fit: BoxFit
                                                                      .cover))),
                                                    ),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text('This is Data',
                                                          style: TextStyle(
                                                              fontSize: 18)),
                                                      Text('Data')
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5,
                                                    vertical: 12),
                                                child: Text(
                                                    "Ocean Vida Beach and Dive Resort features a fitness centre, garden, a terrace and restaurant in Daanbantayan.",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(8)),

                                                  child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding:
                                                        MaterialStatePropertyAll(
                                                            EdgeInsets
                                                                .symmetric(
                                                                vertical:
                                                                12,
                                                                horizontal:
                                                                25)),
                                                        shape: MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8))),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text('Replay')))
                                            ]),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color.fromARGB(30, 0, 0, 0)),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        border: Border.all(
                                                            width: 2,
                                                            color:
                                                                Colors.white)),
                                                    child: ClipOval(
                                                      child: Container(
                                                          height: 50,
                                                          width: 50,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/LeonardoDiCaprio.jpg'),
                                                                  fit: BoxFit
                                                                      .cover))),
                                                    ),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text('This is Data',
                                                          style: TextStyle(
                                                              fontSize: 18)),
                                                      Text('Data')
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5,
                                                    vertical: 12),
                                                child: Text(
                                                    "Ocean Vida Beach and Dive Resort features a fitness centre, garden, a terrace and restaurant in Daanbantayan.",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(8)),

                                                  child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding:
                                                        MaterialStatePropertyAll(
                                                            EdgeInsets
                                                                .symmetric(
                                                                vertical:
                                                                12,
                                                                horizontal:
                                                                25)),
                                                        shape: MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8))),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text('Replay')))
                                            ]),
                                      ),
                                      Container(
                                          color: Colors.white,
                                          margin: EdgeInsets.only(
                                              left: 12, right: 12, top: 20),
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText: ' Comment',
                                                border: OutlineInputBorder()),
                                          )),
                                      Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              margin: EdgeInsets.only(
                                                  left: 12,
                                                  right: 12,
                                                  top: 10,
                                                  bottom: 20),
                                              child: ElevatedButton(
                                                  style: ButtonStyle(
                                                    padding:
                                                        MaterialStatePropertyAll(
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        12,
                                                                    horizontal:
                                                                        30)),
                                                    shape: MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8))),
                                                  ),
                                                  onPressed: () {},
                                                  child: Text('Add')))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ))
                      ])
                    ]);
                  } else {
                    return CircularProgressIndicator();
                  }
                })));
  }

  Widget MyGrid(int index) {
    return Card(
      elevation: 3,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: Text(
          '$index Fours Place',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


