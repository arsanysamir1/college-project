import 'package:flutter/material.dart';

Widget rec_icon_text_button(
  IconData icon,
  String text,
  Color textColor,double W , [
  Color backgroundColor = const Color.fromRGBO(255, 255, 255, 0.8),
  double H =60,

]) {
  return Container(

    child: Column(children: [
      Container( width: W,
          height: H,
          color: backgroundColor,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(icon, color: textColor),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(text, style: TextStyle(color: textColor)),
              )
            ],
          ))
    ]),
  );
}
