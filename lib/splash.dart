import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_flutter/colors.dart';
import 'package:food_flutter/food.dart';
import 'package:get/get.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:food_flutter/bottom_bar.dart';
import 'package:food_flutter/list.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie/lottie.dart';

class logo extends StatefulWidget {
  const logo();

  @override
  State<logo> createState() => _logoState();
}

class _logoState extends State<logo> {
  late PageController _pageController;
  int _pageindex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("botm", (route) => false);
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Skip",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              color: colors().c,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 50),
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                    itemCount: listonbord.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _pageindex = index;
                      });
                    },
                    itemBuilder: ((context, index) => on_bording_content(
                          body: listonbord[index].body,
                          title: listonbord[index].title,
                          image: listonbord[index].image,
                        )),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                          listonbord.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: dot(
                                  isActive: index == _pageindex,
                                ),
                              )),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                          onPressed: () {
                            print(_pageindex);
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 1),
                                curve: Curves.bounceInOut);
                            if (_pageindex == listonbord.length - 1)
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "botm", (route) => false);
                          },
                          child: _pageindex == listonbord.length - 1
                              ? Icon(Icons.home)
                              : Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                    height: 20,
                  )
                ],
              ))),
    );
  }
}

class dot extends StatelessWidget {
  dot({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;
  var primaryColor = Color(0xff55acee);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isActive ? 15 : 4,
      width: 15,
      decoration: BoxDecoration(
          color: isActive ? primaryColor : primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onbordingdata {
  late String title;
  late String body;
  final String image;
  Onbordingdata({
    required this.title,
    required this.body,
    required this.image,
  });
}

final List<Onbordingdata> listonbord = [
  Onbordingdata(
      title: "You Are Welcom Dear",
      body: "مرحبا بك في تطبيقنا عزيزي ",
      image: "lot/12.json"),
  Onbordingdata(
      title: "Application goal",
      body: "هدفنا هو اضافة المتعة والحماس في تعلم اللغة الانكليزية",
      image: "lot/13.json"),
  Onbordingdata(
      title: "Application content",
      body: "هدفنا هو استخدام اساليب متعددة لاضافة المتعة والحماسة للطفل ",
      image: "lot/ABC.json"),
];

class on_bording_content extends StatelessWidget {
  const on_bording_content({
    Key? key,
    required this.title,
    required this.body,
    required this.image,
  }) : super(key: key);
  final String title;
  final String body;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 1),
        Container(
          child: Lottie.asset(image, height: 350, width: 300, repeat: false),
        ),
        Spacer(),
        Text(body,
            style: TextStyle(fontSize: 17, color: Colors.grey[600]),
            textAlign: TextAlign.center),
        Spacer(),
      ],
    );
  }
}
