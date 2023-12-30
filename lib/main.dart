import 'package:flutter/material.dart';
import 'package:food_flutter/food.dart';
import 'package:food_flutter/ansert.dart';
import 'package:food_flutter/bottom_bar.dart';
import 'package:food_flutter/login.dart';
import 'package:food_flutter/singup.dart';
import 'package:food_flutter/resturantfood.dart';
import 'package:food_flutter/splash.dart';
import 'package:food_flutter/testeing.dart';
import 'package:get/get.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Resturant',
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: colors().cc),
          textTheme: GoogleFonts.comboTextTheme(),
          fontFamily: "Amiri",
          primaryColor: Color(0xff55acee),
          scaffoldBackgroundColor: colors().c,
          primaryIconTheme: IconThemeData(
            color: colors().cc,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(colors().c)))
                  
                  
                  ),
      home: logo(),
      routes: {
        'Home': (context) => Home(),
        'TEST': (context) => Test(),
        'singup': (context) => Singup(),
        'login': (context) => login(),
        'botm': (context) => BottomBar(),
      },
    );
  }
}
