import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/runtime%20arg/toHotel.dart';
import 'Provider/hotel.dart';

class suggest extends StatefulWidget {
  const suggest({Key? key}) : super(key: key);

  @override
  State<suggest> createState() => _suggestState();
}

class _suggestState extends State<suggest> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.maxFinite,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Last minute ideas",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Container(

                height: (260* myHotels.values.length).toDouble(),
                child: ListView.builder(
                  itemCount: myHotels.values.length,

                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Hotel',arguments: hotelIndex(myHotels[index]!.id));
                        },
                        child: Card( margin: EdgeInsets.only(top: 20),
                            elevation: 3,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: Container(height: 170,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                 myHotels[index]!.homePic),
                                              fit: BoxFit.cover,
                                            )),
                                      )
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4, top: 10),
                                  child: Container(
                                    width: 400,
                                    margin: EdgeInsets.only(
                                        top: 0, bottom: 12, left: 8, right: 8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                          children: [
                                            Text(myHotels[index]!
                                                .hotelName,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight
                                                        .w600)),
                                            Text(myHotels[index]!
                                                .price)
                                          ],
                                        ),
                                        Text(myHotels[index]
                                            ?.location[0] +
                                            ', ' + myHotels[index]
                                            ?.location[1],
                                            style: TextStyle(fontSize: 15)),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )

                        ));
                  },
                ),
              )
            ])
    );
  }
}
