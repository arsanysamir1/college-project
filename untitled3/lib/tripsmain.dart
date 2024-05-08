import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homepagecon.dart';

var out = 1;
final cridential = FirebaseAuth.instance;

class trips extends StatefulWidget {
  const trips({Key? key}) : super(key: key);
  @override
  State<trips> createState() => _tripsState();
}
class _tripsState extends State<trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trips",
        ),
        actions: add(),
      ),
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
                      size: 28
                    ),
                Text("Search"),
              ],)
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).popAndPushNamed("/saved");
                  });
                },
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                      Icons.save_alt_sharp,
                      size: 28,
                    ),
                Text("Saved"),
              ],)
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).popAndPushNamed("/trips");
                  });
                },
                child:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                      Icons.card_travel,
                      size: 28,color: Colors.blue,
                    )
                ,
                Container(margin:EdgeInsets.only(top: 0),child: Text("Trips",style: TextStyle(color: Colors.blue))),
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
      body: switchMainOut(),
    );
  }

  List<IconButton> add() {
    if (cridential.currentUser == null) {
      return [
        IconButton(onPressed: () {}, icon: Icon(Icons.help_outline)),
        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      ];
    }
    return [];
  }

  Widget signin() {
    if (cridential.currentUser == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 30,
          ),
          Text("Sign in"),
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

  Widget mass() {
    if (cridential.currentUser != null) {
      return IconButton(onPressed: () {}, icon: Icon(Icons.messenger_outline));
    } else {
      return Container();
    }
  }

  Widget signeIn() {
    return Container(
      width: 500,
      padding: EdgeInsets.all(20),
      child: Column(children: [
        Text(
          "Where to next?",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
              "You haven't started any trips yet. Once you make a booking, it'll appear hear",
              style: TextStyle(fontSize: 15)),
        ),
      ]),
    );
  }

  Widget circular_text_button(String text, Color color, [int a = 1]) {
    return InkWell(
      onTap: () {
        setState(() {
          out=a;
        });
      },
      child: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1, style: BorderStyle.solid, color: color),
              borderRadius: BorderRadius.circular(40)),
          child: Text(
            text,
            style: TextStyle(color: color),
          )),
    );
  }

  Widget switchMainOut() {
    if (cridential.currentUser != null) {
      if (out == 1) {
        return temp(
          "Where to next?",
          "You haven't started any trips yet. Once you make a booking, it'll appear hear",
        );
      } else if (out == 2) {
        return temp("Revisit past trips",
            "Hear you can refer to all your past trips and get inspiration to the next ones");
      } else if (out == 3) {
        return temp("Some times plans changes",
            "Hear you can refer to all trips you've canceled");
      } else
        return Container();
    } else {
      if (out == 1) {
        return notSignIn(
          "Not booking yet",
          "sign in or create an account to get started",
        );
      } else if (out == 2) {
        return notSignIn(
            "No past bookings", "sign in or create an account to get started");
      } else if (out == 3) {
        return notSignIn("No canceled bookings",
            "sign in or create an account to get started");
      } else
        return Container();
    }
  }

  Widget temp(
      String text,
      String stext) {
    return Column(
      children: [
        Container(
          width: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              circular_text_button("Active", Colors.blue, 1),
              circular_text_button("Past", Colors.blue, 2),
              circular_text_button("Canceled", Colors.blue, 3),
            ],
          ),
        ),
        Container(
          width: 500,
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Text(
              text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(stext, style: TextStyle(fontSize: 15)),
            ),
          ]),
        )
      ],
    );
  }
  Widget notSignIn(String text,String stext) {
    return Container(
      width: 500,
      padding: EdgeInsets.all(20),
      child: Column(children: [Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          circular_text_button("Active", Colors.blue, 1),
          circular_text_button("Past", Colors.blue, 2),
          circular_text_button("Canceled", Colors.blue, 3),
        ],
      ),
        Column(
          children: [
            SizedBox(height: 300),
            Text(
              text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(stext, style: TextStyle(fontSize: 15)),
            ),
            ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 25, vertical: 15))),
                child: Text("Sign in"))
          ],
        ),

      ]),
    );
  }

}
