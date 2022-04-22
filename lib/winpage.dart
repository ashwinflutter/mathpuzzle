import 'package:flutter/material.dart';
import 'package:mathpuzzle/main.dart';
import 'package:mathpuzzle/modelclass.dart';
import 'package:mathpuzzle/stage1.dart';

class winpage extends StatefulWidget {
  int level;
  winpage(this.level);

  @override
  _winpageState createState() => _winpageState();
}

class _winpageState extends State<winpage> {
  String f1 = "myfamily";



  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double naviheight = MediaQuery.of(context).padding.bottom;
    double toolbarheight = kToolbarHeight;
    double bodyheight = theight - statusbarheight - toolbarheight - naviheight;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: toolbarheight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 350,
                  child: Text(
                    "Leval ${widget.level + 1} Complited",
                    style: TextStyle(fontSize: 38, fontFamily: f1),
                  ),
                ),
              ],
            ),
            Container(
              height: theight * .45,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("image/trophy.png"))),
            ),
            Column(
              children: [
                InkWell(onTap: () {
                  model.pref!.setInt("level", widget.level);

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return stage1(widget.level+1);
                  },));
                },
                  child: Container(margin: EdgeInsets.all(20),
                    // color: Colors.black26,
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(
                          fontSize: 30, fontFamily: f1, color: Colors.black),
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black26,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade200, spreadRadius: 5),
                      ],
                    ),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                    return firstpage();
                  },));
                },
                  child: Container(margin: EdgeInsets.all(10),
                    // color: Colors.black26,
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    child: Text(
                      "MAIN MENU",
                      style: TextStyle(
                          fontSize: 30, fontFamily: f1, color: Colors.black),
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black26,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade200, spreadRadius: 5),
                      ],
                    ),
                  ),
                ),
                Container(margin: EdgeInsets.all(15),
                  child: Icon(
                    Icons.share,
                    size: 38,
                  ), decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightGreen.shade300,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, spreadRadius: 5),
                  ],
                ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
