import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Provider/User.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime today = DateTime.now();
  String start = "enter the start date";
  String end = "enter the end date";
  DateTime? pickedDate;
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
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: interest(),
        ),

      ],
    );
  }


  Widget interest() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage:
                    AssetImage("assets/jj2Gcobpopokal0YstuCQW0ldJ4.jpg"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: Text(
                      'Hi ' + "${MyUser1.userName}" + '!',
                      style: TextStyle(
                          fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),
                    ),
                  ),

                ],
              ),
            ],
          ),
          Text('Where do\nyou want to go?', style: TextStyle(fontSize: 30)),
          Container(margin: EdgeInsets.symmetric(vertical: 15),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed("/hotelsearch");
                });
              },
              child: Card(
                elevation: 4,
                child: Column(children: [
              Container( width: 400,
                  height: 50,
                  color: Colors.white,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon( Icons.search, color:Colors.black ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(MyUser1.location.toString() == '[]'
                                ? 'Choose location'
                                : MyUser1.location[0], style: TextStyle(color: Colors.black)),
                          )
                        ],
                      ),

                    ],
                  ))
                ]),

              ),
            ),
          ),


        ],
      ),
    );
  }


  Widget circular_icon_text_button(IconData icon, String text, Color color,
      [int a = 1]) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          view = a;
        });
      },
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
          backgroundColor: MaterialStatePropertyAll(Color(0xffFF6421))),
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

// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// circular_icon_text_button(
// myicons[0], mainlist[0], Colors.white, 1),
// circular_icon_text_button(
// myicons[1], mainlist[1], Colors.white, 2)
// ],
// )


// Widget stays(userprovider) {
//   return Container(
//     margin: EdgeInsets.only(left: 20, right: 20, top: 40),
//     color: Colors.grey,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//
//         Row(
//           children: [
//             InkWell(
//                 onTap: () async {
//                   pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2000),
//                       //DateTime.now() - not to allow to choose before today.
//                       lastDate: DateTime(2101));
//                   if (pickedDate != null) {
//                     print(
//                         pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                     String formattedDate =
//                     DateFormat('yyyy-MM-dd').format(pickedDate!);
//                     print(
//                         formattedDate); //formatted date output using intl package =>  2021-03-16
//                     //you can implement different kind of Date Format here according to your requirement
//
//                     setState(() {
//                       start =
//                           formattedDate; //set output date to TextField value.
//                     });
//                   } else {
//                     print("Date is not selected");
//                   }
//                 },
//                 child: rec_icon_text_button(
//                     Icons.calendar_today, start, Colors.black, 176.5)),
//             InkWell(
//                 onTap: () async {
//                   if (start == 'enter the start date') {
//                   } else {
//                     pickedDate = await showDatePicker(
//                         context: context,
//                         currentDate: pickedDate,
//                         initialDate: pickedDate,
//                         firstDate: DateTime(2000),
//                         //DateTime.now() - not to allow to choose before today.
//                         lastDate: DateTime(2101));
//
//                     if (pickedDate != null) {
//                       print(
//                           pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                       String formattedDate =
//                       DateFormat('yyyy-MM-dd').format(pickedDate!);
//                       print(
//                           formattedDate); //formatted date output using intl package =>  2021-03-16
//                       //you can implement different kind of Date Format here according to your requirement
//
//                       setState(() {
//                         end =
//                             formattedDate; //set output date to TextField value.
//                       });
//                     } else {
//                       print("Date is not selected");
//                     }
//                   }
//                 },
//                 child: rec_icon_text_button(
//                     Icons.calendar_today, end, Colors.black, 176)),
//           ],
//         ),
//         Container(
//           color: Colors.grey,
//           child: Column(children: [
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).pushNamed('/guestdetails');
//               },
//               child: Container(
//                   height: 60,
//                   width: 400,
//                   color: Color.fromRGBO(255, 255, 255, 0.8),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Icon(Icons.person, color: Colors.black),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 12),
//                         child: Text(
//                             "${userprovider.rooms} rooms . ${userprovider.adult} adults . ${userprovider.child} childrens ",
//                             style: TextStyle(color: Colors.black)),
//                       )
//                     ],
//                   )),
//             )
//           ]),
//         ),
//         Container(
//           color: Colors.grey,
//           child: Column(
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pushNamed('/search');
//                   },
//                   style: ButtonStyle(
//                     backgroundColor:
//                     MaterialStatePropertyAll(Color(0xffFF6421)),
//                     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                         side: BorderSide(width: 0),
//                         borderRadius: BorderRadius.circular(0))),
//                     padding: MaterialStatePropertyAll(
//                         EdgeInsets.symmetric(vertical: 20)),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         child: Text("Search",
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),
//                             textAlign: TextAlign.center),
//                       )
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget activites() {
//   return Container(
//     margin: EdgeInsets.only(left: 20, right: 20, top: 10),
//     color: Colors.grey,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         InkWell(
//           onTap: () {},
//           child: rec_icon_text_button(
//               Icons.search, "Whare are you going?", Colors.black, 400),
//         ),
//         InkWell(
//           onTap: () {},
//           child: rec_icon_text_button(
//             Icons.calendar_today,
//             "Any Dates",
//             Colors.black,
//             400,
//           ),
//         ),
//         Container(
//           color: Colors.grey,
//           child: Column(
//             children: [
//               ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor:
//                     MaterialStatePropertyAll(Color(0xffFFA985)),
//                     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                         side: BorderSide(width: 0),
//                         borderRadius: BorderRadius.circular(0))),
//                     padding: MaterialStatePropertyAll(
//                         EdgeInsets.symmetric(vertical: 20)),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         child: Text("Search",
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),
//                             textAlign: TextAlign.center),
//                       )
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
