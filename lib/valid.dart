import 'package:flutter/cupertino.dart';
import 'package:food_flutter/meeage.dart';

validInput(String val, int min, int max) {
  if (val.trim().length > max) {
    return "$messageInputmax $max";
  }
  if (val.trim().isEmpty) {
    return "$messageInputEmpty   ";
  }
  if (val.trim().length < min) {
    return "$messageInputmin  $min";
  }
  Pattern pattern = ("^[\s\da-zA-Zء-ي]+[^\.]*");
  RegExp regex = new RegExp("$pattern");
  if (!regex.hasMatch(val)) {
    return "يجب ان يحتوي على احرف فقط ";
  }
}

validemail(String val, int min, int max) {
  if (val.trim().length > max) {
    return "$messageInputmax $max";
  }
  if (val.trim().isEmpty) {
    return "لايمكن ان يكون البريد الالكتروني فارغ   ";
  }
  if (val.trim().length < min) {
    return "لا يمكن ان يكون البريد الالكتروني اقل من  $min";
  }

  Pattern pattern = (r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  RegExp regex = new RegExp("$pattern");
  if (!regex.hasMatch(val)) {
    return " عنوان البريد الالكتروني يجب ان يكون على سبيل المثال(gogo@gmail.com)";
  }
}
