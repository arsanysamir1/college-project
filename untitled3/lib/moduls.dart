import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
FirebaseAuth newUser=FirebaseAuth.instance;

class MyUser {
  final String id;
  String? _firstName,_lastName,_userName, _email, _password, _phoneNum,_img;
  int? _age,_room,_adult,_child;
  late List<int> _childernAges;
  MyUser({required this.id});

  MyUser.intialized(this._firstName,this._lastName,
      this._userName, this._email, this._password, this._phoneNum,{required this.id});
  String get firstName => _firstName!;
  String get lastName => _lastName!;
  String get userName => _userName!;
  String get email => _email!;
  String get password => _password!;
  String get img => _img!;
  String get phoneNum => _phoneNum!;
  List<int> get childernAges => childernAges;
  int get age => _age!;
  int get room => room!;
  int get adult => _adult!;
  int get child => _child!;

  void setFirstName(name) {
    name !=null ? _phoneNum=name:num!=null;
  }
  void setImg(img) {
    img !=null ? _img=img:img!=null;
  }
  void setLastName(name) {
    name !=null ? _phoneNum=name:num!=null;
  }
  void setUsername(name) {
    if (name != null || name != "") {
      _userName = name;

    } else {
      print("please enter your user name");
    }
  }
  void setEmail(email) {
    if (email != null && email.contains("@") && email.contains(".") ) {
      _email = email;
    } else {
      print("please enter a suitable email");
    }
  }
  void setPassword(pass) {
    pass !=null ? _password=pass:pass!=null;
  }
  void setPhoneNum(num) {
    num !=null ? _phoneNum=num:num!=null;
  }
  void setAge(age) {
    age !=null ? _phoneNum=age:age!=null;
  }
}






