import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: ListView(children: [
        Container(
          height: 200,
          child: Card(
            elevation: 2,
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(60, 0, 0, 0)))),
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Distination"))),
                  Container(
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(
                                width: 1, color: Color.fromARGB(60, 0, 0, 0)))),
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  border: BorderDirectional(
                                      end: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(60, 0, 0, 0)))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text('dates'), Text('from-to')],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text('dates'), Text('from-to')],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(onPressed: () {}, child: Text("Filter")),
                      TextButton(onPressed: () {}, child: Text("Sort"))
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
        Container(

          height: 240*10,
          width: 400,
          child: ListView.builder(
            itemCount: 10,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Hotels(index);
            },
          ),
        )
      ]),
    ));
  }

  Widget Hotels(int index) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 230,
      width: 50,
      child: Card(
        elevation: 2,
        child: Container(
          child: Column(
            children: [
              Container(
                  height: 150,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/HD-wallpaper-movie-dune-2021.jpg'),
                          fit: BoxFit.fill))),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('name', style: TextStyle(fontSize: 22)),
                          Text(
                            'location,city',
                            style: TextStyle(fontSize: 18),
                          )
                        ]),
                    Column(
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            Text("4.5",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500)),
                            Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
