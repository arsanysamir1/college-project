import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:untitled3/Provider/User.dart';
import 'package:untitled3/Provider/searchPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:untitled3/runtime%20arg/toHotel.dart';


import 'Provider/hotel.dart';

class hotelBooking extends StatefulWidget {
  const hotelBooking({Key? key}) : super(key: key);

  @override
  State<hotelBooking> createState() => _bookingState();
}

class _bookingState extends State<hotelBooking> {
  @override
  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile = null;
  File? _photo;

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

  Widget build(BuildContext context) {
    late hotel hotel2 = hotel();

    final hotelindex = ModalRoute.of(context)?.settings.arguments as hotelIndex;
    myHotels.forEach((key, value) {
      if (value.id == hotelindex.Id) {
        hotel2 = value;
      }
    });

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                Container(

                  margin: EdgeInsets.only( top: 20,bottom: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_rounded,
                        color: Colors.orange, size: 27),
                  ),
                ),
              ],
            ),
            Container(
              height: 240,
              width: 410,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(
                        hotel2.homePic,
                      ),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Chick-in"),
                      Text(MyUser1.startDate[0] +
                          ":" +
                          MyUser1.startDate[1] +
                          ":" +
                          MyUser1.startDate[2]),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Chick-out"),
                      Text(MyUser1.endDate[0] +
                          ":" +
                          MyUser1.endDate[1] +
                          ":" +
                          MyUser1.endDate[2]),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub total"),
                      Text(hotel2.price),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("discount"),
                      Text('0.00'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: TextStyle(fontSize: 20)),
                      Text(hotel2.price, style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 400,
                      child: Text(
                          "You can send the price to the following acounts")),
                  SizedBox(
                    height: 10,
                  ),
                  Container(width: 400, child: Text("National Bank of Egypt")),
                  Container(width: 400, child: Text("182307032188330019")),
                  SizedBox(
                    height: 10,
                  ),
                  Container(width: 400, child: Text("Banque Misr")),
                  Container(width: 400, child: Text("48501200000000011")),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 4000,
              padding: EdgeInsets.only(left: 10),
              child: const Text('Enter the bank transfer receipt ',
                  style: TextStyle(fontSize: 18)),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  _showPicker(context);
                },
                child: const Text('Choose Pic')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(255, 255, 255, 0.9)),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10)),
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(27))))),
                onPressed: () async {
                  Navigator.of(context).pop();



                },
                child: Text(
                  "Confirm",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ))
          ],
        ),
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
