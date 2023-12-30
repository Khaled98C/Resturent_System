import 'package:flutter/material.dart';
import 'dart:async';

import 'package:food_flutter/Detils.dart';
import 'package:food_flutter/colors.dart';
import 'package:food_flutter/items.dart';

class Love extends StatefulWidget {
  const Love({this.name, this.heroTagg, required this.price});
  final name;
  final price;
  final heroTagg;
  @override
  _LoveState createState() => _LoveState();
}

class _LoveState extends State<Love> {
  int i = 1;

  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('love'),
            ),
            body: Hero(
              tag: widget.heroTagg,
              child: Card(
                color: colors().c,
                child: ListTile(
                    subtitle: Text(widget.price),
                    isThreeLine: true,
                    title: Text(widget.name),
                    leading: InkWell(
                      onTap: () {
                        setState(() {
                          () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => widget.heroTagg
                            ));
                        });
                       
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(widget.heroTagg),
                      ),
                    )),
              ),
            )),
      ),
    );
  }
}
