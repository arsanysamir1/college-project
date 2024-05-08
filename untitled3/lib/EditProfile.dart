
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  late TextEditingController _username = TextEditingController();

  late TextEditingController _emailAddress = TextEditingController();
  var thisUser = FirebaseAuth.instance.currentUser?.uid;
  Stream<QuerySnapshot> Sstream =
      FirebaseFirestore.instance.collection('MyUser').snapshots();
  final _formKey = GlobalKey<FormState>();

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
                    var User;
                    querySnapshot.docs.forEach((element) {
                      element.id == thisUser ? User = element : null;
                    });
                    return Column(children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.black,
                              ))),
                      Form(
                            key: _formKey,
                            child:Container(
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
                                child:  Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Edit user profile",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(onTap: (){},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(400),
                                    child: Image(
                                      image: AssetImage("assets/1.jpg"),
                                      fit: BoxFit.fill,
                                      height: 90,
                                      width: 90,
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Change Profile Image',
                                      style: TextStyle(fontSize: 18),
                                    )),
                                SizedBox(height: 60),
                                Text(
                                    "Change your First and Last name and your User Name",
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
                                        controller: _username,
                                        decoration: InputDecoration(
                                            hintText: "${User['firstName']}"),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: TextFormField(
                                        controller: _username,
                                        decoration: InputDecoration(
                                            hintText: "${User['lastName']}"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: _username,
                                  decoration: InputDecoration(
                                      hintText: "${User['userName']}"),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Text(
                                        "Change your Phone Number",
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
                                    hintText: "${User['phoneNum']}",
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
                                    onPressed: () {},
                                    child: Text('Change Password',style: TextStyle(fontSize: 16),)),
                              ],
                            )),
                      ),
                    ]);
                  }
                  return CircularProgressIndicator();
                })));
  }
}
