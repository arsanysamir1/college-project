import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled3/service/database.dart';
class addHotel2 extends StatefulWidget {
  const addHotel2({Key? key}) : super(key: key);

  @override
  State<addHotel2> createState() => _addHotel2State();
}

class _addHotel2State extends State<addHotel2> {
  @override

  late TextEditingController _hotelName = TextEditingController();
  late TextEditingController _Rooms = TextEditingController();
  late TextEditingController _Doublebed = TextEditingController();
  late TextEditingController _Singlebed = TextEditingController();
  late TextEditingController _Price = TextEditingController();
  late TextEditingController _Offer = TextEditingController();
  late TextEditingController _Duration = TextEditingController();
  late TextEditingController _Country = TextEditingController();
  late TextEditingController _City = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  final _formKey = GlobalKey<FormState>();
  dynamic y=1;
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          margin: EdgeInsets.only(top: 60),
          decoration: (BoxDecoration(color: Colors.white70)),
          child: Column(children: [
            Container(
                height: 705,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                    border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hotel Information",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextFormField(
                        controller: _hotelName,
                        decoration: InputDecoration(hintText: "Hotel Name"),
                      ),

                      Row(
                        children: [
                          Container(
                            child: Text('Background Picture',style: TextStyle(fontSize: 18)),
                            padding: EdgeInsets.only(right: 10),
                          ),
                          ElevatedButton(onPressed: () async {
                            getImage();
                          }, child: Text('Choose Pic'))
                        ],
                      ),
                      Text(_image?.path != null ?'${_image!.path}]':'No Image Selected'),

                      Row(
                        children: [
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(right: 20),
                            child: TextFormField(
                              controller: _Rooms,
                              decoration: InputDecoration(hintText: "Rooms"),
                            ),
                          ),
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(right: 20),
                            child: TextFormField(
                              controller: _Doublebed,
                              decoration:
                              InputDecoration(hintText: "Double bed"),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: TextFormField(
                              controller: _Singlebed,
                              decoration:
                              InputDecoration(hintText: "Single bed"),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          width: 500,
                          child: Text(
                            'Enter the number of rooms and bedrooms.',
                            style: TextStyle(fontSize: 20),
                          )),
                      TextFormField(
                        controller: _Price,
                        validator: (value) {},
                        decoration: InputDecoration(hintText: "Price per day"),
                        onTap: () {},

                      ),
                      Row(
                        children: [
                          Container(
                            width: 165,
                            margin: EdgeInsets.only(right: 20),
                            child: TextFormField(
                              controller: _Offer,
                              decoration: InputDecoration(hintText: "Offer"),
                            ),
                          ),
                          Container(
                            width: 135,
                            margin: EdgeInsets.only(right: 20),
                            child: TextFormField(
                              controller: _Duration,
                              decoration: InputDecoration(hintText: "Duration"),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          width: 500,
                          child: Text(
                            'Enter the Price, Offer and\nOffer Duration.',
                            style: TextStyle(fontSize: 19),
                          )),
                      Row(children: [
                        Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 20),
                          child: TextFormField(
                            controller: _Country,
                            decoration: InputDecoration(hintText: "Country"),
                          ),
                        ),
                        Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 20),
                          child: TextFormField(
                            controller: _City,
                            decoration: InputDecoration(hintText: "City"),
                          ),
                        ),

                      ]),

                      Container(
                          width: 500,
                          child: Text(
                            'Enter the Location, Country\nand City.',
                            style: TextStyle(fontSize: 19),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(255, 255, 255, 0.9)),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 60, vertical: 17)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        side: BorderSide(width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(27))))),
                            onPressed: () async {
                              var x = FirebaseAuth.instance.currentUser!.uid;

                              FirebaseFirestore.instance.collection("hotel").get().then((value) {
                                value.size!=null ? y=value.size+1:y=1;
                                print(value.size);
                              });

                              await databaseService(uid:y.toString()).addNewHotel(
                                _hotelName.text,
                                _image!.path,
                                _Price.text,
                                '0',
                                '0',
                                x,
                                _Country.text,
                                _City.text,
                                _Rooms.text,
                                _Offer.text,
                                _Duration.text,
                                [_Country.text,
                                  _City.text],
                                _Singlebed.text,
                                _Doublebed.text
                              );

                            },
                            child: Text(
                              "add video",
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ))
          ]),
        ));
  }
  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });

  }
}
