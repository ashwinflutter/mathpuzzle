import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class jj extends StatefulWidget {
  const jj({Key? key}) : super(key: key);

  @override
  _jjState createState() => _jjState();
}

class _jjState extends State<jj> {
  int? a;
  SharedPreferences? prefs;
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getshareprefre();
  }

  Future<void> getshareprefre() async {
    prefs = await SharedPreferences.getInstance();
    a = prefs!.getInt("cnt") ?? 0;
    setState(() {
      status = true;
    });
  }


  String? b1;
  TextEditingController textEditingController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hh"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(onTap: (){},
            child: Container(
              child: TextField(controller: textEditingController,
                onChanged: (value) {
               setState(() {
                 b1=value;
               });
              },),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                prefs!.setString("ashwin",b1!);
                b1="";
                });
              },
              child: Text("setdata")), Text(("$b1")),
          ElevatedButton(
              onPressed: () async{
                prefs = await SharedPreferences.getInstance();
                b1=prefs!.getString("ashwin")??"";
                textEditingController.text=b1!;
                 setState(() {
                   status = true;
                   b1="ashwin";
                 });
              },
              child: Text("getdata")),
          Text(("$b1")),
        ],
      ),
    );
  }
}
