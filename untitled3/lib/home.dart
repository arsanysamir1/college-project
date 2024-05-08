import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled3/homepagecon.dart';
import 'package:untitled3/specialTravels.dart';
import 'package:untitled3/suggition.dart';
import 'package:flutter/material.dart';

late int pageNum = 1;
final cridential = FirebaseAuth.instance;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Booking.com",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        actions: <Widget>[
          mass(),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_alert_outlined))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.search,
                      size: 28,
                      color: Colors.blue,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ]),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).popAndPushNamed("/saved");
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.save_alt_sharp,
                      size: 28,
                    ),
                    Text("Saved"),
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).popAndPushNamed("/trips");
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.card_travel,
                      size: 28,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 0), child: Text("Trips")),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(top: 0),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).popAndPushNamed("/settings");
                    });
                  },
                  child: signin()),
            )
          ],
        ),
      )),
      body: Container(
          child: ListView(
        children: [homepage(), suggest(), special()],
      )),
    );
  }

  Widget signin() {
    if (cridential.currentUser == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 29,
          ),
          Text("Sign in"),
        ],
      );
    } else {
      return Column(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage("assets/1.jpg"),
          ),
          Text("Profile"),
        ],
      );
    }
  }

  StatelessWidget mass() {
    if (cridential.currentUser != null) {
      return IconButton(
          onPressed: () {
            setState(() async {
              await childWidget(50, 60);
            });
          },
          icon: Icon(Icons.add));
    } else {
      return Container();
    }
  }

  Widget childWidget(double mWidth, mHeight) {
    return Container(
        color: Colors.blue,
        width: mWidth,
        height: mHeight * 0.75,
        child: Container(
          child: Text("hello warld"),
        ));
  }
}


Widget Wrapper() {
  if (pageNum == 1) {
    return homepage();
  } else if (pageNum == 2) {
    return Column(
      children: [Text("Page Number 2")],
    );
  } else {
    return Text("Error Page number is not from 1 to 4");
  }
}
