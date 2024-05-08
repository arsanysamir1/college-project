import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled3/signUp.dart';

final cridential = FirebaseAuth.instance;

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, elevation: 0),
      bottomNavigationBar: BottomAppBar(child: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).popAndPushNamed("/home");
                  });
                },
                child:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                      Icons.search,
                      size: 28,
                    ),
                Text("Search",),
              ],)
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).popAndPushNamed("/saved");
                  });
                },
                child:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                      Icons.save_alt_sharp,
                      size: 28,
                    ),
                Text("Saved"),
              ],)
            ), InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).popAndPushNamed("/trips");
                  });
                },

                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                      Icons.card_travel,
                      size: 28,
                    )
                ,
                Container(margin:EdgeInsets.only(top: 0),child: Text("Trips")),
              ],)
            ),
            Container(padding: EdgeInsets.only(top: 0),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).popAndPushNamed("/settings");
                    });
                  }, child: signin()),
            )

          ],
        ),
      )),
      body: Container(
        child: ListView(children: [
          Container(
              height: 200,
              width: 4000,
              color: Colors.blue,
              child: custAppbar()),
          diffBtn(),
          settingsBtn(Icons.thumb_up_alt_outlined, "Reviews"),
          settingsBtn(
              CupertinoIcons.question_circle, "Contact Customer Service"),

          settingsBtn(Icons.percent, "Deals"),
          settingsBtn(CupertinoIcons.airplane, "Airport taxis"),
          InkWell(onTap: (){setState(() {
            FirebaseAuth.instance.signOut();
          });
            },child: signUpBtn())
        ]),
      ),
    );
  }

  Widget title(String text) {
    return Container(
        width: 400,
        padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        )
    );
  }


  Widget settingsBtn(IconData icon, String text) {
    return  Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(padding: EdgeInsets.only(right: 5), child: Icon(icon)),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          )
    );
  }

  Widget custAppbar() {
    if (cridential.currentUser == null) {
      return Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(26, 23, 23, 1), width: 0),
              borderRadius: BorderRadius.circular(50),
              color: Color.fromRGBO(50, 50, 50, 0.9),
            ),
            child: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
              size: 50,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 18, bottom: 10),
            child: Text(
              "Sign to see more deals, manage your\n trips and more",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).popAndPushNamed("/signin");
                });
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromRGBO(60, 20, 255, 1)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 25, vertical: 15))),
              child: Text("Sign in"))
        ],
      );
    } else {
      return Column(children: [
        Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.yellowAccent,
                ),
                borderRadius: BorderRadius.circular(100)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(400),
              child: Image(
                image: AssetImage("assets/1.jpg"),
                fit: BoxFit.fill,
                height: 40,
                width: 10,
              ),
            )),
        Text(
          "Arsany Samir",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        )
      ]);
    }
  }

  Widget signUpBtn() {
    if (cridential.currentUser != null) {
      return InkWell(onTap: () {
        setState(() {
          FirebaseAuth.instance.signOut();
          Navigator.of(context).popAndPushNamed("/home");
        });
      },child: settingsBtn(Icons.arrow_circle_left_outlined, "Sign out"));
    } else {
      return Container();
    }
  }

  Widget signin() {
    if (cridential.currentUser == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.account_circle_outlined,
            color: Colors.blue,
            size: 30,
          ),
          Text(
            "Sign in",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          CircleAvatar(radius: 18,
            backgroundImage: AssetImage("assets/1.jpg"),
          ),
          Text("Profile"),
        ],
      );
    }
  }
  Widget diffBtn(){
    if (cridential.currentUser == null) {
      return  InkWell(onTap: () {
        setState(() {
          Navigator.of(context).popAndPushNamed("/signin");
        });
      },
        child: settingsBtn(
            Icons.arrow_circle_right_outlined, "Sign in or create account"),
      );
    }else{
      return InkWell(onTap: () {Navigator.of(context).pushNamed("/editProfile");},
        child: settingsBtn(
            Icons.person, "Manage your account"),
      );
    }
  }

  Widget mass() {
    if (cridential.currentUser != null) {
      return IconButton(onPressed: () {}, icon: Icon(Icons.messenger_outline));
    } else {
      return Container();
    }
  }
}
