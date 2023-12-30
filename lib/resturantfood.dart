import 'package:food_flutter/connect_api.dart';
import 'package:food_flutter/link.dart';
import 'package:http/http.dart' as http; //مشان اتعامل مع http
import 'dart:convert'; //مشان تحويل من جيسون لدارت
import 'package:flutter/material.dart';
import 'package:food_flutter/Detils.dart';
import 'package:food_flutter/food.dart';
import 'package:food_flutter/items.dart';
import 'love.dart';

class Test extends StatefulWidget {
  const Test();

  @override
  _TestState createState() => _TestState();
}

/*
Container(
      
              decoration: BoxDecoration(
               
                image: DecorationImage(
                    image: AssetImage('images/logo.png'),fit: BoxFit.cover),
              ),),*/
class _TestState extends State<Test> {
  Future getdata() async {
    var response = await http.get(Uri.parse(linkgetdata));
    var responsbody = jsonDecode(response.body);
    return responsbody;
  }

  @override
  void initState() {
    getdata();
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
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "Resturant Food",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Container( margin: EdgeInsets.only(right: 10, left: 10),
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
            padding: EdgeInsets.only(top: 20),
            child: Container(
              height: MediaQuery.of(context).size.height - 280,
              decoration: BoxDecoration(   boxShadow: [BoxShadow(color: Colors.black,blurRadius: 20)],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
 bottomRight: Radius.circular(190),
                    // topRight: Radius.circular(100)
                  )),
              child: FutureBuilder(
                  future: getdata(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) => resturnt(
                                name_Categories: snapshot.data[index]
                                    ['name_Categories'],
                                cat_id: snapshot.data[index]['id_Categories'],
                                image: snapshot.data[index]['image'],
                              ));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}

class resturnt extends StatefulWidget {
  resturnt({this.cat_id, this.name_Categories, this.image});
  final cat_id;
  final name_Categories;
  final image;
  @override
  State<resturnt> createState() => _resturntState();
}

class _resturntState extends State<resturnt> {
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, right: 6, bottom: 10),
      child: Container(
        margin: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Home(
                      cat_id: widget.cat_id,
                      tt: widget.image,
                    )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //children: [
Hero
(tag: widget.image,
  child:   ClipRRect(
  
                borderRadius: BorderRadius.circular(20),
  
                child: Image(
                  
  
                  image:AssetImage(widget.image),
  
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name_Categories,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              )
              // ],

              ,
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }
}
