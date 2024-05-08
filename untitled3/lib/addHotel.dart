import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled3/home.dart';
import 'package:untitled3/service/database.dart';
import 'package:image_picker/image_picker.dart';

class addHotel extends StatefulWidget {
  const addHotel({Key? key}) : super(key: key);

  @override
  State<addHotel> createState() => _addHotelState();
}

class _addHotelState extends State<addHotel> {
  late TextEditingController _hotelName = TextEditingController();
  late TextEditingController _Rooms = TextEditingController();
  late TextEditingController _Doublebed = TextEditingController();
  late TextEditingController _Singlebed = TextEditingController();
  late TextEditingController _Price = TextEditingController();
  late TextEditingController _Offer = TextEditingController();
  late TextEditingController _Duration = TextEditingController();
  late TextEditingController _Country = TextEditingController();
  late TextEditingController _City = TextEditingController();
  late TextEditingController _facility = TextEditingController();
  late TextEditingController _disc = TextEditingController();
  late TextEditingController _pol = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  final _formKey = GlobalKey<FormState>();
  dynamic y = 1, page = 1;
  List<String> futures = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          margin: EdgeInsets.only(top: 60),
          decoration: (BoxDecoration(color: Colors.white70)),
          child: ListView(physics: NeverScrollableScrollPhysics(), children: [
            Container(
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
                    children: [
                      Text("Hotel Information",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 600,
                          child: switchPage()),
                    ],
                  ),
                ))
          ]),
        ));
  }

  Widget switchPage() {
    if (page == 1) {
      return page1();
    } else if (page == 2) {
      return page2();
    }
    else if (page == 3) {
      return page3();
    }
    else if (page == 4) {
      return page4();
    } else if (page == 5) {
      return page5();
    }else if (page == 6) {
      return page6();
    }
    else {
      return page7();
    }
  }

  Widget page1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 300,
        ),
        TextFormField(
          controller: _hotelName,
          decoration: InputDecoration(hintText: "Hotel Name"),
        ),
        Row(
          children: [
            Container(
              child: Text('Background Picture', style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.only(right: 10),
            ),
            ElevatedButton(
                onPressed: () async {
                  getImage();
                },
                child: Text('Choose Pic'))
          ],
        ),
        Text(_image?.path != null ? '${_image!.path}]' : 'No Image Selected'),
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
                      borderRadius: BorderRadius.all(Radius.circular(27))))),
              onPressed: () {
                setState(() {
                  page = 2;
                });
              },
              child: Text(
                "next",
                style: TextStyle(fontSize: 18, color: Colors.black),
              )),
        ),
      ],
    );
  }

  Widget page2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 300,
        ),
        Container(
            width: 500,
            child: Text(
              'Enter the number of rooms and bedrooms.',
              style: TextStyle(fontSize: 24),
            )),
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
                decoration: InputDecoration(hintText: "Double bed"),
              ),
            ),
            Container(
              width: 100,
              child: TextFormField(
                controller: _Singlebed,
                decoration: InputDecoration(hintText: "Single bed"),
              ),
            ),
          ],
        ),
        Row(
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
      ],
    );
  }

  Widget page3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 300,
        ),
        Container(
            width: 500,
            child: Text(
              'Enter the Price, Offer and\nOffer Duration.',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.left,
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
        Row(
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
      ],
    );
  }

  Widget page4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 300,
        ),
        Container(
            width: 500,
            child: Text(
              "Enter a discription to your hotel.",
              style: TextStyle(fontSize: 24),
            )),
        SizedBox(
          height: 15,
        ),
        TextField(controller: _disc,
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            decoration: InputDecoration(border: OutlineInputBorder())),
        Row(
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
      ],
    );
  }

  Widget page5() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 500,
            child: Text(
              'Enter the policies of your hotel.',
              style: TextStyle(fontSize: 24),
            )),
        TextField(controller: _pol,
            keyboardType: TextInputType.multiline,
            maxLines: 18,
            decoration: InputDecoration(border: OutlineInputBorder())),
        Row(
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
      ],
    );
  }

  Widget page6() {
    return Column(
      children: [
        Container(
            child: Text(
              "Enter the facilities to your hotel.",
              style: TextStyle(fontSize: 24),
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: TextField(
                controller: _facility,
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
              if (futures.length < 10) {
                setState(() {
                  futures.add(_facility.text);
                  _facility.clear();
                });
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Container(
            height: 310,
            child: GridView.builder(
              itemCount: futures.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2.9),
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: MyGrid(index));
              },
            ),
          ),
        ),
        Row(
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
      ],
    );
  }

  Widget page7(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 300,
        ),
        Container(
            width: 500,
            child: Text(
              'Enter the Location, Country\nand City.',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.left,
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
        Row(
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
                        borderRadius: BorderRadius.all(Radius.circular(27))))),
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
                            EdgeInsets.symmetric(horizontal: 40, vertical: 14)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(27))))),
                    onPressed: () async {
                      var x = FirebaseAuth.instance.currentUser!.uid;

                      FirebaseFirestore.instance
                          .collection("hotel")
                          .get()
                          .then((value) {
                        value.size != null ? y = value.size + 1 : y = 1;
                        print(value.size);
                      });

                      await databaseService(uid: y.toString()).addNewHotel(
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
                        [_Country.text, _City.text],
                        _Singlebed.text,
                        _Doublebed.text,


                      );
                    },
                    child: Text(
                      "Add Hotel",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ))),
          ],
        ),
      ],
    );
  }





  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Widget MyGrid(int index) {
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.blueAccent),padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            futures[index],
            textAlign: TextAlign.center,
          ),
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.xmark))
        ],
      ),
    );
  }
}
