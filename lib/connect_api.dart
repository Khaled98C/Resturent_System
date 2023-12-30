import 'package:http/http.dart' as http; //مشان اتعامل مع http
import 'dart:convert'; //مشان تحويل من جيسون لدارت

class Crud {
  getdata(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
     var responsbody = jsonDecode(response.body);
      return responsbody;
      
    } 
    catch (e) {}
  }
  //data هي القيم الي بدي دخلها 
  postdata(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url),body: data);
      var responsbody = jsonDecode(response.body);
      return responsbody;
    } catch (e) {}
  }
}
