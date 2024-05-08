import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled3/home.dart';
import 'package:untitled3/service/firebase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class addActivity extends StatefulWidget {
  const addActivity({Key? key}) : super(key: key);

  @override
  State<addActivity> createState() => _addHotelState();
}

class _addHotelState extends State<addActivity> {
  late TextEditingController _ActivityName = TextEditingController();
  late TextEditingController _startDate = TextEditingController();
  late TextEditingController _endDate = TextEditingController();
  late TextEditingController _duration = TextEditingController();
  late TextEditingController _country = TextEditingController();
  late TextEditingController _city = TextEditingController();
  late TextEditingController _Price = TextEditingController();
  late TextEditingController _highlight = TextEditingController();
  late TextEditingController _included = TextEditingController();
  late TextEditingController _meetingPoint = TextEditingController();
  late TextEditingController _pickUp = TextEditingController();
  late TextEditingController _expectText = TextEditingController();
  late TextEditingController _expectList = TextEditingController();
  late TextEditingController _additional = TextEditingController();
  late TextEditingController _cancellation = TextEditingController();
  late TextEditingController _disc = TextEditingController();
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
  List _pickUps = [];
  List _expects = [];
  List _additionals = [];

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
      final uploadTask = reference.putFile(File(pickedFile!.path));
     //  Image data =await (await uploadTask).ref.getData().;
     //  var dowurl = await (await uploadTask).ref.getDownloadURL();
     //  print(dowurl);
     // // print(data);
     //  print('1');
    } catch (e) {
      print('error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      margin: EdgeInsets.only(top: 20), child: switchPage(context)),
                ],
              ),
            )
          ]),
        ));
  }

  Widget switchPage(context) {
    if (page == 1) {
      return page1();
    } else if (page == 2) {
      return page2();
    } else if (page == 3) {
      return page3();
    } else if (page == 4) {
      return page4();
    } else if (page == 5) {
      return page5();
    } else if (page == 6) {
      return page6();
    } else if (page == 7) {
      return page7();
    } else if (page == 8) {
      return page8();
    } else if (page == 9) {
      return page9();
    } else {
      return page10(context);
    }
  }

  Widget page1() {
    return Container(
      height: 680,
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
            controller: _ActivityName,
            decoration: const InputDecoration(hintText: "Acivity Name"),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 10),
                child: const Text('Background Picture',
                    style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                  onPressed: () async {
                    _showPicker(context);
                  },
                  child: const Text('Choose Pic'))
            ],
          ),
          Text(pickedFile != null
              ? '${pickedFile!.path}]'
              : 'No Image Selected'),
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

  Widget page2() {
    return Container(
      height: 680,
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
          Container(
              width: 500,
              child: Text(
                'Enter the Price, start date, end date and\nOffer Duration.',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.left,
              )),
          TextFormField(
            controller: _Price,
            validator: (value) {},
            decoration: InputDecoration(hintText: "Price per day"),
            onTap: () {},
          ),
          Row(children: [
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              child: TextFormField(
                controller: _country,
                decoration: InputDecoration(hintText: "country"),
              ),
            ),
            Container(
              width: 150,
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
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));

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

  Widget page3() {
    return Container(
      height: 680,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Text(
            "Enter a discription to your hotel.",
            style: TextStyle(fontSize: 24),
          )),
          SizedBox(
            height: 15,
          ),
          TextField(
              controller: _disc,
              keyboardType: TextInputType.multiline,
              maxLines: 18,
              decoration: InputDecoration(border: OutlineInputBorder())),
          Container(
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
                        page = 2;
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
                        page = 4;

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

  Widget page4() {
    return Container(
      height: 680,
      child: Column(
        children: [
          Container(
              child: Text(
            "What is the highlights of this activity.",
            style: TextStyle(fontSize: 18),
          )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                  controller: _highlight,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(border: OutlineInputBorder()))),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(255, 255, 255, 0.9)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(27))))),
              child: Text(
                "Add",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onPressed: () {
                if (_highlights.length < 10) {
                  setState(() {
                    _highlights.add(_highlight.text);
                    _highlight.clear();
                  });
                }
              },
            ),
          ),
          Container(
              child: Container(
            height: 350,
            child: ListView(
                children: List.generate(
                    _highlights.length,
                    (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                width: 310,
                                child: Text(_highlights[index])),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _highlights.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.close))
                          ],
                        ))),
          )),
          Container(
            width: 4000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
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
                        page = 3;
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
                        page = 5;
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

  Widget page5() {
    return Container(
      height: 680,
      child: Column(
        children: [
          Container(
              child: Text(
            "What is included in this activity.",
            style: TextStyle(fontSize: 18),
          )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                  controller: _included,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(border: OutlineInputBorder()))),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(255, 255, 255, 0.9)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(27))))),
              child: Text(
                "Add",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onPressed: () {
                if (_includeds.length < 10) {
                  setState(() {
                    _includeds.add(_included.text);
                    _included.clear();
                  });
                }
              },
            ),
          ),
          Container(
              child: Container(
            height: 350,
            child: ListView(
                children: List.generate(
                    _includeds.length,
                    (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                width: 310,
                                child: Text(_includeds[index])),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _includeds.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.close))
                          ],
                        ))),
          )),
          Container(
            width: 4000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
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
                        page = 4;
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
                        page = 6;
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

  Widget page6() {
    return Container(
      height: 680,
      child: Column(
        children: [
          Container(
              child: Text(
            "What is the meeting points.",
            style: TextStyle(fontSize: 18),
          )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                  controller: _meetingPoint,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(border: OutlineInputBorder()))),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(255, 255, 255, 0.9)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(27))))),
              child: Text(
                "Add",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onPressed: () {
                if (_meetingPoints.length < 10) {
                  setState(() {
                    _meetingPoints.add(_meetingPoint.text);
                    _meetingPoint.clear();
                  });
                }
              },
            ),
          ),
          Container(
              child: Container(
            height: 350,
            child: ListView(
                children: List.generate(
                    _meetingPoints.length,
                    (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                width: 310,
                                child: Text(_meetingPoints[index])),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _meetingPoints.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.close))
                          ],
                        ))),
          )),
          Container(
            width: 4000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
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
                        page = 5;
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
                        page = 7;
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

  Widget page7() {
    return Container(
      height: 680,
      child: Column(
        children: [
          Container(
              child: Text(
            "what is the pick up points.",
            style: TextStyle(fontSize: 18),
          )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                  controller: _pickUp,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(border: OutlineInputBorder()))),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(255, 255, 255, 0.9)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(27))))),
              child: Text(
                "Add",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onPressed: () {
                if (_pickUps.length < 10) {
                  setState(() {
                    _pickUps.add(_pickUp.text);
                    _pickUp.clear();
                  });
                }
              },
            ),
          ),
          Container(
              child: Container(
            height: 350,
            child: ListView(
                children: List.generate(
                    _pickUps.length,
                    (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                width: 310,
                                child: Text(_pickUps[index])),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _pickUps.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.close))
                          ],
                        ))),
          )),
          Container(
            width: 4000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
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
                        page = 6;
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
                        page = 8;
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

  Widget page8() {
    return Container(
      height: 680,
      child: Column(
        children: [
          Container(
              child: Text(
            "what to expect in the activity text",
            style: TextStyle(fontSize: 18),
          )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                  controller: _expectText,
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  decoration: InputDecoration(border: OutlineInputBorder()))),
          Container(
              child: Text(
            "what to expect in the activity steps",
            style: TextStyle(fontSize: 18),
          )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                  controller: _expectList,
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  decoration: InputDecoration(border: OutlineInputBorder()))),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(255, 255, 255, 0.9)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(27))))),
              child: Text(
                "Add",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onPressed: () {
                if (_expects.length < 10) {
                  setState(() {
                    _expects.add(_expectList.text);
                    _expectList.clear();
                  });
                }
              },
            ),
          ),
          Container(
              child: Container(
            height: 230,
            child: ListView(
                children: List.generate(
                    _expects.length,
                    (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                width: 310,
                                child: Text(_expects[index])),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _expects.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.close))
                          ],
                        ))),
          )),
          Container(
            width: 4000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
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
                        page = 7;
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
                        page = 9;
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

  Widget page9() {
    return Container(
      height: 680,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                  width: 360,
                  child: Text(
                    "What is the additional information you want to add about your activity.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                      controller: _additional,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration:
                          InputDecoration(border: OutlineInputBorder()))),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(255, 255, 255, 0.9)),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(27))))),
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  onPressed: () {
                    if (_additionals.length < 10) {
                      setState(() {
                        _additionals.add(_additional.text);
                        _additional.clear();
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          Container(
              child: Container(
            height: 350,
            child: ListView(
                children: List.generate(
                    _additionals.length,
                    (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                width: 310,
                                child: Text(_additionals[index])),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _additionals.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.close))
                          ],
                        ))),
          )),
          Container(
            width: 4000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
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
                        page = 8;
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
                        page = 10;
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

  Widget page10(context) {
    return Container(
      height: 680,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 500,
              child: Text(
                "Enter the cancellation policy of your activity",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              )),
          SizedBox(
            height: 15,
          ),
          TextField(
              controller: _cancellation,
              keyboardType: TextInputType.multiline,
              maxLines: 18,
              decoration: InputDecoration(border: OutlineInputBorder())),
          Container(
            width: 4000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
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
                        page = 9;
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
                                EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 14)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    side: BorderSide(width: 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(27))))),
                        onPressed: () async {
                          var uuid = Uuid();
                          var a = uuid.v4();



                        },
                        child: Text(
                          "Add Hotel",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ))),
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
