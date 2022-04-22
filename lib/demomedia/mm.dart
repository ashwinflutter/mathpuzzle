import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> {
  int? a;

  SharedPreferences? prefs;
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Obtain shared preferences.
    getShareprefre();
  }

  Future<void> getShareprefre() async {
    prefs = await SharedPreferences.getInstance();
    a = prefs!.getInt("cnt") ?? 0;

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double naviheight = MediaQuery.of(context).padding.bottom;
    double toolbarheight = kToolbarHeight;
    double bodyheight = theight - statusbarheight - toolbarheight - naviheight;

    return Scaffold(
      appBar: AppBar(
        title: Text("MediaQuery"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                // a++;
                setState(() {
                  a = a! + 1;
                  prefs!.setInt("cnt", a!);

                });
              },
              child: Text("Increment")),
          Text("$a")
        ],
      ),
    );
  }
}
