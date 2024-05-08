import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class guestDetails extends StatefulWidget {
  const guestDetails({Key? key}) : super(key: key);

  @override
  State<guestDetails> createState() => _guestDetailsState();
}

class _guestDetailsState extends State<guestDetails> {
  @override
  List arg = [1, 1, 0];
  final String childIntialAge = "12";
  List<int> childrenAges = [];

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
            Navigator.of(context).pop();
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
                    "Rooms",
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
          showChildrenAge()
        ]),
      ),
    );
  }
  Widget showChildrenAge(){
    if (arg[2]>0) return ChildrenAge();
    else return Container();
  }
  Widget ChildrenAge() {
    return Column(
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
              return childData(index);
            },
          ),
        )
      ],
    );
  }

  Widget childData(int index) {
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
  }
}
