import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled3/runtime%20arg/toActivity.dart';
import 'package:untitled3/runtime%20arg/toHotel.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/Provider/hotel.dart';
import 'package:untitled3/runtime%20arg/toSearch.dart';
import 'dart:io';
import 'Provider/User.dart';
import 'Provider/activity.dart';
import 'Provider/searchPage.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  List title = ["Hotel", "Activity"];
  String viewList = "Hotel";

  void changeViewList(newState) {
    viewList = newState;
  }

  Widget build(BuildContext context) {
    final _search = ModalRoute.of(context)?.settings.arguments as searchDetails;
    searchPage1.searchTitle = _search.searchTitle;
    Map<int, hotel> hotels = {};
    Map<int, activity> activities = {};
    List filteredHotel = [];
    List filteredActivity = [];
    int num = 0;
    int num2 = 0;

    myHotels.forEach((key, value) {
      if (searchPage1.searchTitle.length > 1) {
        if (myHotels[key]!.location.contains(searchPage1.searchTitle) ||
            myHotels[key]!.location.contains(searchPage1.searchTitle
                .substring(0, searchPage1.searchTitle.length - 1)) ||
            myHotels[key]!.location.contains(
                searchPage1.searchTitle.substring(0, 1).toUpperCase() +
                    searchPage1.searchTitle
                        .substring(1, searchPage1.searchTitle.length)) ||
            myHotels[key]!.location.contains(
                searchPage1.searchTitle.substring(0, 1).toUpperCase() +
                    searchPage1.searchTitle
                        .substring(1, searchPage1.searchTitle.length - 1))) {
          hotels[num] = value;
          num++;
        } else {}
      }
    });
    myActivity.forEach((key, value) {
      if (myActivity[key]!.location.contains(searchPage1.searchTitle) ||
          myActivity[key]!.location.contains(searchPage1.searchTitle
              .substring(0, searchPage1.searchTitle.length - 1)) ||
          myActivity[key]!.location.contains(searchPage1.searchTitle
                  .substring(0, searchPage1.searchTitle.length) +
              " ") ||
          myActivity[key]!.location.contains(
              searchPage1.searchTitle.substring(0, 1).toUpperCase() +
                  searchPage1.searchTitle
                      .substring(1, searchPage1.searchTitle.length)) ||
          myActivity[key]!.location.contains(
              searchPage1.searchTitle.substring(0, 1).toUpperCase() +
                  searchPage1.searchTitle
                      .substring(1, searchPage1.searchTitle.length - 1))) {
        activities[num2] = value;
        print(activities[num2]!.name);
        print(num2);
        num2++;
      } else {}
    });
    /*
    if(MyUser1.startDate.length>0&&MyUser1.endDate.length>0) {

      if (MyUser1.startDate[0] != null &&
          MyUser1.startDate[1] != null &&
          MyUser1.startDate[2] != null &&
          MyUser1.endDate[0] != null &&
          MyUser1.endDate[1] != null &&
          MyUser1.endDate[2] != null) {
        activities.forEach((key, value) {
          if (int.parse(value.startDate[2]) > int.parse(MyUser1.startDate[2])) {
            activities.remove(value);
          } else if (int.parse(value.startDate[2]) ==
              int.parse(MyUser1.startDate[2])) {
            if (int.parse(value.startDate[1]) >
                int.parse(MyUser1.startDate[1])) {
              activities.remove(value);
            } else if (int.parse(value.startDate[2]) ==
                int.parse(MyUser1.startDate[2])) {
              if (int.parse(value.startDate[0]) >
                  int.parse(MyUser1.startDate[0])) {
                activities.remove(value);
              }
            }
          }
        });
        activities.forEach((key, value) {
          if (int.parse(value.endDate[2]) > int.parse(MyUser1.endDate[2])) {
            activities.remove(value);
          } else if (int.parse(value.endDate[2]) ==
              int.parse(MyUser1.endDate[2])) {
            if (int.parse(value.endDate[1]) > int.parse(MyUser1.endDate[1])) {
              activities.remove(value);
            } else if (int.parse(value.endDate[2]) ==
                int.parse(MyUser1.endDate[2])) {
              if (int.parse(value.endDate[0]) > int.parse(MyUser1.endDate[0])) {
                activities.remove(value);
              }
            }
          }
        });

        hotels.forEach((key, value) {
          if (int.parse(value.endDate[2]) > int.parse(MyUser1.endDate[2])) {
            hotels.remove(value);
          } else if (int.parse(value.endDate[2]) ==
              int.parse(MyUser1.endDate[2])) {
            if (int.parse(value.endDate[1]) > int.parse(MyUser1.endDate[1])) {
              hotels.remove(value);
            } else if (int.parse(value.endDate[2]) ==
                int.parse(MyUser1.endDate[2])) {
              if (int.parse(value.endDate[0]) > int.parse(MyUser1.endDate[0])) {
                hotels.remove(value);
              }
            }
          }
        });
        hotels.forEach((key, value) {
          if (int.parse(value.startDate[2]) > int.parse(MyUser1.startDate[2])) {
            hotels.remove(value);
          } else if (int.parse(value.startDate[2]) ==
              int.parse(MyUser1.startDate[2])) {
            if (int.parse(value.startDate[1]) >
                int.parse(MyUser1.startDate[1])) {
              hotels.remove(value);
            } else if (int.parse(value.startDate[2]) ==
                int.parse(MyUser1.startDate[2])) {
              if (int.parse(value.startDate[0]) >
                  int.parse(MyUser1.startDate[0])) {
                hotels.remove(value);
              }
            }
          }
        });
      }
    }
    */
    hotels.removeWhere(
        (key, value) => int.parse(value.guest) < int.parse(MyUser1.adult));

    hotels.forEach((key, value) {
      if (value != null) {
        filteredHotel.add(value);
      }
    });
    activities.forEach((key, value) {
      if (value != null) {
        filteredActivity.add(value);
      }
    });

    // Hurghada
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListView(children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                        height: 35,
                        width: 35,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xffFF6421),
                        )),
                  ],
                )),
          ],
        ),
        Container(
          height: 160,
          child: Card(
            color: Color(0xffFF6421),
            elevation: 2,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('/hotelsearch');
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 60,
                      width: 500,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: BorderDirectional(
                              bottom: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(60, 0, 0, 0)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(searchPage1.searchTitle),
                        ],
                      )),
                ),
                InkWell(
                  onTap: () async {
                    DateTimeRange? Date = await showDateRangePicker(
                        context: context,
                        currentDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));

                    MyUser1.startDate.clear();
                    MyUser1.startDate.add(Date!.start.day.toString());
                    MyUser1.startDate.add(Date!.start.month.toString());
                    MyUser1.startDate.add(Date!.start.year.toString());
                    MyUser1.endDate.clear();
                    MyUser1.endDate.add(Date!.end.day.toString());
                    MyUser1.endDate.add(Date!.end.month.toString());
                    MyUser1.endDate.add(Date!.end.year.toString());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: BorderDirectional(
                            bottom: BorderSide(
                                width: 2, color: Color.fromARGB(60, 0, 0, 0)))),
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Row(children: [
                        Container(
                            width: 170,
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    end: BorderSide(
                                        width: 1,
                                        color: Color.fromARGB(60, 0, 0, 0)))),
                            child: Container(
                              child: MyUser1.startDate.length != 0
                                  ? MyUser1.startDate[0] != null
                                      ? Text(
                                          "${MyUser1.startDate[0]}:${MyUser1.startDate[1]}:${MyUser1.startDate[2]}")
                                      : Text("From")
                                  : Text("From"),
                            )),
                        Container(
                          width: 170,
                          padding: EdgeInsets.only(left: 15),
                          child: MyUser1.endDate.length != 0
                              ? MyUser1.endDate[0] != null
                                  ? Text(
                                      "${MyUser1.endDate[0]}:${MyUser1.endDate[1]}:${MyUser1.endDate[2]}")
                                  : Text("To")
                              : Text("To"),
                        ),
                      ]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    DateTimeRange? Date = await showDateRangePicker(
                        context: context,
                        currentDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    MyUser1.startDate.clear();
                    MyUser1.startDate.add(Date!.start.day.toString());
                    MyUser1.startDate.add(Date!.start.month.toString());
                    MyUser1.startDate.add(Date!.start.year.toString());
                    MyUser1.endDate.clear();
                    MyUser1.endDate.add(Date!.end.day.toString());
                    MyUser1.endDate.add(Date!.end.month.toString());
                    MyUser1.endDate.add(Date!.end.year.toString());
                  },
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/guestdetails');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Container(
                              child: MyUser1.rooms != null
                                  ? Text("Rooms: ${MyUser1.rooms}")
                                  : Text("room"),
                            )),
                            Container(
                                child: Container(
                              child: MyUser1.adult != null
                                  ? Text("adults: ${MyUser1.adult}")
                                  : Text("adult"),
                            )),
                            Container(
                                child: Container(
                              child: MyUser1.childernAges.length != null
                                  ? Text(
                                      "child: ${MyUser1.childernAges.length}")
                                  : Text("child"),
                            )),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: 400,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  title.length,
                  (index) => Container(
                      width: 160,
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              changeViewList(title[index]);
                            });
                          },
                          child: title[index] == viewList
                              ? Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Colors.orange)),
                                  ),
                                  child: Text(
                                    title[index],
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.orange),
                                    textAlign: TextAlign.center,
                                  ))
                              : Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Colors.black)),
                                  ),
                                  child: Text(
                                    title[index],
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  )))))),
        ),
        viewList == 'Hotel'
            ? Container(
                height: 200.0 * filteredHotel.length,
                width: 400,
                child: ListView.builder(
                  itemCount: filteredHotel.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    print(index);

                    return Hotels(index, context, filteredHotel);
                  },
                ),
              )
            : Container(
                height: (400 * filteredActivity.length).toDouble(),
                child: ListView.builder(
                  itemCount: filteredActivity.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Activity',
                              arguments:
                                  activityIndex(filteredActivity[index]!.id));
                        },
                        child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(
                                              filteredActivity[index]!.homePic),
                                          fit: BoxFit.cover,
                                        )),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4, top: 10),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 0, bottom: 12, left: 8, right: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 270,
                                          child: Text(
                                              filteredActivity[index]!.name,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                '${filteredActivity[index]?.location[0]}, ${filteredActivity[index]!.location[1]}',
                                                style: TextStyle(fontSize: 15)),
                                            Text(filteredActivity[index]!.price)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )));
                  },
                ),
              ),
      ]),
    ));
  }

  Widget Hotels(int index, BuildContext context, dynamic video) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/Hotel', arguments: hotelIndex(video[index]!.id));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 170,
        width: 50,
        child: Card(
          elevation: 2,
          child: Container(
            child: Row(
              children: [
                Container(
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                        image: DecorationImage(
                            image: NetworkImage(video[index]?.homePic),
                            fit: BoxFit.fill))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 230,
                      height: 40,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                                video[index].hotelName.length >= 18
                                    ? video[index].hotelName.substring(0, 18) +
                                        '..'
                                    : video[index].hotelName,
                                style: TextStyle(fontSize: 16)),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: ElevatedButton(
                              onPressed: () async {
                                print(myHotels[index]!.favourite);
                                print("index.no" + index.toString());
                                await hotel().changeFavurate(
                                    myHotels[index]!.id,
                                    myHotels[index]!.favourite);
                                setState(() {
                                  if (myHotels[index]!.favourite != true) {
                                    MyUser1.removeFavouriteHotels(
                                        myHotels[index]!.id);
                                  } else {
                                    MyUser1.addFavouriteHotels(
                                        myHotels[index]!.id);
                                  }
                                });
                              },
                              style: ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(0)),
                                  shape: MaterialStatePropertyAll(CircleBorder(
                                      side: BorderSide(
                                          width: 1, color: Colors.orange))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              child: Icon(
                                myHotels[index]?.favourite == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.orange,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 233,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(CupertinoIcons.location_solid),
                              Text(
                                '${video[index].location[0]}, ${video[index].location[1]}',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              '${video[index].price}',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 30,
                        width: 233,
                        child: Row(
                          children: [
                            for (int a = 0; a < 5; a++)
                              if (a == 0)
                                Icon(Icons.star, color: Colors.yellowAccent)
                              else if (a < int.parse(video[index].rating))
                                Icon(Icons.star, color: Colors.yellowAccent)
                              else
                                Icon(
                                  Icons.star_border,
                                  color: Colors.yellowAccent,
                                ),
                            Text(" ${video[index].rating} "),
                            Text("[${video[index].rating} Views]"),
                          ],
                        )),
                    Container(
                      width: 224,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 160,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${video[index]!.guest}" + ' Gests',
                                ),
                                Text(
                                    "${int.parse(video[index].doubleBedNum) + int.parse(video[index].singleBedNum)} Beds"),
                                Text(
                                    "${video[index].doubleBedNum == 0 ? 1 : 2} baths"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
