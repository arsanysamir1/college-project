import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled3/Provider/User.dart';
import 'package:untitled3/Provider/favourite.dart';
import 'package:uuid/uuid.dart';
class databaseService {
  final String uid;
  final myUser = FirebaseFirestore.instance.collection("MyUser");
  final like = FirebaseFirestore.instance.collection("like");
  final hotel = FirebaseFirestore.instance.collection("hotel");
  final activity = FirebaseFirestore.instance.collection("activity");

  databaseService({required this.uid});
  String userId=FirebaseAuth.instance.currentUser!.uid;

  Future addNewUser(String? firstName, lastName, userName, email, phoneNum,
      location, adult, kids, kidsAge, rooms, age, img) async {
    return await myUser.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'phoneNum': phoneNum,
      'age': age,
      'location': location,
      'adult': adult,
      'kids': kids,
      'kidsAge': kidsAge,
      'rooms': rooms,
      'img': img
    });
  }
  Future addComment(String commentId, comment) {
    var uuid = Uuid();
    var a = uuid.v4();
    return comment
        .doc(a)
        .set({
      'commenterId': userId,
      'comment': comment,
      'commentId': commentId,
    });
  }


  Future addUserComment(String  commenter,post, comment) {
    int num=0;
    myUser.doc(uid).collection('Comments').get().then((value) => num=value.docs.length);
    return myUser
        .doc(userId)
        .collection('Comments')
        .doc('Comment $num')
        .set({

      'commenter': commenter,
      'post':post,
      'comment': comment,
    });
  }

  Future addHotelComment(String commenter, comment) {
    int num=0;
    hotel.doc(uid).collection('Comments').get().then((value) =>num= value.docs.length);

    return hotel
        .doc(uid)
        .collection('Comments')
        .doc('Comment $num')
        .set({
      'commenter': commenter,
      'comment': comment,
    });
  }
  Future addFavurate(String name,image, id,price,country,city) {
    return myUser
        .doc(userId)
        .collection('Favourite')
        .doc(uid)
        .set({
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'location': [country,city],
    });

  }
  Future removeFromFavourate(String id) {
    return myUser
        .doc(userId)
        .collection('Favourite')
        .doc(uid).delete();
  }




  Future addActivityComment(String commenter, comment) {
    int num=0;
    activity.doc(uid).collection('Comments').get().then((value) => num=value.docs.length);
    return activity
        .doc(uid)
        .collection('Comments')
        .doc('Comment $num')
        .set({
      'commenter': commenter,
      'comment': comment,
    });
  }

  Future addNewHotel(
      String hotelName,
      homePic,
      price,
      rating,
      views,
      publisher,
      country,
      city,
      guest,
      offer,
      availableDuration,
      location,
      singleBedNum,
      doubleBedNum,
      disc,
      policies,
      futures,favourite) async {
    return await hotel.doc(uid).set({
      'hotelName': hotelName,
      'homePic': homePic,
      'price': price,
      'rating': rating,
      'views': views,
      'offer': offer,
      'location': [country, city],
      'availableDuration': availableDuration,
      'guest': guest,
      'singleBedNum': singleBedNum,
      'doubleBedNum': doubleBedNum,
      'publisher': publisher,
      'disc': disc,
      'policies': policies,
      'futures': futures,
      'favourite': favourite

    });
  }



  /*
  _hotelName
 _startDate
 _endDate
 _duration
 _country
 _city

 _Price
 _highlight
 _included
 _meetingPoint
 _pickUp
 _expectText
 _expectList
 _additional
 _cancellation
 _disc



   */

  Future addNewActivity(
      name,
      image,
      startDate,
      endDate,
      duration,
      country,
      rating,
      views,
      city,
      Price,
      highlight,
      included,
      meetingPoint,
      pickUp,
      expectText,
      expectList,
      additional,
      cancellation,
      disc) async {
    List imgs=[];
    return await activity.doc(uid).set({
      'name': name, //1
      'image': image,//2
      'startDate': startDate,//3
      'endDate': endDate, //4
      'price': Price, //5
      'rating': rating, //6
      'views': views, //7
      'cancellation': cancellation,//8
      'location': [country, city], //9
      'availableDuration': duration, //10
      'highlight': highlight, //11
      'included': included, //12
      'meetingPoint': meetingPoint,//13
      'expectText': expectText,//14
      'expectList': expectList, //15
      'additional': additional, //16
      'disc': disc,//17
      'pickUp': pickUp,//18
      'images': imgs,//19
      'publisher': userId,//19
    });
  }


}
