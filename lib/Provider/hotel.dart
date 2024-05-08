import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled3/Provider/comment.dart';

final Map<int, hotel> myHotels = {};
final Hotels = FirebaseFirestore.instance.collection("hotel");

class hotel {
  void addHotel(hotel hotel) {
    myHotels[myHotels.values.length] = hotel;
  }

  Future changeFavurate(uid, favourite) async {
    await Hotels.doc(uid).update({'favourite': !favourite});
  }

  dynamic _hotelName = '',
      _id = '',
      _homePic = '',
      _price = '',
      _offer = '',
      _rating = '',
      _views = '',
      _disc = '',
      _availableDuration = '',
      _singleBedNum = '',
      _policies = '',
      _guest = '',
      _doubleBedNum = '';
  List<dynamic> _startDate = [];
  List<dynamic> _endDate = [];

  List<dynamic> _future = [];
  bool _favourite = false;
  List<dynamic> _location = [];
  List<dynamic> _comment = [];
  List<dynamic> _commenter = [];

  /*
  'startDate': startDate,
  'endDate': endDate
  */

  String get hotelName => _hotelName;

  String get id => _id;

  String get homePic => _homePic;

  String get policies => _policies;

  String get disc => _disc;

  String get rating => _rating;

  String get views => _views;

  String get price => _price;

  List<dynamic> get future => _future;

  List<dynamic> get location => _location;

  List<dynamic> get startDate => _startDate;

  List<dynamic> get endDate => _endDate;

  List<dynamic> get comment => _comment;

  List<dynamic> get commenter => _commenter;

  bool get favourite => _favourite;

  String get offer => _offer;

  String get singleBedNum => _singleBedNum;

  String get doubleBedNum => _doubleBedNum;

  String get guest => _guest;

  String get availableDuration => _availableDuration;

  void getIntialized(
      id,
      hotelName,
      homePic,
      price,
      offer,
      rating,
      views,
      disc,
      availableDuration,
      policies,
      location,
      guest,
      doubleBedNum,
      singleBedNum,
      futures,
      favourite,
      startDate,
      endDate,
      length) {
    if (myHotels.length < length) {
      final hotel1 = hotel();

      hotel1._hotelName = hotelName;
      hotel1._id = id;
      hotel1._homePic = homePic;
      hotel1._price = price;
      hotel1._offer = offer;
      hotel1._rating = rating;
      hotel1._views = views;
      hotel1._disc = disc;
      hotel1._availableDuration = availableDuration;
      hotel1._policies = policies;
      hotel1._location = location;
      hotel1._guest = guest;
      hotel1._doubleBedNum = doubleBedNum;
      hotel1._singleBedNum = singleBedNum;
      hotel1._future = futures;
      hotel1._favourite = favourite;
      hotel1._startDate = startDate;
      hotel1._endDate = endDate;
      int a = 0;
      FirebaseFirestore.instance
          .collection('hotel')
          .doc(id)
          .collection('Comments')
          .get()
          .then((value) {
        a = value.docs.length;
        print(value.docs.length);
      }

      );
      for (int i = 0; i < a; i++) {
        FirebaseFirestore.instance
            .collection('hotel')
            .doc(id)
            .collection('Comments')
            .doc('Comment $i')
            .get()
            .then((value) {
              print("commenter"+value[commenter]+value.get("commenter")+value.id);
          hotel1._commenter.add(value['commenter']);
          hotel1._comment.add(value['commenter']);
        });
      }

      addHotel(hotel1);
    }
  }

  /**/
  void increaseViews() {
    _views = (int.parse(_views) + 1).toString();
  }

  void dicreaseViews() {
    _views = (int.parse(_views) - 1).toString();
  }
}
