import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled3/service/firebase.dart';
final MyUser MyUser1=MyUser();
class MyUser {
  String _firstName = '',
      _lastName = '',
      _userName = '',
      _email = '',
      _phoneNum = '',
      _img = '',
      _age = '0',
      _rooms = '1',
      _adults = '1',

      _children = '0';

  List<dynamic> _childrenernAges = [];
  List<dynamic> _location = [];
  List<dynamic> _favouriteHotels = [];
  List<dynamic> _favouriteActivities = [];
  List<String>  _startDate = [];
  List<String>  _endDate = [];

  /*
  'startDate': startDate,
  'endDate': endDate
  */

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get userName => _userName;

  String get email => _email;

  String get img => _img;

  String get phoneNum => _phoneNum;

  List<dynamic>  get childernAges => _childrenernAges;
  List<dynamic>  get location => _location;
  List<dynamic>  get favouriteActivities => _favouriteActivities;
  List<dynamic>  get favouriteHotels => _favouriteHotels;
  List<String>  get startDate => _startDate;
  List<String>   get endDate => _endDate;

  String get age => _age;

  String get rooms => _rooms;

  String get adult => _adults;

  String get children => _children;

  void getIntialized(String firstName, lastName, userName, email, phoneNum, img,
      age, location,favouriteHotels,favouriteActivities) {
    MyUser1._firstName = firstName;
    MyUser1._lastName = lastName;
    MyUser1._userName = userName;
    MyUser1._email = email;
    MyUser1._phoneNum = phoneNum;
    MyUser1._age = age;
    MyUser1._location = location;
    MyUser1._img=img;
    MyUser1._favouriteActivities=favouriteActivities;
    MyUser1._favouriteHotels=favouriteHotels;
  }

  void increaseRoom() {
    MyUser1._rooms = (int.parse(_rooms) + 1).toString();
  }

  void dicreaseRoom() {

    MyUser1._rooms = (int.parse(MyUser1._rooms) - 1).toString();
    
  }

  void increaseAdult() {

    MyUser1._adults = (int.parse(MyUser1._adults) + 1).toString();

    
  }

  void dicreaseAdult() {
    MyUser1._adults = (int.parse(MyUser1._adults) - 1).toString();

    
  }

  void increaseChild() {

    MyUser1._children = (int.parse(MyUser1._children) + 1).toString();

    
  }

  void dicreaseChild() {

    MyUser1._children = (int.parse(MyUser1._children) - 1).toString();
      
  }
  void addChildAge(value){
    MyUser1._childrenernAges.add(value);
  }
  void removeChildAge(){
    MyUser1._childrenernAges.removeAt(_childrenernAges.length-1);
  }
  Future addFavouriteHotels(id){
    MyUser1.favouriteHotels.add(id);
    return FirebaseFirestore.instance
        .collection("MyUser")
        .doc(currentuser).update({'favouriteHotels': MyUser1.favouriteHotels,});

  }
  Future removeFavouriteHotels(id){

   MyUser1._favouriteHotels.removeWhere((element) => element==id);
  return FirebaseFirestore.instance
       .collection("MyUser")
       .doc(currentuser)
       .update({'favouriteHotels': MyUser1.favouriteHotels,});
   // for(index=1;index<=MyUser1.favouriteHotels.length;index++){print(index);}
   // MyUser1.favouriteHotels.add(id);
   //  if( MyUser1.favouriteHotels.length!=0) {
   //    FirebaseFirestore.instance
   //        .collection("MyUser")
   //        .doc(currentuser)
   //        .update({'favouriteHotels': favouriteHotels,});
   //  }
  }
  Future addFavouriteActivities(id){

    MyUser1._favouriteActivities.add(id);
    return FirebaseFirestore.instance
        .collection("MyUser")
        .doc(currentuser).update({'favouriteActivities': MyUser1.favouriteActivities,});

  }
  Future removeFavouriteActivities(id){

    MyUser1._favouriteActivities.removeWhere((element) => element==id);
    return FirebaseFirestore.instance
        .collection("MyUser")
        .doc(currentuser).update({'favouriteActivities': MyUser1.favouriteActivities,});

  }

  void increaseChildAge(index){

    MyUser1._childrenernAges[index]=(int.parse(MyUser1._childrenernAges[index])+1).toString();
    FirebaseFirestore.instance
        .collection("MyUser")
        .doc(currentuser)
        .update({'kidsAge': childernAges,});


  }
  void dicreaseChildAge(index){
    MyUser1._childrenernAges[index]=(int.parse(MyUser1._childrenernAges[index])-1).toString();
    FirebaseFirestore.instance
        .collection("MyUser")
        .doc(currentuser)
        .update({'kidsAge': childernAges,});
  }void saveGuesDetails(rooms,adults,kids,kidsAge){
    FirebaseFirestore.instance
        .collection("MyUser")
        .doc(currentuser)
        .update({ 'adult': adults,
      'kids': kids,
      'kidsAge': kidsAge,
      'rooms': rooms,});
  }

  final currentuser = FirebaseAuth.instance.currentUser!.uid;
  void setFirstName(String firstName) {
    if (firstName == '' || firstName == null) {

    } else {
      MyUser1._firstName = firstName;

      FirebaseFirestore.instance
          .collection("MyUser")
          .doc(currentuser)
          .update({
        'firstName': firstName,
      });
     
    }
  }

  void setAge(String age) {
    if (age == '' || age == null) {

    } else {
      MyUser1._age = age;
      FirebaseFirestore.instance.collection("MyUser").doc(currentuser).update(
          {'age': age});
     
    }
  }

  void setRooms(String room) {
    if (room == '' || room == null) {

    } else {
      MyUser1._rooms = room;
      FirebaseFirestore.instance.collection("MyUser").doc(currentuser).update(
          {'rooms': room});
     
    }
  }

  void setAdult(String adult) {
    if (adult == '' || adult == null) {

    } else {
      MyUser1._adults = adult;


      FirebaseFirestore.instance
          .collection("MyUser")
          .doc(currentuser)
          .update({'adult': adult,});
     
    }
  }

  void setChildren(String child) {
    if (child == '' || child == null) {

    } else {
      MyUser1._children = child;

      FirebaseFirestore.instance
          .collection("MyUser")
          .doc(currentuser)
          .update({
        'kids': child,});
     
    }
  }
  void setChildrenAges(List<String> childernAges) {
    if (childernAges.length==0 || childernAges == null) {

    } else {
      MyUser1._childrenernAges = childernAges;
      FirebaseFirestore.instance
          .collection("MyUser")
          .doc(currentuser)
          .update({'kidsAge': childernAges,});
     
    }
  }

  void setImage(String img) {
    if(img==''||img==null){

    }else{
      MyUser1._img = img;
      try{
        FirebaseFirestore.instance
            .collection("MyUser")
            .doc(currentuser).update({'image': img});
      }catch(e){
        print(e);
      }

     
    }
  }
  void setLocation(location){
    MyUser1._location.clear();
    MyUser1._location.add(location);

  }
}
