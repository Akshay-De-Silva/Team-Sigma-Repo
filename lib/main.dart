// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'pages/home.dart';
import 'pages/scheduler.dart';
import 'pages/settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    homePage(),
    schedulerpage(),
    settingsPage(),
  ];

  int _selectedIndex = 0;

  _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Some App"),
      ),*/
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[..._pages],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.grey[300],
        onTap: _onTapped,
        items: const [
          BottomNavigationBarItem(
            //title: Text("Home"),
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //title: Text("Trending"),
            icon: Icon(Icons.schedule_rounded),
            label: "Scheduler",
          ),
          BottomNavigationBarItem(
            //title: Text("Trending"),
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}



