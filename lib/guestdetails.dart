import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/Provider/hotelPageState.dart';
import 'package:untitled3/Provider/searchPage.dart';
import 'package:untitled3/home.dart';
import 'package:provider/provider.dart';
import 'Provider/User.dart';

class guestDetails extends StatefulWidget {
  const guestDetails({Key? key}) : super(key: key);

  @override
  State<guestDetails> createState() => _guestDetailsState();
}

class _guestDetailsState extends State<guestDetails> {

  @override
  Widget build(BuildContext context) {
    int rooms = int.parse(MyUser1.rooms);
    int adults = int.parse(MyUser1.adult);

    int children = MyUser1.childernAges.length;

    final String childIntialAge = "12";


    //int child=int.parse(data[2]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
        title: Text("Gusest details"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Card(
                child: Container(
                  height: 70,
                  width: 700,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          rooms.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Text(
                        "rooms",
                        style: TextStyle(fontSize: 36),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (rooms > 1) {
                                    rooms = rooms - 1;
                                    MyUser1.dicreaseRoom();
                                  }
                                });
                              },
                              icon: Icon(CupertinoIcons.minus_circle)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (rooms < 20) {
                                    rooms = rooms+ 1;
                                    MyUser1.increaseRoom();
                                  }
                                });
                              },
                              icon: Icon(CupertinoIcons.plus_circle))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 70,
                  width: 700,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          adults.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Text(
                        "Adults",
                        style: TextStyle(fontSize: 36),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (adults != 1) {
                                    adults =adults - 1;
                                    MyUser1.dicreaseAdult();
                                  }
                                });
                              },
                              icon: Icon(CupertinoIcons.minus_circle)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (adults < 30) {
                                    adults = adults + 1;
                                    MyUser1.increaseAdult();
                                  }

                                });
                              },
                              icon: Icon(CupertinoIcons.plus_circle))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 70,
                  width: 700,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Text(
                          children.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Text(
                        "Children",
                        style: TextStyle(fontSize: 36),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (children >= 1) {
                                    children = children - 1;
                                    MyUser1.dicreaseChild();
                                    MyUser1.removeChildAge();
                                  }
                                });
                              },
                              icon: Icon(CupertinoIcons.minus_circle)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (children < 20) {
                                    children = children + 1;
                                    MyUser1.increaseChild();
                                    MyUser1.addChildAge('12');
                                  }
                                });
                              },
                              icon: Icon(CupertinoIcons.plus_circle))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              if (children>0)  Column(
                children: [
                  Container(margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                    child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text("Child's age",style: TextStyle(fontSize: 24),),
                      Text(
                        "Please enter the age of each child so that we can find you the best room, bed configuration and deals.",style: TextStyle(fontSize: 16),),
                    ]),
                  ),
                  Container(
                    height: 360,
                    child: ListView.builder(
                      itemCount: MyUser1.childernAges.length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.all(8),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "children " + (index+1).toString(),
                                      style: TextStyle(fontSize: 26),
                                    ),
                                    Container(decoration: BoxDecoration(color: Colors.blueAccent,border: Border.all(width: 1,color: Colors.blue),borderRadius: BorderRadius.all(Radius.circular(5))),
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (int.parse(MyUser1.childernAges[index]) != 1) {
                                                    MyUser1.dicreaseChildAge(index);
                                                  }
                                                });
                                              },
                                              icon: Icon(CupertinoIcons.minus_circle)),
                                          Text(MyUser1.childernAges[index].toString()),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (int.parse(MyUser1.childernAges[index]) < 17) {
                                                    MyUser1.increaseChildAge(index);
                                                  }

                                                });
                                              },
                                              icon: Icon(CupertinoIcons.plus_circle))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ));
                      },
                    ),
                  )
                ],
              )
              else  Container(),

            ]),
          ],
        ),
      ),
    );
  }

}



/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/home.dart';



class guestDetails extends StatefulWidget {
  final String room1;
  final String child1;
  final String adult1;



  const guestDetails({Key? key, required this.room1, required this.child1, required this.adult1 }) : super(key: key);

  @override
   State<guestDetails> createState() => _guestDetailsState();
}

class _guestDetailsState extends State<guestDetails> {
  @override




  List arg = [1, 1, 0];
  final String childIntialAge = "12";
  List<int> childrenAges = [];

@override
  // TODO: implement widget


  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    //int child=int.parse(data[2]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(arg);
          },
          icon: Icon(Icons.close),
        ),
        title: Text("Gusest details"),
      ),
      body: Container(
        child: Column(children: [
          Card(
            child: Container(
              height: 70,
              width: 700,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      arg[0].toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Text(
                    'widget.room1',
                    style: TextStyle(fontSize: 36),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (arg[0] > 1) {
                                arg[0] = arg[0] - 1;
                              }
                            });
                          },
                          icon: Icon(CupertinoIcons.minus_circle)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (arg[0] < 20) {
                                arg[0] = arg[0] + 1;
                              }
                            });
                          },
                          icon: Icon(CupertinoIcons.plus_circle))
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 70,
              width: 700,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      arg[1].toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Text(
                    "Adults",
                    style: TextStyle(fontSize: 36),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (arg[1] != 1) {
                                arg[1] = arg[1] - 1;
                              }
                            });
                          },
                          icon: Icon(CupertinoIcons.minus_circle)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (arg[1] < 30) {
                                arg[1] = arg[1] + 1;
                              }
                              if (arg[1] > arg[0]) {
                                arg[0] = arg[1];
                              }
                            });
                          },
                          icon: Icon(CupertinoIcons.plus_circle))
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 70,
              width: 700,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      arg[2].toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Text(
                    "Children",
                    style: TextStyle(fontSize: 36),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (arg[2] >= 1) {
                                arg[2] = arg[2] - 1;
                                childrenAges.removeLast();
                              }
                            });
                          },
                          icon: Icon(CupertinoIcons.minus_circle)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (arg[2] < 20) {
                                arg[2] = arg[2] + 1;
                                childrenAges.add(12);
                              }
                            });
                          },
                          icon: Icon(CupertinoIcons.plus_circle))
                    ],
                  )
                ],
              ),
            ),
          ),
        if (arg[2]>0)  Column(
      children: [
        Container(margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Child's age",style: TextStyle(fontSize: 24),),
            Text(
              "Please enter the age of each child so that we can find you the best room, bed configuration and deals.",style: TextStyle(fontSize: 16),),
          ]),
        ),
        Container(
          height: 360,
          child: ListView.builder(
            itemCount: childrenAges.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.all(8),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Child " + (index+1).toString(),
                            style: TextStyle(fontSize: 26),
                          ),
                          Container(decoration: BoxDecoration(color: Colors.blueAccent,border: Border.all(width: 1,color: Colors.blue),borderRadius: BorderRadius.all(Radius.circular(5))),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (childrenAges[index] != 1) {
                                          childrenAges[index] = childrenAges[index] - 1;
                                        }
                                      });
                                    },
                                    icon: Icon(CupertinoIcons.minus_circle)),
                                Text(childrenAges[index].toString()),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (arg[1] < 17) {
                                          childrenAges[index]=childrenAges[index] + 1;
                                        }
                                        if (childrenAges[index] > arg[0]) {
                                          childrenAges[index] = childrenAges[index];
                                        }
                                      });
                                    },
                                    icon: Icon(CupertinoIcons.plus_circle))
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ));
            },
          ),
        )
      ],
    )
    else  Container()
        ]),
      ),
    );
  }



}
*/