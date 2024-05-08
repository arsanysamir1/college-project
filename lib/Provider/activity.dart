import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final Map<int, activity> myActivity = {};
final Activities = FirebaseFirestore.instance.collection("activity");

class activity {

  void addActivity(activity activity) {
    myActivity[myActivity.values.length] = activity;
  }
  Future changeFavurate(uid,favourite) async {
    await Activities.doc(uid).update({'favourite': !favourite});
  }
  String _name = '',_id='',
      _homePic = '',
      _price = '',
      _rating = '',
      _views = '',

      _cancellation = '',//1.2
      _duration = '',
      _disc = '',//1.1
      _whatToExpect = '',//1.3.1//1.4.1
      _slots='';
  List _whatToExpectlist = [];//1.3.2
  List _aditionalInfo = [];//2.1
  List _highlights = [];//2.2
  List _whatIsIncluded = [];//2.3 list
  List _pickUp=[]; //1.4.2
  List  _meetingPoint=[];
  List  _location=[];
  List  _startDate =[];
  List  _endDate =[];
  List<dynamic> _comment = [];
  List<dynamic> _commenter = [];

  bool _favourite = false;
  bool get favourite => _favourite;
  String get name => _name;
  String get id => _id;

  String get homePic => _homePic;



  String get disc => _disc;

  String get rating => _rating;

  String get views => _views;

  String get price => _price;
  String get slots => _slots;



  String get cancellation => _cancellation;

  String get duration => _duration;

  String get whatToExpect => _whatToExpect;

  List get meetingPoint => _meetingPoint;
  List get pickUp => _pickUp;
  List get location => _location;
  List get startDate => _startDate;
  List get endDate => _endDate;
  List<dynamic> get comment => _comment;

  List<dynamic> get commenter => _commenter;

  List<dynamic> get highlights => _highlights;

  List<dynamic> get whatIsIncluded => _whatIsIncluded;

  List<dynamic> get whatToExpectlist => _whatToExpectlist;

  List<dynamic> get aditionalInfo => _aditionalInfo;
  // 'hotelName': hotelName, //1
  // 'image': image,//2
  // 'startDate': startDate,//3
  // 'endDate': endDate, //4
  // 'price': Price, //5
  // 'rating': rating, //6
  // 'views': views, //7
  // 'cancellation': cancellation,//8
  // 'location': [country, city], //9
  // 'availableDuration': duration, //10
  // 'highlight': highlight, //11
  // 'included': included, //12
  // 'meetingPoint': meetingPoint,//13
  // 'expectText': expectText,//14
  // 'expectList': expectList, //15
  // 'additional': additional, //16
  // 'disc': disc,//17
  // 'pickUp': pickUp,/
  void getIntialized(
      id,
      name,
      image,
      startDate,
      endDate,
      price,
      rating,
      views,
      cancellation,
     country,
     city,
      availableDuration,
      highlight,
      included,
      meetingPoint,
      expectText,
      expectList,
      additional,
      disc,
      pickUp,
      favourite,
      slots,
      length) {
    if (myActivity.length < length) {
      activity activity1 = activity();
      activity1._id=id;
      activity1._location.clear();
      activity1._name = name;//done
      activity1._homePic = image;//done
      activity1._price = price;//done
      activity1._location = [country,city];
      activity1._rating = rating;
      activity1._startDate =  startDate;//done
      activity1._endDate =  endDate;//done
      activity1._views = views;
      activity1._disc = disc;//1

      activity1._duration = availableDuration;//done
      activity1._meetingPoint = meetingPoint;//3
      activity1._pickUp = pickUp;
      activity1._whatToExpectlist = expectList;//4
      activity1._whatToExpect = expectText;//4
      activity1._aditionalInfo = additional;//5
      activity1._whatIsIncluded = included;//6
      activity1._highlights = highlight;//7
      activity1._cancellation = cancellation;//8
      activity1._favourite=favourite;
      int a = 0;
      FirebaseFirestore.instance
          .collection('hotel')
          .doc(id)
          .collection('Comments')
          .get()
          .then((value) => a = value.docs.length);
      for (int i = 0; i < a; i++) {
        FirebaseFirestore.instance
            .collection('hotel')
            .doc(id)
            .collection('Comments')
            .doc('Comment $a')
            .get()
            .then((value) {
          comment.add(value['commenter']);
          comment.add(value['comment']);
        });
      }
      activity().addActivity(activity1);
    }
  }
  void dispose(){
    myActivity.clear();
  }
}
