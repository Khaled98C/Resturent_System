import 'package:flutter/material.dart';

class Textformfid extends StatelessWidget {
  final String? hint;
  final Icon? icon2;
  final String? name;
  final TextInputType? type;
  final TextEditingController mycontroller;
  final bool pass;
  final TextStyle a;
  final String? Function(String?) valid;
  const Textformfid(
      {Key? key,
      this.hint,
      this.icon2,
      this.name,
      required this.mycontroller,
      this.type,
      required this.pass,
      required this.valid,
      required this.a})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextFormField(
        validator: valid,
        obscureText: pass,
        keyboardType: type,
        controller: mycontroller,
        decoration: InputDecoration(
            hintText: hint,
            labelText: name,
            prefixIcon: icon2,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                borderSide: BorderSide(width: 2, color: Colors.black))),
      ),
    );
  }
}
