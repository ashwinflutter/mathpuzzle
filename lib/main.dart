import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:mathpuzzle/modelclass.dart';
import 'package:mathpuzzle/selectstage.dart';
import 'package:mathpuzzle/stage1.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: firstpage(),
  ));
}

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  String f1 = "myfamily";
  int? level;
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShareprefre();
  }

  Future<void> getShareprefre() async {
    model.pref = await SharedPreferences.getInstance();
    level = model.pref!.getInt("level") ?? 0;
    model.statuslist.clear();

    for (int i = 0; i < 75; i++) {
      String levelstatus = model.pref!.getString("status$i") ?? "pending";
      print(levelstatus);
      model.statuslist.add(levelstatus);
      print(model.statuslist);
    }
    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("GAME APP"),
        ),
        backgroundColor: Colors.brown.shade100,
        body: status
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 50,
                    width: 220,
                    child: Text(
                      "Math Puzzle",
                      style: TextStyle(
                          fontSize: 38,
                          fontFamily: f1,
                          color: Colors.blueAccent.shade700),
                    ),
                    color: Colors.brown.shade100,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/first5.png"))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return stage1(level!);
                                  },
                                ));
                              },
                              child: Text(
                                "CONTINUE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 33,
                                    fontFamily: f1),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return selectstage();
                                  },
                                ));
                              },
                              child: Text(
                                "PUZZLES",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 33,
                                    fontFamily: f1),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("image/list1.png"),
                      Icon(
                        Icons.share,
                        size: 48,
                      ),
                      Icon(
                        Icons.attach_email,
                        size: 48,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  )
                ],
              )
            : Center(child: CircularProgressIndicator()));
  }
}
