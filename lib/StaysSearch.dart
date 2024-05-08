import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled3/runtime%20arg/toSearch.dart';

import 'Provider/User.dart';

class hotelSearch extends StatefulWidget {
  const hotelSearch({Key? key}) : super(key: key);

  @override
  State<hotelSearch> createState() => _hotelSearchState();
}

class _hotelSearchState extends State<hotelSearch> {
  @override
  late var showstr = [];
  late var str = [];
  var thisUser = FirebaseAuth.instance.currentUser?.uid;
  Stream<QuerySnapshot> Sstream =
  FirebaseFirestore.instance.collection('popular').snapshots();
  Stream<QuerySnapshot> hstream =
  FirebaseFirestore.instance.collection('hotel').snapshots();

  TextEditingController text = TextEditingController();

  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: 500,
            padding: EdgeInsets.all(20),
            child: StreamBuilder<QuerySnapshot>(
                stream: Sstream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot querySnapshot = snapshot.data!;
                    var hotelName = [];
                    var hotel = [];
                    querySnapshot.docs.forEach((element) {
                      hotel.add(element);
                      hotelName.add(element.get('name'));
                      str = hotelName;
                    });
                    return ListView(children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: Color(0xffFFA985)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Color(0xffFFA985),
                                  )),
                              Container(
                                width: 252,
                                child: TextField(
                                  onSubmitted: (value) {
                                    MyUser().location.clear();
                                    setState(() {
                                      MyUser().setLocation(value);
                                    });

                                    Navigator.of(context).popAndPushNamed('/search',arguments: searchDetails(value));
                                  },
                                  controller: text,
                                  onChanged: suggestion,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0, style: BorderStyle.none)),
                                    hintText: "Enter Distinction",
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      text.clear();
                                      showstr.clear();
                                    });
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Color(0xffFFA985),
                                  ))
                            ]),
                      ),
                      showstr.isEmpty
                          ? Container()
                          : Container(
                        height: str.length * 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(0, 0, 0, 0.1))),
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: showstr.length,
                          itemBuilder: (context, index) {
                            return Container(
                                child: ListTile(onTap: () {
                                  MyUser().location.clear();
                                  setState(() {
                                    MyUser().setLocation(showstr[index]);
                                  });

                                  Navigator.of(context).popAndPushNamed('/search',arguments: searchDetails(showstr[index]));
                                },
                                  title: Text(showstr[index]),
                                ));
                          },
                        ),
                      )
                    ]);
                  } else {
                    return Container();
                  }
                })));
  }

  dynamic suggestion(String query) {
    if (text == null || query == '') {
      setState(() {
        showstr.clear();
      });
    }
    else {
      final suggest = str.where((String) {
        final location = String.toLowerCase();
        final input = query.toLowerCase();
        return location.contains(input);
      }).toList();
      setState(() {
        showstr = suggest;
      });
    }
  }

}