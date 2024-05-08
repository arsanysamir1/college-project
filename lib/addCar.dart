import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class addCar extends StatefulWidget {
  const addCar({Key? key}) : super(key: key);

  @override
  State<addCar> createState() => _addHotelState();
}

class _addHotelState extends State<addCar> {
  late TextEditingController _carBrand = TextEditingController();
  late TextEditingController _carModel = TextEditingController();
  late TextEditingController _modelYear = TextEditingController();
  late TextEditingController _name = TextEditingController();
  late TextEditingController _phoneNum = TextEditingController();
  late TextEditingController _seats = TextEditingController();
  late TextEditingController _price = TextEditingController();
  late TextEditingController _country = TextEditingController();
  late TextEditingController _city = TextEditingController();
  late TextEditingController _startDate = TextEditingController();
  late TextEditingController _endDate = TextEditingController();
  late TextEditingController _duration = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  late dynamic y;
  dynamic page = 1;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  XFile? pickedFile = null;
  File? _photo;
  List _highlights = [];
  List _includeds = [];
  List _meetingPoints = [];

  Future imgFromGallery() async {
    pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile!.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile!.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    try {
      Reference ref = firebase_storage.FirebaseStorage.instance.ref();
      Reference reference = ref.child('file/${pickedFile?.name}');
      reference.putFile(File(pickedFile!.path));
    } catch (e) {
      print('error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          margin: EdgeInsets.only(top: 60),
          decoration: (BoxDecoration(color: Colors.white)),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.3),
                  border: Border.all(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Text("Activity Information",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Container(
                      margin: EdgeInsets.only(top: 20), child: switchPage(context,height)),
                ],
              ),
            )
          ]),
        ));
  }

  Widget switchPage(context,height) {
    if (page == 1) {
      return page1(height);
    }  else  {
      return page2(height);
    }
    /*else if (page == 7) {
      return page7();
    } else if (page == 8) {
      return page8();
    } else if (page == 9) {
      return page9();
    } else {
      return page10(context);
    }*/
  }

  Widget page1(height) {
    return Container(
      height: height/1.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(
                    left: 0,
                    top: 120,
                  ),
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/hotel1.jpg')))),
              Container(
                  margin: EdgeInsets.only(left: 120, top: 30),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/333b535a6dd6c6b04c4772db542f6084.jpg')))),
            ],
          ),
          TextFormField(
            controller: _carBrand,
            decoration: const InputDecoration(hintText: "Car brand"),
          ),
          Row(children: [
            Container(
              width: 190,
              margin: EdgeInsets.only(right: 20),
              child: TextFormField(
                controller: _carModel,
                decoration: InputDecoration(hintText: "Car model"),
              ),
            ),
            Container(
              width: 140,
              margin: EdgeInsets.only(right: 20),
              child: TextFormField(
                controller: _modelYear,
                decoration: InputDecoration(hintText: "Model Year"),
              ),
            ),
          ]),
          Row(children: [
            Container(
              width: 190,
              margin: EdgeInsets.only(right: 20),
              child: TextFormField(
                controller: _name,
                decoration: InputDecoration(hintText: "Drivers name"),
              ),
            ),
            Container(
              width: 140,
              margin: EdgeInsets.only(right: 20),
              child: TextFormField(
                controller: _phoneNum,
                decoration: InputDecoration(hintText: "phone num"),
              ),
            ),
          ]),

          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(255, 255, 255, 0.9)),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        side: BorderSide(width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
                onPressed: () {
                  setState(() {
                    page = 2;
                  });
                },
                child: const Text(
                  "next",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
          ),
        ],
      ),
    );
  }

  Widget page2(height) {
    return Container(
      height: height/1.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(children: [
            Container(
                margin: EdgeInsets.only(
                  left: 0,
                  top: 80,
                ),
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/hotel1.jpg')))),
            Container(
                margin: EdgeInsets.only(left: 120, top: 180),
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage('assets/price.png')))),
          ]),
          Row(children: [
            Container(
              width: 165,
              margin: EdgeInsets.only(right: 20),
              child: TextFormField(
                controller: _seats,
                decoration: InputDecoration(hintText: "Num.of seats"),
              ),
            ),
            Container(
              width: 165,
              margin: EdgeInsets.only(right: 20),
              child: TextFormField(
    controller: _price,
    validator: (value) {},
    decoration: InputDecoration(hintText: "Price per day"),
    onTap: () {},
    ),
            ),
          ]),

          Row(children: [
            Container(
              width: 165,
              margin: EdgeInsets.only(right: 20),
              child: TextFormField(
                controller: _country,
                decoration: InputDecoration(hintText: "country"),
              ),
            ),
            Container(
              width: 165,
              margin: EdgeInsets.only(right: 20),
              child: TextFormField(
                controller: _city,
                decoration: InputDecoration(hintText: "city"),
              ),
            ),
          ]),
          Row(
            children: [
              Container(
                width: 350,
                margin: EdgeInsets.only(right: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    DateTimeRange? Date = await showDateRangePicker(
                        context: context,
                        currentDate: DateTime.now(),
                        firstDate: DateTime(2025,1),
                        lastDate: DateTime(2025,1,31));
                    print(Date!.start.toString());
                    _startDate.text =
                    "${Date?.start.day}:${Date?.start.month}:${Date?.start.year}";
                    _endDate.text =
                    "${Date?.end.day}:${Date?.end.month}:${Date?.end.year}";

                    //int a=(Date.duration.inDays/7).toInt();
                    _duration.text = Date!.duration.inDays.toInt().toString();
                    print(_duration.text);
                    //print(a);
                  },
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 0))),
                  //controller: _startDate,
                  child: Text("set Start date, End date and Duration"),
                ),
              ),
            ],
          ),
          Container(
            width: 5000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(255, 255, 255, 0.9)),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(27))))),
                    child: Text(
                      "Previous",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        page = 1;
                      });
                    },
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(255, 255, 255, 0.9)),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(27))))),
                    child: Text(
                      "next",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        page = 3;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
