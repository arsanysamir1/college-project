import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/Provider/hotel.dart';
import 'package:untitled3/runtime%20arg/toHotel.dart';
import 'package:untitled3/runtime%20arg/toSearch.dart';
import 'Provider/popular.dart';
class special extends StatefulWidget {
  const special({Key? key}) : super(key: key);

  @override
  State<special> createState() => _specialState();
}

class _specialState extends State<special> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(left: 18, top: 25, bottom: 20),
        width: 4000,
        child: Text(
          'Popular places',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          textAlign: TextAlign.left,
        ),
      ),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              height: 250,
              child: ListView.builder(
                  itemCount: myPopularPlaces.values.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return specialCard(
                        myPopularPlaces[index]!.url,
                       myPopularPlaces[index]!.name,index,context);
                  })))
    ]);
  }
}



Widget specialCard(String img, String str,index,context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).popAndPushNamed('/search',arguments: searchDetails(str));
    },
    child: Container(
      width: 180,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(15)),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: NetworkImage(img),
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 210),
              child: Text(
                str,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    ),
  );
}
