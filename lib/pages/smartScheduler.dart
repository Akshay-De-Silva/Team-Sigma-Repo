import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smartbulbfirebase/dataset.dart';

class smartSchedulerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: settingspage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class settingspage extends StatefulWidget {
  const settingspage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _settingspage();
  }
}

class _settingspage extends State<settingspage> {
  var onOff = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,];
  var brightness = ['10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10'];
  var colorTemp = ['10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10','10'];
  bool isSwitched = false;
  var datasetOnOff = <int>[];
  var datasetBrightness = <int>[];
  var datasetColorTemp = <int>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Table(
            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
              3: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("TIME")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("ON/Off")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("BRIGHTNESS")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("COLOR TEMPERATURE")),
                    ),
                  ),
                ],
              ),

              
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("12 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[0],
                        onChanged: ((val){
                          setState(() {
                            onOff[0] = val;
                            print(onOff[0]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      //width: 100,
                      child: DropdownButton<String>(
                        value: brightness[0],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[0] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[0],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[0] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("1 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[1],
                        onChanged: ((val){
                          setState(() {
                            onOff[1] = val;
                            print(onOff[1]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Container(
                        height: 32,
                        //width: 100,
                        child: DropdownButton<String>(
                          value: brightness[1],
                          elevation: 5,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              brightness[1] = newValue!;
                            });
                          },
                          items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Container(
                        height: 32,
                        width: 100,
                        child: DropdownButton<String>(
                          value: colorTemp[1],
                          elevation: 5,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              colorTemp[1] = newValue!;
                            });
                          },
                          items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("2 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[2],
                        onChanged: ((val){
                          setState(() {
                            onOff[2] = val;
                            print(onOff[2]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Container(
                        height: 32,
                        //width: 100,
                        child: DropdownButton<String>(
                          value: brightness[2],
                          elevation: 5,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              brightness[2] = newValue!;
                            });
                          },
                          items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Container(
                        height: 32,
                        width: 100,
                        child: Container(
                          height: 32,
                          width: 100,
                          child: DropdownButton<String>(
                            value: colorTemp[2],
                            elevation: 5,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                colorTemp[2] = newValue!;
                              });
                            },
                            items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("3 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[3],
                        onChanged: ((val){
                          setState(() {
                            onOff[3] = val;
                            print(onOff[3]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[3],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[3] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Container(
                        height: 32,
                        width: 100,
                        child: DropdownButton<String>(
                          value: colorTemp[3],
                          elevation: 5,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              colorTemp[3] = newValue!;
                            });
                          },
                          items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("4 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[4],
                        onChanged: ((val){
                          setState(() {
                            onOff[4] = val;
                            print(onOff[4]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[4],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[4] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[4],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[4] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("5 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[5],
                        onChanged: ((val){
                          setState(() {
                            onOff[5] = val;
                            print(onOff[5]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[5],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[5] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[5],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[5] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("6 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[6],
                        onChanged: ((val){
                          setState(() {
                            onOff[6] = val;
                            print(onOff[6]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[6],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[6] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[6],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[6] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("7 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[7],
                        onChanged: ((val){
                          setState(() {
                            onOff[7] = val;
                            print(onOff[7]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[7],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[7] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[7],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[7] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("8 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[8],
                        onChanged: ((val){
                          setState(() {
                            onOff[8] = val;
                            print(onOff[8]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[8],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[8] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[8],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[8] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("9 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[9],
                        onChanged: ((val){
                          setState(() {
                            onOff[9] = val;
                            print(onOff[9]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[9],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[9] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[9],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[9] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("10 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[10],
                        onChanged: ((val){
                          setState(() {
                            onOff[10] = val;
                            print(onOff[10]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[10],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[10] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[10],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[10] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("11 AM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[11],
                        onChanged: ((val){
                          setState(() {
                            onOff[11] = val;
                            print(onOff[11]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[11],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[11] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[11],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[11] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("12 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[12],
                        onChanged: ((val){
                          setState(() {
                            onOff[12] = val;
                            print(onOff[12]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[12],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[12] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[12],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[12] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("1 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[13],
                        onChanged: ((val){
                          setState(() {
                            onOff[13] = val;
                            print(onOff[13]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[13],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[13] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[13],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[13] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("2 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[14],
                        onChanged: ((val){
                          setState(() {
                            onOff[14] = val;
                            print(onOff[14]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[14],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[14] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[14],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[14] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("3 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[15],
                        onChanged: ((val){
                          setState(() {
                            onOff[15] = val;
                            print(onOff[15]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[15],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[15] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[15],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[15] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("4 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[16],
                        onChanged: ((val){
                          setState(() {
                            onOff[16] = val;
                            print(onOff[16]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[16],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[16] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[16],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[16] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("5 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[17],
                        onChanged: ((val){
                          setState(() {
                            onOff[17] = val;
                            print(onOff[17]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[17],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[17] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[17],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[17] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("6 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[18],
                        onChanged: ((val){
                          setState(() {
                            onOff[18] = val;
                            print(onOff[18]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[18],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[18] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[18],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[18] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("7 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[19],
                        onChanged: ((val){
                          setState(() {
                            onOff[19] = val;
                            print(onOff[19]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[19],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[19] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[19],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[19] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("8 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[20],
                        onChanged: ((val){
                          setState(() {
                            onOff[20] = val;
                            print(onOff[20]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[20],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[20] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[20],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[20] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("9 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[21],
                        onChanged: ((val){
                          setState(() {
                            onOff[21] = val;
                            print(onOff[21]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[21],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[21] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[21],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[21] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("10 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[22],
                        onChanged: ((val){
                          setState(() {
                            onOff[22] = val;
                            print(onOff[22]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[22],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[22] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[22],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[22] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Center(child: Text("11 PM")),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: Switch(
                        value: onOff[23],
                        onChanged: ((val){
                          setState(() {
                            onOff[23] = val;
                            print(onOff[23]);
                          });
                        }),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: brightness[23],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            brightness[23] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TableCell(
                    //verticalAlignment: TableCellVerticalAlignment.top,
                    child: Container(
                      height: 32,
                      width: 100,
                      child: DropdownButton<String>(
                        value: colorTemp[23],
                        elevation: 5,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            colorTemp[23] = newValue!;
                          });
                        },
                        items: <String>['10', '20', '30', '40', '50', '60', '70', '80', '90', '100']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
          Container(
            child: Switch(
              value: isSwitched,
              onChanged: ((val){
                setState(() {
                  isSwitched=val;
                });
                  datasetOnOff.clear();
                  datasetBrightness.clear();
                  datasetColorTemp.clear();
                  if(isSwitched==true) {
                    for (var i in onOff) {
                      if (i == true) {
                        datasetOnOff.add(1);
                      } else {
                        datasetOnOff.add(0);
                      }
                    }
                    for (var i in brightness) {
                      if (i == '10') {
                        datasetBrightness.add(1);
                      } else if (i == '20') {
                        datasetBrightness.add(2);
                      } else if (i == '30') {
                        datasetBrightness.add(3);
                      } else if (i == '40') {
                        datasetBrightness.add(4);
                      } else if (i == '50') {
                        datasetBrightness.add(5);
                      } else if (i == '60') {
                        datasetBrightness.add(6);
                      } else if (i == '70') {
                        datasetBrightness.add(7);
                      } else if (i == '80') {
                        datasetBrightness.add(8);
                      } else if (i == '90') {
                        datasetBrightness.add(9);
                      } else if (i == '100') {
                        datasetBrightness.add(10);
                      }
                    }
                    for (var i in colorTemp) {
                      if (i == '10') {
                        datasetColorTemp.add(1);
                      } else if (i == '20') {
                        datasetColorTemp.add(2);
                      } else if (i == '30') {
                        datasetColorTemp.add(3);
                      } else if (i == '40') {
                        datasetColorTemp.add(4);
                      } else if (i == '50') {
                        datasetColorTemp.add(5);
                      } else if (i == '60') {
                        datasetColorTemp.add(6);
                      } else if (i == '70') {
                        datasetColorTemp.add(7);
                      } else if (i == '80') {
                        datasetColorTemp.add(8);
                      } else if (i == '90') {
                        datasetColorTemp.add(9);
                      } else if (i == '100') {
                        datasetColorTemp.add(10);
                      }
                    }
                  }
                  json.add({
                    "Time": 12,
                    "OnOff": datasetOnOff[0],
                    "Brightness": datasetBrightness[0],
                    "ColorTemp": datasetColorTemp[0]
                  });
                /*json.add({
                  "Time": 1,
                  "OnOff": datasetOnOff[1],
                  "Brightness": datasetBrightness[1],
                  "ColorTemp": datasetColorTemp[1]
                });
                json.add({
                  "Time": 2,
                  "OnOff": datasetOnOff[2],
                  "Brightness": datasetBrightness[2],
                  "ColorTemp": datasetColorTemp[2]
                });*/
                for(var i=1; i<24; i++){
                  json.add({
                    "Time": i,
                    "OnOff": datasetOnOff[i],
                    "Brightness": datasetBrightness[i],
                    "ColorTemp": datasetColorTemp[i]
                  });
                }
                  print(json);
                  print(json.last);
                  print(datasetOnOff);
                  print(datasetBrightness);
                  print(datasetColorTemp);
              }),
            ),
          )
        ],
      ),
    );
  }
}
