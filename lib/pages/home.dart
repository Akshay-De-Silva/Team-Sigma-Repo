import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  String On = "OFF";
  bool light = false;
  int _value = 0;
  final dbR = FirebaseDatabase.instance.reference();
  int tempValue = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.topCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: light
                  ? Image.asset(
                      'images/light-on.png',
                      height: 100,
                      width: 100,
                    )
                  : Image.asset(
                      'images/light-off.png',
                      height: 100,
                      width: 100,
                    ),
              // child:Image.asset("images/light-on.png",height: 200,    width: 200,),
            ),
            FlatButton(
              child: Image.asset(
                "images/power2.png",
                height: 50,
                width: 50,
              ), //Adding the Bulb image
              // child:Text("LedON"),
              //color: Colors.blue,
              onPressed: () {
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
                  if (light == false) {
                    On = "OFF";
                    _value = 0;
                  }
                  if (light == true) {
                    On = "ON";
                  }
                });
              },
            ),
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: light
                    ? const Text("BULB IS ON",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))
                    : const Text(
                        "BULB IS OFF",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: const <Widget>[
                        Text(
                          "Brightness",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    color: Colors.amber,
                    size: 30,
                  ),
                  Expanded(
                    child: Slider(
                      value: _value.toDouble(),
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      activeColor: Colors.black,
                      inactiveColor: Colors.white,
                      label: '${_value.round()}',
                      onChanged: (double newValue) {
                        setState(
                          () {
                            _value = newValue.round();
                            if (light == true) {
                              if (_value == 0) {
                                dbR.child("Light").set({"Switch": "0"});
                              }
                              if (_value == 10) {
                                dbR.child("Light").set({"Switch": "10"});
                              }
                              if (_value == 20) {
                                dbR.child("Light").set({"Switch": "20"});
                              }
                              if (_value == 30) {
                                dbR.child("Light").set({"Switch": "30"});
                              }
                              if (_value == 40) {
                                dbR.child("Light").set({"Switch": "40"});
                              }
                              if (_value == 50) {
                                dbR.child("Light").set({"Switch": "50"});
                              }
                              if (_value == 60) {
                                dbR.child("Light").set({"Switch": "60"});
                              }
                              if (_value == 70) {
                                dbR.child("Light").set({"Switch": "70"});
                              }
                              if (_value == 80) {
                                dbR.child("Light").set({"Switch": "80"});
                              }
                              if (_value == 90) {
                                dbR.child("Light").set({"Switch": "90"});
                              }
                              if (_value == 100) {
                                dbR.child("Light").set({"Switch": "100"});
                              }
                            }
                          },
                        );
                      },
                    ),
                  ),
                  const Icon(
                    Icons.lightbulb,
                    color: Colors.amber,
                    size: 30,
                  ),
                ]),
              ],
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                height: 30,
                margin: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    FlatButton(
                      child: const Text(""),
                      color: Colors.red,
                      height: 20,
                      minWidth: 10,
                      onPressed: () {
                        if (light == true) {
                          dbR.child("Light").set({"Switch": "red"});
                        }
                      },
                    ),
                    FlatButton(
                      child: const Text(""),
                      color: Colors.green,
                      height: 20,
                      minWidth: 10,
                      onPressed: () {
                        if (light == true) {
                          dbR.child("Light").set({"Switch": "green"});
                        }
                      },
                    ),
                    FlatButton(
                      child: const Text(""),
                      color: Colors.blue,
                      height: 20,
                      minWidth: 10,
                      onPressed: () {
                        if (light == true) {
                          dbR.child("Light").set({"Switch": "blue"});
                        }
                      },
                    ),
                    FlatButton(
                      child: const Text(""),
                      color: Colors.yellow,
                      height: 20,
                      minWidth: 10,
                      onPressed: () {
                        if (light == true) {
                          dbR.child("Light").set({"Switch": "yellow"});
                        }
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            "Color Temperature",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsetsDirectional.only(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.lightbulb,
                              color: Colors.red,
                              size: 30,
                            ),
                            Expanded(
                              child: Slider(
                                  value: tempValue.toDouble(),
                                  min: 0.0,
                                  max: 100.0,
                                  divisions: 10,
                                  activeColor: Colors.black,
                                  inactiveColor: Colors.white,
                                  label: '${tempValue.round()}',
                                  onChanged: (double newValue) {
                                    setState(() {
                                      tempValue = newValue.round();
                                      if (light == true) {
                                        if (tempValue == 0) {
                                          //dbR.child("Light").set({"Switch": "red1blue1"});
                                        } else if (tempValue == 10) {
                                          dbR.child("Light").set({"Switch": "red1blue1"});
                                        } else if (tempValue == 20) {
                                          dbR.child("Light").set({"Switch": "red2blue2"});
                                        } else if (tempValue == 30) {
                                          dbR.child("Light").set({"Switch": "red3blue3"});
                                        } else if (tempValue == 40) {
                                          dbR.child("Light").set({"Switch": "red4blue4"});
                                        } else if (tempValue == 50) {
                                          dbR.child("Light").set({"Switch": "red5blue5"});
                                        } else if (tempValue == 60) {
                                          dbR.child("Light").set({"Switch": "red6blue6"});
                                        } else if (tempValue == 70) {
                                          dbR.child("Light").set({"Switch": "red7blue7"});
                                        } else if (tempValue == 80) {
                                          dbR.child("Light").set({"Switch": "red8blue8"});
                                        } else if (tempValue == 90) {
                                          dbR.child("Light").set({"Switch": "red9blue9"});
                                        } else if (tempValue == 100) {
                                          dbR.child("Light").set({"Switch": "red10blue10"});
                                        }
                                      }
                                    },
                                    );
                                  },
                                  //label: 'Bulb Brigtness',
                                  semanticFormatterCallback: (double newValue) {
                                    return '${newValue.round()} dollars';
                                  },),
                            ),
                            const Icon(
                              Icons.lightbulb,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ],),),
                ],
              ),
            ],),
          ],
        ),
      ),
    );
  }
}
