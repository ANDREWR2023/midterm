import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '_club.dart';

class MyComponent {
  var connection1;
  MyComponent() {
    connection1 = PostgreSQLConnection(
        "dpg-cf5kb11mbjsmchc477kg-a.ohio-postgres.render.com", 5432, "",
        username: "club_app_user",
        password: "pMutZYAE1gcIqIX8G2gatKzAOQbkOqQA",
        useSSL: false);
  }

  Future init() async {
    await connection1.open();
    print("init");
  }
}

Future<void> openUp() async {}
var c;
void main() async {
  c = new MyComponent();
  await c.init();
  print("done");
  runApp(const MyApp());
}

var usernameText = '';
var passwordText = '';

TextField x = new TextField(onChanged: (text) {
  usernameText = text;
});
TextField y = new TextField(
  onChanged: (text) {
    passwordText = text;
  },
  obscureText: true,
);

int _selectedIndex = 0;
// Define a corresponding State class.
// This class holds the data related to the Form.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Thanksgiving Recipes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.square),
              label: 'Student',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.square),
              label: 'Club President',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.square),
              label: 'Admin',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(children: [
          SizedBox(
              width: 600,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Color.fromARGB(255, 138, 216, 158),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(children: [
                        Text("Username:"),
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: x),
                        Text("Password:"),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: y,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Screen2()));
                            },
                            child: Text("Log In")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Screen3()));
                            },
                            child: Text("Create New Account"))
                      ]))))
        ])));
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyHomePage(title: '')));
          },
          child: Text('Log Out'),
        ),
        Text(usernameText),
        Text(passwordText),
        Text('$_selectedIndex')
      ]),
    ));
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Log In To Existing Account')),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.square),
              label: 'Student',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.square),
              label: 'Club President',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.square),
              label: 'Admin',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(children: [
          SizedBox(
              width: 600,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Color.fromARGB(255, 138, 216, 158),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(children: [
                        Text("Username:"),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: x,
                        ),
                        Text("Password:"),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: y,
                        ),
                        TextButton(
                            onPressed: () {
                              c.connection1.query(
                                  'INSERT INTO accounts (username, passwd, type) '
                                  'VALUES ($usernameText, $passwordText, $_selectedIndex);');
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Screen2()));
                            },
                            child: Text("Log In To New Account")),
                      ]))))
        ])));
  }
}
