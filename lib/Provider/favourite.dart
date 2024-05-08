import 'package:flutter/material.dart';
import 'package:untitled3/addActivity.dart';
import 'package:untitled3/service/firebase.dart';
import 'package:uuid/uuid.dart';

final Map<int, favourite> myFavourite = {};
class favourite {


  void addFavourite(favourite favourite) {
    myFavourite[myFavourite.values.length] = favourite;
  }
  String _name='',_id='',_price='',_homePic='';
  List _location=[];
  String get name => _name;
  String get homePic => _homePic;
  String get price => _price;
  String get id => _id;
  List get location => _location;


  //addFavourite
  void getIntialized(
      id,
      name,
      homepic,
      price,
      country,
      city,
      length) {
    if (myFavourite.length < length) {
      favourite favourite1 = favourite();
      favourite1._id=id;
      favourite1._homePic=homepic;
      favourite1._name = name;//done
      favourite1._price = price;//done
      favourite1._location = [country,city];

      favourite().addFavourite(favourite1);
    }
  }
  void dispose(){
    myFavourite.clear();
  }
  void removeFromFavourite(id){

  }
}