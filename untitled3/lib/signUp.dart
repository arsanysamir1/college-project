import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled3/home.dart';
import 'package:untitled3/service/database.dart';

import 'moduls.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override

  late TextEditingController _firstName = TextEditingController();
  late TextEditingController _lastName = TextEditingController();
  late TextEditingController _username = TextEditingController();
  late TextEditingController _phoneNum = TextEditingController();
  late TextEditingController _emailAddress = TextEditingController();
  late TextEditingController _password = TextEditingController();
  late TextEditingController _confPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: EdgeInsets.only(top: 20),
        decoration: (BoxDecoration(
            color: Colors.white70)),
        child: Column( children: [
          Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ))),
          Container(
            height: 600,
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

                    Text("Sign Up",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Row(
                      children: [
                        Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 20),
                          child: TextFormField(
                            controller: _firstName,
                            decoration: InputDecoration(hintText: "First name"),

                          ),
                        ),
                        Container(
                          width: 150,
                          child: TextFormField(
                            controller: _lastName,
                            decoration:
                            InputDecoration(hintText: "Second name"),

                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _username,
                      decoration: InputDecoration(hintText: "Username"),

                    ),
                    TextFormField(
                      controller: _emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                      style: TextStyle(),
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                      onTap: () {},
                    ),
                    TextFormField(
                      controller: _password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }else if(value.length<8){
                          return 'password must be more than 8';
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(hintText: "Password"),
                      onTap: () {},
                      obscureText: true,
                    ),
                    TextFormField(
                      controller: _confPassword,
                      validator: (value) {
                        if (value!=_password.text) {
                          return 'not the same password';
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(hintText: "Conferm password"),
                      onTap: () {},
                      obscureText: true,
                    ),
                    TextFormField(
                      controller: _phoneNum,
                      decoration: InputDecoration(hintText: "Phone Number"),

                    ),
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
                            if (_formKey.currentState!.validate()) {

                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: _emailAddress.text,
                                  password: _password.text,
                                );

                                final user = credential.user;
                                if (user != null) {
                                 databaseService(uid: user.uid).addNewUser(_firstName.text,_lastName.text,_username.text,_emailAddress.text,_phoneNum.text,
                                     null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0 );
                                 databaseService(uid: user.uid).addUserComment('0', 'start');
                                  Navigator.of(context).popAndPushNamed("/");
                                }
                              } on FirebaseAuthException catch (e) {} catch (e) {
                                print(e);
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ],
                )),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("You already have an account?",
                  style: TextStyle(fontSize: 15)),
              TextButton(style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
                  onPressed: () {Navigator.of(context).popAndPushNamed("/signin");},
                  child: Text("Sign In", style: TextStyle(fontSize: 16,color: Colors.blueAccent),))
            ],),

        ]),
      ),
    );
  }
}


/*class _signUpState extends State<signUp> {
  @override
  MyUser user = MyUser();
  late TextEditingController _firstName = TextEditingController();
  late TextEditingController _lastName = TextEditingController();
  late TextEditingController _username = TextEditingController();
  late TextEditingController _phoneNum = TextEditingController();
  late TextEditingController _emailAddress = TextEditingController();
  late TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:Theme(
          data: ThemeData(primaryColor: Colors.white,textTheme: Typography.whiteCupertino,hintColor: Colors.white,highlightColor: Colors.white,hoverColor: Colors.white,inputDecorationTheme: InputDecorationTheme(hintStyle: TextStyle(color: Colors.white),errorStyle: TextStyle(fontSize: 16)),splashColor: Colors.white),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: (BoxDecoration(
                image: DecorationImage(
                    image:
                    AssetImage('assets/b2f997cfbdd8ac6cdb18726bd1a54ee1.jpg'),
                    fit: BoxFit.cover))),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                height: 500,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 80),
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
                        Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                ))),
                        Text("Sign Up",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold,color: Colors.white)),
                        Row(
                          children: [
                            Container(
                              width: 150,
                              margin: EdgeInsets.only(right: 20),
                              child: TextFormField(
                                controller: _firstName,
                                decoration: InputDecoration(hintText: "First name"),
                                onSaved: (value) {
                                  user.getUsername(value);
                                },
                              ),
                            ),
                            Container(
                              width: 150,
                              child: TextFormField(
                                controller: _lastName,
                                decoration:
                                InputDecoration(hintText: "Second name"),
                                onSaved: (value) {
                                  user.getUsername(value);
                                },
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _username,
                          decoration: InputDecoration(hintText: "Username"),
                          onSaved: (value) {
                            user.getUsername(value);
                          },
                        ),
                        TextFormField(
                          controller: _emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'E-mail';
                            }
                            return null;
                          },
                          style: TextStyle(),
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                          onTap: () {},
                        ),
                        TextFormField(
                          controller: _password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: "Password"),
                          onTap: () {},
                          obscureText: true,
                        ),
                        TextFormField(
                          controller: _phoneNum,
                          decoration: InputDecoration(hintText: "Phone Number"),
                          onSaved: (newValue) => user.getPhoneNum(newValue),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 20),
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
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    final credential = await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                      email: _emailAddress.text,
                                      password: _password.text,
                                    );
                                    if (credential.user != null) {
                                      Navigator.of(context).popAndPushNamed("/");
                                    }
                                  } on FirebaseAuthException catch (e) {
                                  } catch (e) {
                                    print(e);
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ],
                    )),
              ),
            ]),
          ),
        ));
  }
}*/