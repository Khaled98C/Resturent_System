// ignore_for_file: avoid_unnecessary_containers
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:food_flutter/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Detailspage extends StatefulWidget {
  final name;
  final price;
  final desc;

  final image;
  const Detailspage({this.name, this.price, this.desc, this.image}) : super();
  @override
  _DetailspageState createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/det.png'),
              ),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(120),
                  topRight: Radius.circular(120))),
          child: ListView(
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
              Padding(
                child: Hero(tag: widget.image,
                  child: CircleAvatar(
                    
                   maxRadius: 100,
                    backgroundImage: AssetImage(widget.image),
                    
                    
                    
                  ),
                ),
                padding: const EdgeInsets.only(top: 10),
              ),
              SizedBox(
                height: 10,
              ),
              Hero(
                  tag: widget.name,
                  child: Container(
                    child: Text(
                      widget.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Amiri"),
                    ),
                  )),
              Hero(
                  tag: widget.price,
                  child: Container(
                    child: Text(
                      widget.price,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Amiri"),
                    ),
                  )),
              Hero(
                  tag: widget.desc,
                  child: Container(
                    height: 150,
                    width: 100,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                     
                                      Color.fromARGB(255, 9, 106, 180),
                                     Color(0xff55acee),
                                       
                                    Color.fromARGB(255, 71, 163, 234),
                                    Color.fromARGB(255, 43, 146, 224),
                                    Color.fromARGB(255, 21, 125, 204),
                                    Color.fromARGB(255, 9, 106, 180),
        
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight
                                ),
                              ),
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                widget.desc,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Amiri"),
                              )),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 70,
                              child: MaterialButton(
                                onPressed: () {
                                  var price = widget.price;
                                  AwesomeDialog(
                                    autoHide: Duration(seconds: 4),
                                    context: context,
                                    dialogType: DialogType.success,
                                    animType: AnimType.rightSlide,
                                    body: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '$price',
                                        style: TextStyle(
                                            fontFamily: "Amiri", fontSize: 20),
                                      ),
                                    ),
                                  )..show();
                                },
                                child: Container(
                                  height: 70,
                                  width: 150,
                                  margin: EdgeInsets.only(bottom: 10, top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: colors().c),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Icon(Icons.account_circle_sharp,
                                            size: 45),
                                      ),
                                      VerticalDivider(
                                          color: Colors.white, thickness: 3),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Add To Cart",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
