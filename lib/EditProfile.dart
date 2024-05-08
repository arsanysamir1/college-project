
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


import 'Provider/User.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  late TextEditingController _username = TextEditingController();
  late TextEditingController _firstName = TextEditingController();
  late TextEditingController _lastName = TextEditingController();

  late TextEditingController _emailAddress = TextEditingController();
  var thisuser = FirebaseAuth.instance.currentUser!.uid;
  Stream<QuerySnapshot> Sstream =
  FirebaseFirestore.instance.collection('MyUser').snapshots();
  final _formKey = GlobalKey<FormState>();
  XFile? pickedFile = null;
  File? _photo;
  final ImagePicker _picker = ImagePicker();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            margin: EdgeInsets.only(top: 20),
            decoration: (BoxDecoration(color: Colors.white70)),
            child: StreamBuilder<QuerySnapshot>(
                stream: Sstream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot querySnapshot = snapshot.data!;
                    var user;

                    querySnapshot.docs.forEach((element) {
                      element.id == thisuser ? user = element : null;
                    });
                    return Column(children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.black,
                              ))),
                      Form(
                        key: _formKey,
                        child: Container(
                            height: 680,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(bottom: 0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Edit profile",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    _showPicker(context);

                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(400),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/jj2Gcobpopokal0YstuCQW0ldJ4.jpg"),
                                      fit: BoxFit.fill,
                                      height: 90,
                                      width: 90,
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      setState(() {
                                        MyUser1.setImage( pickedFile!.path);
                                      });

                                    },
                                    child: Text(
                                      'Change Profile Image',
                                      style: TextStyle(fontSize: 18),
                                    )),
                                SizedBox(height: 40),
                                Text(
                                    "Change your First and Last name and your user Name",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 150,

                                      child: TextFormField(
                                        onSaved: (newValue) =>
                                            MyUser().setFirstName(newValue!),
                                        controller: _firstName,
                                        decoration: InputDecoration(
                                            hintText: MyUser1.firstName),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: TextFormField(
                                        controller: _lastName,
                                        decoration: InputDecoration(
                                            hintText: MyUser1.lastName),
                                      ),
                                    ),
                                  ],
                                ),

                                TextFormField(
                                  onSaved: (newValue) =>
                                      MyUser1.setFirstName(newValue!),
                                  controller: _username,
                                  decoration: InputDecoration(
                                      hintText: MyUser1.userName),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Text("Change your Phone Number",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ],
                                ),
                                TextFormField(
                                  controller: _emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'name';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(),
                                  decoration: InputDecoration(
                                    hintText: MyUser1.phoneNum,
                                  ),
                                  onTap: () {},
                                ),
                                SizedBox(height: 10),
                                Row(children: [
                                  Text("Change your Password",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ]),
                                SizedBox(height: 10),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          '/forgetpass');
                                    },
                                    child: Text(
                                      'Change Password',
                                      style: TextStyle(fontSize: 16),
                                    )),
                              
                              ],
                            )),
                      ),
                    ]);
                  }
                  return CircularProgressIndicator();
                })));
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
      String imageUrl = await ref.getDownloadURL();
    } catch (e) {
      print('error occured');
    }
  }

  Future _showPicker(context, ) {
    return showModalBottomSheet(
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
