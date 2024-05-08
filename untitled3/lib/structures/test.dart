import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return (Scaffold(
      body: Container(
        child: ElevatedButton(
            onPressed: () {
             setState(() {
               childWidget(mWidth, mHeight);
             });
            },
            child: Text("hellow")),
      ),
    ));
  }
}

Widget childWidget(double mWidth, mHeight) {
  return Container(
      color: Colors.blue,
      width: mWidth,
      height: mHeight * 0.75,
      child: Container(child: Text("hello warld"),));
}
