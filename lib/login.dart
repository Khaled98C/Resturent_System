import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_flutter/Textformfied.dart';
import 'package:food_flutter/colors.dart';
import 'package:food_flutter/connect_api.dart';
import 'package:food_flutter/link.dart';
import 'package:food_flutter/valid.dart';
import 'package:http/http.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Crud crud = new Crud();
    GlobalKey<FormState> formstate = GlobalKey();
    TextEditingController name_user = TextEditingController();

    TextEditingController password_user = TextEditingController();
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    alert2() {
      AwesomeDialog(
        autoHide: Duration(seconds: 4),
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ' تم تسجيل الدخول بنجاح',
            style: TextStyle(fontSize: 20),
          ),
        ),
      )..show();
    }

    ;

    login() async {
      if (formstate.currentState!.validate()) {
        var response = await crud.postdata(linklogin, {
          "name_user": name_user.text,
          "password_user": password_user.text,
        });
        if (response['status'] == "success") {
          alert2();
          await Future.delayed(Duration(seconds: 3));
          Navigator.of(context)
              .pushNamedAndRemoveUntil("", (route) => false);
        } else {
          AwesomeDialog(
            autoHide: Duration(seconds: 4),
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'الحساب المستخدم او كلمة المرور غير صحيحة تأكد من البيانات الله يرضى عليك ',
                style: TextStyle(fontSize: 20, fontFamily: "Amiri"),
              ),
            ),
          )..show();
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/Onbording/3.PNG'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  Textformfid(
                      a: TextStyle(fontFamily: "Amiri"),
                      pass: false,
                      valid: (val) {
                        return validInput(val!, 3, 20);
                      },
                      type: TextInputType.name,
                      mycontroller: name_user,
                      hint: "username",
                      icon2: Icon(Icons.person),
                      name: "User"),
                  Textformfid(
                    a: TextStyle(fontFamily: "Amiri"),
                    valid: (val) {
                      return validInput(val!, 3, 20);
                    },
                    mycontroller: password_user,
                    hint: "password",
                    pass: true,
                    icon2: Icon(Icons.lock_outlined,),
                    name: "pass",
                    type: TextInputType.visiblePassword,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      await login();
                    },
                    child: Container(
                      height: 70,
                      width: 250,
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          color: colors().c),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.account_circle_sharp,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                          VerticalDivider(color: Colors.white, thickness: 1),
                          Expanded(
                              flex: 2,
                              child: Text(
                                "Login",
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
                      Navigator.of(context).pushNamed("singup");
                    },
                    child: Container(
                        child: Text(
                      "اذا ليس لديك حساب",
                      style: TextStyle(
                          fontFamily: "Amiri",
                          color: Colors.blue[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
