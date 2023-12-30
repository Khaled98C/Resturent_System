import 'package:flutter/material.dart';
import 'package:food_flutter/colors.dart';

class Ansert extends StatelessWidget {
  const Ansert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('تعديل الطلب'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors().c,
        splashColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          InkWell(
            onTap: () {},
            child: Container( margin: EdgeInsets.all(5),
               decoration: BoxDecoration(
                color: colors().c,
                  borderRadius: BorderRadius.all(Radius.circular(40)
            )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Expanded(
                      child: CircleAvatar(radius: 50,
                          backgroundColor: Color.fromARGB(255, 103, 2, 175),
                          //radius: 65,
                          backgroundImage: AssetImage("images/12.png"))),
                  Expanded( 
                      child: ListTile(
                        /*leading: CircleAvatar(radius: 80,
                          backgroundColor: Color.fromARGB(255, 103, 2, 175),
                          
                          backgroundImage: AssetImage("images/12.png")*/
                    title: Text("data"),
                    subtitle: Text("sf"),
                    trailing: Icon(Icons.edit,color: Colors.white,
                    ),
                    
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
