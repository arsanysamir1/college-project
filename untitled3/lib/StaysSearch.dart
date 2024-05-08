
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class hotelSearch extends StatefulWidget {
  const hotelSearch({Key? key}) : super(key: key);

  @override
  State<hotelSearch> createState() => _hotelSearchState();
}

class _hotelSearchState extends State<hotelSearch> {
  @override

  var str = ["Cairo", "El Giza", "Hurghade", "Sohag", "Asute","El minia"];
  late var showstr=str;
  TextEditingController text = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: 500,
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.blue,
                          )),
                      Container(
                        width: 252,
                        height: 60,
                        child: TextField(
                          controller: text,
                          onChanged: suggestion,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            hintText: "Enter Distinction",
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              text.clear();
                              showstr=str;
                            });
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.blue,
                          ))
                    ]),
              ),
              ListTile(
                  shape:
                      Border.all(width: 2, color: Color.fromRGBO(0, 0, 0, 0.1)),
                  leading: Icon(CupertinoIcons.location_solid, size: 30),
                  title: Text("Your current location")),
              Container(
                height: 400,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Color.fromRGBO(0, 0, 0, 0.1))),
                child: ListView.builder(
                  itemCount: showstr.length,
                  itemBuilder: (context, index) {
                    return names(index);
                  },
                ),
              )
            ])));
  }
  dynamic suggestion(String query) {
    final suggest = str.where((String) {
      final location = String.toLowerCase();
      final input = query.toLowerCase();
      return location.contains(input);
    }).toList();
    setState(() {
      showstr=suggest;
    });

  }
  Widget names(int index) {
    return Container(
        width: 40,
        height: 40,
        child: ListTile(
          title: Text(showstr[index]),
        ));
  }
}
