import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/runtime%20arg/toActivity.dart';
import 'package:untitled3/runtime%20arg/toHotel.dart';
import 'Provider/activity.dart';
class homeActivity extends StatefulWidget {
  const homeActivity({Key? key}) : super(key: key);

  @override
  State<homeActivity> createState() => _homeActivityState();
}

class _homeActivityState extends State<homeActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.maxFinite,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Activitiy",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              Container(

                height: (300*myActivity.values.length).toDouble(),
                child: ListView.builder(
                  itemCount: myActivity.values.length,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Activity',arguments: activityIndex(myActivity[index]!.id));
                        },
                        child: Card( margin: EdgeInsets.only(bottom: 20),
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
                                              image: NetworkImage(  myActivity[index]!
                                                  .homePic),
                                              fit: BoxFit.cover,
                                            )),
                                      )
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4, top: 10),
                                  child: Container(

                                    margin: EdgeInsets.only(
                                        top: 0, bottom: 12, left: 8, right: 8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(width: 270,
                                          child: Text( myActivity[index]!
                                              .name,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight
                                                      .w600)),
                                        ),
                                        Row(mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                          children: [
                                            Text( '${myActivity[index]
                                                ?.location[0]}, ${myActivity[index]
                                            !.location[1]}',
                                                style: TextStyle(fontSize: 15)),
                                            Text( myActivity[index]!
                                                .price)

                                          ],
                                        ),


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
