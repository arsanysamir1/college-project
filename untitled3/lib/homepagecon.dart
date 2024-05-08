import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/structures/circular_icon_text_button.dart';
import 'package:untitled3/structures/rec_icon_text_button.dart';
import 'package:intl/intl.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime today = DateTime.now();
  String dat = "enter the date";
  bool isSwitched = false;
  var view = 1;
  var room = "1";
  var adult = "1";
  var child = "0";
  var day1 = "sat";
  var mon1 = "jan";
  var dm1 = 1;
  var day2 = "wed";
  var mon2 = "jun";
  var dm2 = 23;

  List<String> mainlist = [
    "Stays",
    "Attractions",
  ];
  List<IconData> myicons = [
    Icons.bed,
    Icons.attractions,
  ];

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          color: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: interest(),
        ),
        switchMain()
      ],
    );
  }

  Widget switchMain() {
    if (view == 1)
      return stays();
    else if (view == 2)
      return activites();
    else {
      return Container();
    }
  }

  Widget interest() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          circular_icon_text_button(myicons[0], mainlist[0], Colors.white, 1),
          circular_icon_text_button(myicons[1], mainlist[1], Colors.white, 2)
        ],
      ),
    );
  }

  Widget stays() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 40),
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() async {
                await Navigator.of(context).pushNamed("/hotelsearch");
              });
            },
            child: rec_icon_text_button(
                Icons.search, "Around current location", Colors.black, 400),
          ),
          InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    dat = formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
              child: rec_icon_text_button(
                  Icons.calendar_today, dat, Colors.black, 400)),
          Container(
            color: Colors.grey,
            child: Column(children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/guestdetails",
                      arguments: {room, adult, child});
                },
                child: Container(
                    height: 60,
                    width: 400,
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.person, color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                              "$room rooms . $adult adults . $child childrens ",
                              style: TextStyle(color: Colors.black)),
                        )
                      ],
                    )),
              )
            ]),
          ),
          Container(
            color: Colors.grey,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(0))),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("Search",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget activites() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: rec_icon_text_button(
                Icons.search, "Whare are you going?", Colors.black, 400),
          ),
          InkWell(
            onTap: () {},
            child: rec_icon_text_button(
              Icons.calendar_today,
              "Any Dates",
              Colors.black,
              400,
            ),
          ),
          Container(
            color: Colors.grey,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(0))),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("Search",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget circular_icon_text_button(IconData icon, String text, Color color,
      [int a = 1]) {
    return ElevatedButton(
      onPressed: () {setState(() {
        view=a;
      });},
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 0, 0, 100))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }
}
