import 'package:flutter/material.dart';
import 'package:food_flutter/connect_api.dart';
import 'package:http/http.dart' as http; //مشان اتعامل مع http
import 'dart:convert'; //مشان تحويل من جيسون لدارت

class Testeing extends StatefulWidget {
  const Testeing({Key? key}) : super(key: key);

  @override
  _TesteingState createState() => _TesteingState();
}

class _TesteingState extends State<Testeing> {
  Crud c = new Crud();

  Future getdata() async {
    var url = "http://192.168.45.209/foodproject/getmenu.php";
    var response = await http.get(Uri.parse(url));
    var responsbody = jsonDecode(response.body);
    return responsbody;
  }

 

  @override
  Widget build(BuildContext context) {
    String f;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tttest'),
      ),
      body: FutureBuilder(
        future: getdata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: ((context, i) => ListTile(
                    title: Text(snapshot.data[i]["name_Categories"]),
                  )));
        },
      ),
    );
  }
}
