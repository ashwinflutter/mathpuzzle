import 'package:flutter/material.dart';
import 'package:mathpuzzle/modelclass.dart';
import 'package:mathpuzzle/stage1.dart';

import 'main.dart';

class selectstage extends StatefulWidget {
  const selectstage({Key? key}) : super(key: key);
  @override
  _selectstageState createState() => _selectstageState();
}

class _selectstageState extends State<selectstage> {
  String f1 = "myfamily";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: (63),
            backgroundColor: Colors.green.shade300,
            title: Text(
              "SELECT LEVEL",
              style: TextStyle(fontSize: 26, color: Colors.black54),
            ),
          ),
          backgroundColor: Colors.green.shade100,
          body: Container(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: 75,
              itemBuilder: (context, index) {
                int level = model.pref!.getInt("level") ?? 0;

                if (model.statuslist[index] == "clear") {
                  return InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return stage1(index);
                        },
                      ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(fontSize: 48, fontFamily: f1),
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/tick.png"))),
                    ),
                  );
                } else if (model.statuslist[index] == "skip") {
                  return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return stage1(index);
                          },
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("${index + 1}",
                            style: TextStyle(fontSize: 48, fontFamily: f1)),
                      ));
                } else {
                  if (level == index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("${index + 1}",
                            style: TextStyle(fontSize: 48, fontFamily: f1)),
                      ),
                    );
                  } else {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/lock.png"))),
                      ),
                    );
                  }
                  ;
                }
              },
            ),
          )),
      onWillPop: onback,
    );
  }

  Future<bool> onback() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Do You Want to Exit"),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return firstpage();
                    },
                  ));
                },
                child: Text("Yes")), FlatButton(
                onPressed: () {
                Navigator.pop(context);
                },
                child: Text("No"))
          ],
        );
      },
    );

    return Future.value(true);
  }
}
