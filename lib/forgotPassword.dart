import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back)),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 12),
          height: 240,
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "Please enter your email that you regestered with so we can send you a password reset link",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "enter your Email"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: _controller.text.trim());
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              "password reset link sent! please ckick your Email",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        },
                      );
                    } on FirebaseAuthException catch (e) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text("Error:"),
                              content: Text(e.message.toString(),
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center));
                        },
                      );
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blueAccent),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(55)))),
                  child: Text(
                    "Send Email",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ))
            ],
          )),
    );
  }
}
