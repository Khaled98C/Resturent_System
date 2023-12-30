import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/Detils.dart';
import 'package:food_flutter/colors.dart';
import 'package:food_flutter/connect_api.dart';
import 'package:food_flutter/items.dart';
import 'package:food_flutter/link.dart';
import 'love.dart';

import 'package:http/http.dart' as http; //مشان اتعامل مع http
import 'dart:convert'; //مشان تحويل من جيسون لدارت

class Home extends StatefulWidget {
  const Home({this.cat_id, this.tt});
  final cat_id;
  final tt;

  @override
  _HomeState createState() => _HomeState();
}

/*
Container(
      
              decoration: BoxDecoration(
               
                image: DecorationImage(
                    image: AssetImage('images/logo.png'),fit: BoxFit.cover),
              ),),*/
class _HomeState extends State<Home> {
  Future getdata() async {
    var dat = {"cat_id": widget.cat_id.toString()};
    var response = await http.post(Uri.parse(linkgetfood), body: dat);
    var res = jsonDecode(response.body);
    return res;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_outlined))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              " Food",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 6, 6, 6),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            height: MediaQuery.of(context).size.height - 700,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage('images/back.PNG'),
                fit: BoxFit.fill,
                height: 100,
                width: 150,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              height: MediaQuery.of(context).size.height - 325,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 20)],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomRight: Radius.circular(190),
                  )),
              child: FutureBuilder(
                  future: getdata(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 60, left: 10, right: 6, bottom: 10),
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => Detailspage(
                                                    desc: snapshot.data[index]
                                                        ['title'],
                                                    name: snapshot.data[index]
                                                        ['name_meal'],
                                                    price: snapshot.data[index]
                                                        ['price_meal'],
                                                    image: snapshot.data[index]
                                                        ['image'],
                                                  )));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //children: [
                                        Hero(
                                          tag: widget.tt,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image(
                                              image: AssetImage(snapshot
                                                  .data[index]['image']),
                                              fit: BoxFit.fill,
                                              height: 100,
                                              width: 150,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data[index]['name_meal'],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "Amiri",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data[index]['price_meal']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        )
                                        // ],

                                        ,
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.add)),

                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          )
        ],
      ),
    ));
  }
}/*

Widget _buildFoodItem(String imgpath, String foodname, String price) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Hero(
                    tag: imgpath,
                    child: Image(
                      image: AssetImage(imgpath),
                      fit: BoxFit.cover,
                      height: 75,
                      width: 75,
                    )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodname,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      foodname,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
    ),
  );
}*/
