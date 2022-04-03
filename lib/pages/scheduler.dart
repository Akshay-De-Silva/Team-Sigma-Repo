import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SchedulerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: schedulerpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class schedulerpage extends StatefulWidget {
  const schedulerpage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _schedulerpage();
  }
}

class _schedulerpage extends State<schedulerpage> {
  //List<String> items = <String>['0', '10', '20', '30', '40', '50', '60', '70', '80', '90', '100'];
  //String dropdownValue = '0';
  late Timer _timer;
  //DateTime date = DateTime(2022, 12, 24);
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  String On = "OFF";
  bool light = false;
  int value = 0;
  bool select = false;
  final dbR = FirebaseDatabase.instance.reference();
  late String colour;
  int tempValue = 50;
  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    DateTime now = new DateTime.now();
    var rtime = now.hour;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scheduler Page",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    '${time.hour} ' 'hours',
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: Text('Select Time'),
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                          context: context, initialTime: time);
                      if (newTime == null) return;
                      setState(() => time = newTime);
                    },
                  ),
                ],
              ),
            ),
            /*FlatButton(
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
                  //dbR.child("Light").set({"Switch": "OFF"});
                  light = false;
                } else {
                  //if ledstatus is false, then turn on the led
                  //if led is off, turn on
                  //dbR.child("Light").set({"Switch": "ON"});
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
            ),*/
            Switch(
              activeColor: Colors.amberAccent,
              inactiveThumbColor: Colors.redAccent,
              activeTrackColor: Colors.black,
              value: light,
              onChanged: (val) {
                setState(() {
                  light = val;
                  if (light == false) {
                    On = "OFF";
                    //_value = 0;
                  } else if (light == true) {
                    On = "ON";
                  }
                });
              },
            ),
            Container(
              child: Padding(
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
            ),
            Column(
              children: [
                Container(
                  child: Padding(
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
                ),
                Container(
                  child: Row(
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
                          value: value.toDouble(),
                          min: 0.0,
                          max: 100.0,
                          divisions: 10,
                          activeColor: Colors.black,
                          inactiveColor: Colors.white,
                          label: '${value.round()}',
                          onChanged: (double newValue) {
                            setState(
                              () {
                                value = newValue.round();
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
                    ],
                  ),
                ),
              ],
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
                                  });
                                },
                                //label: 'Bulb Brigtness',
                                semanticFormatterCallback: (double newValue) {
                                  return '${newValue.round()} dollars';
                                }),
                          ),
                          const Icon(
                            Icons.lightbulb,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ])),
              ],
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40),
              child: Row(
                children: [
                  const Text(
                    'SCHEDULER',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    activeColor: Colors.amberAccent,
                    inactiveThumbColor: Colors.redAccent,
                    value: select,
                    onChanged: (val) {
                      setState(() {
                        select = val;
                        print(select);
                      });
                      if (select == true) {
                        const oneSec = Duration(seconds: 5);
                        _timer = Timer.periodic(
                          oneSec,
                          (Timer timer) => setState(
                            () {
                              //if (rtime == time.hour) {
                              if (light == true && select == true) {
                                dbR.child("Light").set({"Switch": "ON"});
                                //light = false;
                                if (value == 0) {
                                  dbR.child("Light").set({"Switch": "0"});
                                } else if (value == 10) {
                                  dbR.child("Light").set({"Switch": "10"});
                                } else if (value == 20) {
                                  dbR.child("Light").set({"Switch": "20"});
                                } else if (value == 30) {
                                  dbR.child("Light").set({"Switch": "30"});
                                } else if (value == 40) {
                                  dbR.child("Light").set({"Switch": "40"});
                                } else if (value == 50) {
                                  dbR.child("Light").set({"Switch": "50"});
                                } else if (value == 60) {
                                  dbR.child("Light").set({"Switch": "60"});
                                } else if (value == 70) {
                                  dbR.child("Light").set({"Switch": "70"});
                                } else if (value == 80) {
                                  dbR.child("Light").set({"Switch": "80"});
                                } else if (value == 90) {
                                  dbR.child("Light").set({"Switch": "90"});
                                } else if (value == 100) {
                                  dbR.child("Light").set({"Switch": "100"});
                                }
                                if (tempValue == 0) {
                                  //dbR.child("Light").set({"Switch": "red1blue1"});
                                }else if (tempValue == 10) {
                                  dbR.child("Light").set({"Switch": "red1blue1"});
                                }else if (tempValue == 20) {
                                  dbR.child("Light").set({"Switch": "red2blue2"});
                                }else if (tempValue == 30) {
                                  dbR.child("Light").set({"Switch": "red3blue3"});
                                }else if (tempValue == 40) {
                                  dbR.child("Light").set({"Switch": "red4blue4"});
                                }else if (tempValue == 50) {
                                  dbR.child("Light").set({"Switch": "red5blue5"});
                                }else if (tempValue == 60) {
                                  dbR.child("Light").set({"Switch": "red6blue6"});
                                }else if (tempValue == 70) {
                                  dbR.child("Light").set({"Switch": "red7blue7"});
                                }else if (tempValue == 80) {
                                  dbR.child("Light").set({"Switch": "red8blue8"});
                                }else if (tempValue == 90) {
                                  dbR.child("Light").set({"Switch": "red9blue9"});
                                }else if (tempValue == 100) {
                                  dbR.child("Light").set({"Switch": "red10blue10"});
                                }
                              } else if (light == false) {
                                dbR.child("Light").set({"Switch": "OFF"});
                              }
                              _timer.cancel();
                            },
                          ),
                        );
                      } else if (select == false) {
                        light = false;
                        value = 0;
                        dbR.child("Light").set({"Switch": "OFF"});
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
