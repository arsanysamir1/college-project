import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled3/Provider/User.dart';
import 'package:untitled3/Provider/hotel.dart';
import 'package:untitled3/runtime%20arg/toActivity.dart';
import 'package:untitled3/runtime%20arg/toHotel.dart';
import 'Provider/activity.dart';
import 'Provider/favourite.dart';
import 'homepagecon.dart';

final cridential = FirebaseAuth.instance;

class trips extends StatefulWidget {
  const trips({Key? key}) : super(key: key);

  @override
  State<trips> createState() => _tripsState();
}


class _tripsState extends State<trips> {
  @override






  List title = ["Hotel", "Activity"];
  late String viewList;
  void changeViewList(newState){
    setState(() {
      viewList=newState;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    viewList="Hotel";
    super.initState();
  }

  Widget build(BuildContext context) {
    List favouriteHotels=[];
    List favouriteActivities=[];
    myHotels.forEach((key, value) { if(value.favourite==true){
      favouriteHotels.add(value);
    }
    });
    myActivity.forEach((key, value) { if(value.favourite==true){
      favouriteActivities.add(value);
    }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite",
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home, size: 28),
                    Text("home"),
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).popAndPushNamed("/trips");
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 28,
                      color: Color(0xffFFA985),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Text("Favourite",
                            style: TextStyle(color: Color(0xffFFA985)))),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(top: 0),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).popAndPushNamed("/settings");
                    });
                  },
                  child: signin()),
            )
          ],
        ),
      )),
      body: ListView(children: [ Container(
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
          margin: EdgeInsets.all(15),
          height: (266 * favouriteHotels.length).toDouble(),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount:favouriteHotels.length ,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {

                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/Hotel',arguments: hotelIndex(favouriteHotels[index]!.id));
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
                                              favouriteHotels[index]!.homePic),
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
                                        Container(width: 260,
                                          child:Text(favouriteHotels[index]!
                                            .hotelName,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight
                                                    .w600))),
                                        Text(favouriteHotels[index]!
                                            .price)
                                      ],
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(favouriteHotels[index]
                                            ?.location[0] +
                                            ', ' + favouriteHotels[index]
                                            ?.location[1],
                                            style: TextStyle(fontSize: 15)),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          child: ElevatedButton(
                                            onPressed: () async {

                                              await hotel().changeFavurate(
                                                  favouriteHotels[index]!.id,
                                                  favouriteHotels[index]!.favourite);
                                              setState(() {
                                                if (myHotels[index]!.favourite != true) {
                                                  MyUser1.removeFavouriteHotels(
                                                      favouriteHotels[index]!.id);
                                                } else {
                                                  MyUser1.addFavouriteHotels(
                                                      favouriteHotels[index]!.id);
                                                }
                                              });
                                              setState(() {

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
                                              favouriteHotels[index]?.favourite == true
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: Colors.orange,
                                              size: 18,
                                            ),
                                          ),
                                        ),
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
            : Container(
          margin: EdgeInsets.all(15),
          height: (310 * favouriteActivities.length).toDouble(),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount:favouriteActivities.length ,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {

                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/Activity',arguments: activityIndex(favouriteActivities[index]!.id));
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
                                              favouriteActivities[index]!.homePic),
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
                                        Container(width: 260,
                                          child: Text(favouriteActivities[index]!
                                              .name,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight
                                                      .w600)),
                                        ),
                                        Text(favouriteActivities[index]!
                                            .price)
                                      ],
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(favouriteActivities[index]
                                            ?.location[0] +
                                            ', ' + favouriteActivities[index]
                                            ?.location[1],
                                            style: TextStyle(fontSize: 15)),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              print(myHotels[index]!.favourite);
                                              print("index.no" + index.toString());
                                              await activity().changeFavurate(
                                                  favouriteActivities[index]!.id,
                                                  favouriteActivities[index]!.favourite);

                                                if (favouriteActivities[index]!.favourite != true) {
                                                await  MyUser1.removeFavouriteHotels(
                                                      favouriteActivities[index]!.id);
                                                } else {
                                                  MyUser1.addFavouriteHotels(
                                                      favouriteActivities[index]!.id);
                                                }
                                              setState(() {

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
                                              favouriteActivities[index]?.favourite == true
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: Colors.orange,
                                              size: 18,
                                            ),
                                          ),
                                        ),
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
        ),
    ]));




    /*Container(
        margin: EdgeInsets.all(15),
        height: (300 * myHotels.values.length).toDouble(),
        child: ListView.builder(
          itemCount:myHotels.length ,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            if(MyUser1.favouriteHotels.contains(myHotels[index]!.id)){
              return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Hotel',arguments: hotelIndex(index));
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
          }else{return Container();}},
        ),
      ),
    );*/
  }

  Widget signin() {
    if (cridential.currentUser == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 30,
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
}
