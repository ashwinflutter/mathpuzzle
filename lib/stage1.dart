import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpuzzle/main.dart';
import 'package:mathpuzzle/modelclass.dart';
import 'package:mathpuzzle/winpage.dart';

class stage1 extends StatefulWidget {
  int level;

  stage1(this.level);

  @override
  _stage1State createState() => _stage1State();
}

class _stage1State extends State<stage1> {
  String f1 = "myfamily";

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double naviheight = MediaQuery.of(context).padding.bottom;
    double toolbarheight = kToolbarHeight;
    double bodyheight = theight - statusbarheight - toolbarheight - naviheight;

    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.brown.shade100,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/gameplaybackground.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Container(
                height: toolbarheight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      model.statuslist[widget.level] = "skip";
                      model.pref!.setString("status${widget.level}", "skip");
                      setState(() {
                        widget.level++;
                      });
                      model.pref!.setInt("level", widget.level);
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return stage1(widget.level);
                        },
                      ));
                    },
                    child: Container(
                      height: 60,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/skip.png"))),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 220,
                    child: Text(
                      "Leval ${widget.level + 1}",
                      style: TextStyle(
                          fontSize: 41, fontFamily: f1, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/level_board.png"))),
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/hint.png"))),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: theight * .50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/p${widget.level + 1}.png"))),
              ),
              SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: toolbarheight,
                      width: 200,
                      child: Text(
                        "${b1}",
                        style: TextStyle(fontSize: 36, fontFamily: f1),
                      ),
                      alignment: Alignment.center,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        b1 = b1.substring(0, b1.length - 1);
                      });
                    },
                    child: Container(
                      height: toolbarheight,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/delete.png"))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (b1 == answer[widget.level]) {
                        String levelstatus = model.statuslist[widget.level];
                        if (levelstatus == "clear") {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return winpage(widget.level);
                            },
                          ));
                        } else if (levelstatus == "skip") {
                          model.statuslist[widget.level] = "clear";
                          model.pref!
                              .setString("status${widget.level}", "clear");
                          model.statuslist[widget.level] = "skip";
                          model.pref!.setInt("level", widget.level);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return winpage(widget.level);
                            },
                          ));
                        } else {
                          model.statuslist[widget.level] = "clear";
                          model.pref!
                              .setString("status${widget.level}", "clear");

                          setState(() {
                            widget.level++;
                          });

                          model.pref!.setInt("level", widget.level);

                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return winpage(widget.level - 1);
                            },
                          ));
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "wrong answer",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM_LEFT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.brown,
                            fontSize: 17.0);
                      }
                    },
                    child: Container(
                      color: Colors.black,
                      alignment: Alignment.center,
                      height: toolbarheight,
                      width: 95,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 26, fontFamily: f1, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: inputbutton(),
              ),
            ],
          ),
        ),
      ),
      onWillPop: onback,
    );
  }

  Future<bool> onback() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Do You Want To Exit"),actions: [FlatButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return firstpage();
            },));

          }, child:Text("yes") ),
        FlatButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text("no"))
        ],
        );
      },
    );
    return Future.value(true);
  }

  String b1 = "";

  List<Widget> inputbutton() {
    List<Widget> list = [];

    for (int i = 0; i < 10; i++) {
      list.add(Expanded(
          child: InkWell(
              onTap: () {
                setState(() {
                  b1 = "$b1$i";
                });
              },
              child: Container(
                margin: EdgeInsets.all(2),
                color: Colors.black,
                height: 48,
                width: 35,
                child: Center(
                    child: Text(
                  "$i",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ))));

    }

    return list;
  }

  List<String> answer = [
    "10", "25", "6", "14", "128", "7", "50", "1025", "100", "3", "212", "3011", "14", "16", "1",
    "2", "44", "45", "625", "1", "13", "47", "50", "34", "6", "41", "16", "126", "82", "14",
    "7", "132", "34", "48", "42", "288", "45", "4", "111", "47", "27", "87", "22", "253", "12",
    "38", "178", "1", "6", "10", "2", "20", "7", "511", "143547", "84", "11", "27", "3", "5",
    "39", "31", "10", "130", "22", "3", "14", "42", "164045", "11", "481", "86", "84", "13", "8"
  ];
}
