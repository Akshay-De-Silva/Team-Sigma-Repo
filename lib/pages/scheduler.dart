import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

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
  //DateTime date = DateTime(2022, 12, 24);
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    //DateTime now = new DateTime.now();
    //var rtime = now.hour;
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
            /*Container(
              child:Column(
                children: [
                  Text(
                    '${date.year}/${date.month}/${date.day}',
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height:16),
                  ElevatedButton(
                    child:Text('Select Date'),
                    onPressed: () async{
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if(newDate == null) return;

                      setState(() => date = newDate);
                    },
                  ),
                ],
              ),


            ),*/
            Container(
              child:Column(
                children: [
                  Text(
                    '${time.hour} ''hours',
                    style:TextStyle(fontSize:32),
                  ),
                  const SizedBox(height:16),
                  ElevatedButton(
                    child:Text('Select Time'),
                    onPressed:() async{
                      TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime:time
                      );
                      if(newTime == null) return;
                      setState(() => time =newTime);
                    },

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}