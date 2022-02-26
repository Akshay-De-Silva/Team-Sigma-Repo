// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(

      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  // @override
  // State<MyHomePage> createState() => _MyHomePageState();
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}


class _MyHomePageState extends State<MyHomePage> {
  String On="OFF";
  bool light=false;
  int _value = 0;
  final dbR= FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black,),
        title: const Text("Smart Bulb",
        style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize:24
          ),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover)),


        child: Column(
         // mainAxisAlignment: MainAxisAlignment.topCenter,
          children: <Widget>[

            Container(
              child:Padding(
                  padding:
            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child:light ? Image.asset( 'images/light-on.png',    height: 200,    width: 200, )
                  : Image.asset( 'images/light-off.png',    height: 200,    width: 200, ),
             // child:Image.asset("images/light-on.png",height: 200,    width: 200,),

            ),
            ),


            FlatButton(
              child:Image.asset("images/power2.png",height: 50,    width: 50,),//Adding the Bulb image
             // child:Text("LedON"),
              //color: Colors.blue,
              onPressed: (){
                if (light) {
                  //if ledstatus is true, then turn off the led
                  //if led is on, turn off
                  dbR.child("Light").set({"Switch": "OFF"});
                  light = false;
                } else {
                  //if ledstatus is false, then turn on the led
                  //if led is off, turn on
                  dbR.child("Light").set({"Switch": "ON"});
                  light = true;
                }
                setState(() {
                  if(light==false)
                    {
                      On="OFF";
                      _value=0;
                    }
                  if(light==true)
                  {
                     On="ON";
                  }
                });


              },
            ),

            Container(
              child:Padding(
                  padding:
                  const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child:light ? const Text("BULB IS ON",style: TextStyle(
                    fontSize:14.0,
                    fontWeight:FontWeight.bold,
                    color: Colors.black,
                  )) : const Text("BULB IS OFF",style: TextStyle(
                    fontSize:14.0,
                    fontWeight:FontWeight.bold,
                    color: Colors.black,
                  ),)


              ),
            ),


          ],
        ),
      ),

    );
  }
}
