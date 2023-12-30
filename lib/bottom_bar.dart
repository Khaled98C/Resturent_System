import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:food_flutter/food.dart';
import 'package:food_flutter/login.dart';
import 'package:food_flutter/singup.dart';
import 'package:food_flutter/resturantfood.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({ Key? key }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> A = [
  Test(),
  
  Singup(),
  login(),
  ];
  
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        
        body: A.elementAt(currentindex),
        bottomNavigationBar: Container(height: 50,
          child: FancyBottomNavigation(
            tabs: [
              TabData(iconData: Icons.restaurant, title: "Home"),
            
                   TabData(iconData: Icons.account_circle, title: "Singin"),
              TabData(iconData: Icons.follow_the_signs, title: "Singup"),
            ],activeIconColor: Colors.green[200],
            onTabChangedListener: page,
            initialSelection:currentindex ,
            inactiveIconColor: Colors.grey,
             
          ),
        ));
  }

  page(int value) {
    setState(() {
      currentindex = value;
    });
  }
}
