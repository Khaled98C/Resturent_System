import 'package:flutter/material.dart';
import 'package:food_flutter/colors.dart';
import 'package:food_flutter/connect_api.dart';
import 'package:food_flutter/link.dart';
import 'package:food_flutter/login.dart';
import 'package:food_flutter/resturantfood.dart';
import 'package:food_flutter/valid.dart';
import 'package:http/http.dart';
import 'package:food_flutter/Textformfied.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Singup extends StatefulWidget {
  Singup({Key? key}) : super(key: key);

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  Crud crud = new Crud();
  bool isloading = false;
  TextEditingController name_user = TextEditingController();
  TextEditingController email_user = TextEditingController();
  TextEditingController password_user = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  singUp() async {
    if (formstate.currentState!.validate()) {
      isloading = true;
      setState(() {});
      var response = await crud.postdata(linksingup, {
        " name_user": name_user.text,
        "email_user": email_user.text,
        "password_user": password_user.text,
      });
      if (response['status'] == "success") {
        // يتم بعد التحقق من اظهار اشعار انه تم التسجيل
        alert();
        await Future.delayed(Duration(seconds: 3));
        Navigator.of(context).pushNamedAndRemoveUntil('botm', (route) => false);
      } else {
        print("singupfail");
      }
      isloading = false;
      setState(() {});
    }
  }

  alert() {
    AwesomeDialog(
      autoHide: Duration(seconds: 4),
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          ' تم انشاء الحساب بنجاح',
          style: TextStyle(fontSize: 20),
        ),
      ),
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
        appBar: AppBar(
          title: Text("singup"),
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("botm", (route) => false);
                    },
                    icon: Icon(Icons.arrow_back_ios_outlined))
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: isloading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formstate,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height - 600,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/singup.png'),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Textformfid(
                              a: TextStyle(fontFamily: "Amiri"),
                              valid: (val) {
                                return validInput(val!, 4, 20);
                              },
                              type: TextInputType.name,
                              hint: "username",
                              icon2: Icon(Icons.person),
                              name: "User",
                              pass: false,
                              mycontroller: name_user),
                          Textformfid(
                            a: TextStyle(fontFamily: "Amiri"),
                            valid: (val) {
                              return validInput(val!, 6, 40);
                            },
                            type: TextInputType.visiblePassword,
                            mycontroller: password_user,
                            hint: "password",
                            icon2: Icon(Icons.lock_outlined,),
                            name: "pass",
                            pass: true,
                          ),
                          Textformfid(
                              a: TextStyle(fontFamily: "Amiri"),
                              valid: (val) {
                                return validemail(val!, 12, 40);
                              },
                              type: TextInputType.emailAddress,
                              pass: false,
                              mycontroller: email_user,
                              hint: "email",
                              icon2: Icon(Icons.email),
                              name: 'email'),
                          MaterialButton(
                            onPressed: () async {
                              await singUp();
                            },
                            child: Container(
                              height: 70,
                              width: 250,
                              margin: EdgeInsets.only(bottom: 10, top: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60)),
                                  color: colors().c),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.account_circle_sharp,
                                      size: 45,
                                      color: Colors.white,
                                    ),
                                  ),
                                  VerticalDivider(
                                      color: Colors.white, thickness: 1),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Singup",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("login");
                            },
                            child: Container(
                                child: Text("لديك حساب",
                                    style: TextStyle(
                                        fontFamily: "Amiri",
                                        color: Colors.blue[200],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18))),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}
