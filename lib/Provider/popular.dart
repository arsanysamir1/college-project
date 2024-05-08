import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled3/addHotel.dart';
import 'package:untitled3/service/firebase.dart';
import 'package:uuid/uuid.dart';
final Map<int, popular> myPopularPlaces = {};

class popular {

  void addPopular(popular) {
    myPopularPlaces[myPopularPlaces.values.length] = popular;
  }

  dynamic _name = '',
      _url = '';

  String get name => _name!;
  String get url => _url!;

  void getIntialized(name,url) {
    final popular1=popular();
    popular1._name=name;
    popular1._url=url;

    popular().addPopular(popular1);
  }
  void dispose() {
   myPopularPlaces.clear();
  }

}
