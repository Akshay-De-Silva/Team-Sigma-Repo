import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartbulbfirebase/dataset.dart';
import 'package:smartbulbfirebase/pages/smartScheduler.dart';
import '../MachineLearningFun.dart';

void main() => runApp(const Prediction());

class Prediction extends StatelessWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PredictionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  //final scaffoldKey = GlobalKey<ScaffoldState>();
  late var f;

  var data0 = " ";
  var data1 = " ";
  var data2 = " ";
  var data3 = " ";
  var data4 = " ";
  var data5 = " ";
  var data6 = " ";
  var data7 = " ";
  var data8 = " ";
  var data9 = " ";
  var data10 = " ";
  var data11 = " ";
  var data12 = " ";
  var data13 = " ";
  var data14 = " ";
  var data15 = " ";
  var data16 = " ";
  var data17 = " ";
  var data18 = " ";
  var data19 = " ";
  var data20 = " ";
  var data21 = " ";
  var data22 = " ";
  var data23 = " ";
  var data24 = " ";

  String BrightnessLevel(String data) {
    var brightnessStatus = "";
    if (data[4] == "1" ||
        data[4] == "2" ||
        data[4] == "3" ||
        data[4] == "4" ||
        data[4] == "5" ||
        data[4] == "6" ||
        data[4] == "7" ||
        data[4] == "8" ||
        data[4] == "9") {
      if (data[4] == "1" && data[5] != "0") {
        brightnessStatus += " brightness level 10%";
      }
      if (data[4] == "2") {
        brightnessStatus += " brightness level 20%";
      }
      if (data[4] == "3") {
        brightnessStatus += " brightness level 30%";
      }
      if (data[4] == "4") {
        brightnessStatus += " brightness level 40%";
      }
      if (data[4] == "5") {
        brightnessStatus += " brightness level 50%";
      }
      if (data[4] == "6") {
        brightnessStatus += " brightness level 60%";
      }
      if (data[4] == "7") {
        brightnessStatus += " brightness level 70%";
      }
      if (data[4] == "8") {
        brightnessStatus += " brightness level 80%";
      }
      if (data[4] == "9") {
        brightnessStatus += " brightness level 90%";
      }
      if (data[4] == "1" && data[5] == "0") {
        brightnessStatus += " brightness level 100%";
      }
    }
    return brightnessStatus;
  }

  String colortemperature(String data) {
    var colorTemStatus = "";
    if (data[7] == "1" ||
        data[7] == "2" ||
        data[7] == "3" ||
        data[7] == "4" ||
        data[7] == "5" ||
        data[7] == "6" ||
        data[7] == "7" ||
        data[7] == "8" ||
        data[7] == "9" ||
        data[7] == "10" ||
        data[8] == "4") {
      if (data[7] == "1") {
        colorTemStatus += " Color temperature 10000K";
      }
      if (data[7] == "2") {
        colorTemStatus += " Color temperature 9000K";
      }
      if (data[7] == "3") {
        colorTemStatus += " Color temperature 8000K";
      }
      if (data[7] == "4") {
        colorTemStatus += " Color temperature 7000K";
      }
      if (data[7] == "5") {
        colorTemStatus += " Color temperature 6000K";
      }
      if (data[7] == "6") {
        colorTemStatus += " Color temperature 5000K";
      }
      if (data[7] == "7") {
        colorTemStatus += " Color temperature 4000K";
      }
      if (data[7] == "8") {
        colorTemStatus += " Color temperature 3000K";
      }
      if (data[7] == "9") {
        colorTemStatus += " Color temperature 2000K";
      }
      if (data[7] == "1" && data[8] == "0") {
        colorTemStatus += " Color temperature 1000K";
      }
      if (data[8] == "4") {
        colorTemStatus += " Color temperature 7000K";
      }
    }
    return colorTemStatus;
  }

  String recomendation(String data) {
    var recomen = "";
    if (data[1] == "1") {
      recomen += "Bulb is ON ";
      recomen += BrightnessLevel(data);
      recomen += colortemperature(data);
    } else if (data[1] == "0") {
      recomen += "Bulb is OFF ";
      recomen += BrightnessLevel(data);
      recomen += colortemperature(data);
    }
    return recomen;
  }

  bool isSwitched = false;
  //late bool switched ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: Colors.blueAccent,
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Row(
            children: [
              const Text("Smart Scheduler",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Switch(
                  activeColor: Colors.yellowAccent,
                  value: isSwitched,
                  onChanged: (value) async {
                    setState(() {
                      isSwitched = value;
                    });

                    String body = jsonEncode(json);
                    var id = await createAlbum(body);
                    f = jsonDecode(id.body);
                    // print(f.toString());
                    // print(f["0"]);
                    //data0=f["0"].toString();
                    setState(() {
                      data0 = recomendation(f["0"].toString());
                      data1 = recomendation(f["1"].toString());
                      data2 = recomendation(f["2"].toString());
                      data3 = recomendation(f["3"].toString());
                      data4 = recomendation(f["4"].toString());
                      data5 = recomendation(f["5"].toString());
                      data6 = recomendation(f["6"].toString());
                      data7 = recomendation(f["7"].toString());
                      data8 = recomendation(f["8"].toString());
                      data9 = recomendation(f["9"].toString());
                      data10 = recomendation(f["10"].toString());
                      data11 = recomendation(f["11"].toString());
                      data12 = recomendation(f["12"].toString());
                      data13 = recomendation(f["13"].toString());
                      data14 = recomendation(f["14"].toString());
                      data15 = recomendation(f["15"].toString());
                      data16 = recomendation(f["16"].toString());
                      data17 = recomendation(f["17"].toString());
                      data18 = recomendation(f["18"].toString());
                      data19 = recomendation(f["19"].toString());
                      data20 = recomendation(f["20"].toString());
                      data21 = recomendation(f["21"].toString());
                      data22 = recomendation(f["22"].toString());
                      data23 = recomendation(f["23"].toString());
                    });
                  }),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "12AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data0,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "1AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "2AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data2,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "3AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data3,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "4AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data4,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "5AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data5,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "6AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data6,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "7AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data7,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "8AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data8,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "9AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data9,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "10AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data10,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "11AM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data11,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "12PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data12,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "1PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data13,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "2PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data14,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "3PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data15,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "4PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data16,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "5PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data17,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "6PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data18,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "7PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data19,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "8PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data20,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "9PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data21,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "10PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data22,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            width: 12,
            height: 65,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "11PM",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  data23,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 100, end: 100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(26,7,148,100),
              ),
              child: const Text(
                "BACK",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => smartSchedulerPage()),
                );
              },
            ),
          ),
        ],
        //padding: EdgeInsets.all(10),
      ),
    );
  }
}
