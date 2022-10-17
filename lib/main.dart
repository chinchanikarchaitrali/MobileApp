

import "package:flutter/material.dart";
import 'package:learning_fitbit_mapp/Signup.dart';
import 'package:learning_fitbit_mapp/Steptwo.dart';
import 'package:learning_fitbit_mapp/Login.dart';
import 'package:learning_fitbit_mapp/Menu.dart';
import 'package:learning_fitbit_mapp/Home.dart';
import 'package:learning_fitbit_mapp/Personalacademic.dart';
import 'package:learning_fitbit_mapp/Parentsibling.dart';
//import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learning_fitbit_mapp/Apiconstants.dart';
import 'package:learning_fitbit_mapp/Result.dart';
import 'package:learning_fitbit_mapp/Apiservice.dart';
import 'package:http/http.dart' as http;
import 'package:learning_fitbit_mapp/Signup.dart';
import 'package:intl/intl.dart';
import 'package:learning_fitbit_mapp/Apiconstants.dart';
import 'package:learning_fitbit_mapp/Registration.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';
import 'package:learning_fitbit_mapp/Statecall.dart';
import 'package:learning_fitbit_mapp/States.dart';
import 'package:learning_fitbit_mapp/Citycall.dart';
import 'package:learning_fitbit_mapp/Cities.dart';
import 'package:learning_fitbit_mapp/Nativecall.dart';
import 'package:learning_fitbit_mapp/Nativelang.dart';
import 'dart:async';

void main() {
  WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
 List <Map<String,dynamic>>st= List.empty(growable: true);
 List<Map<String,dynamic>> stlist= List.empty(growable: true);
  List<Map<String,dynamic>> ct=List.empty(growable: true);
  List <Map<String,dynamic>>list=List.empty(growable:true);
  List nativeln= List.empty(growable: true);
  //List c=List.empty(growable:true);
  List lnlist=List.empty(growable: true);
   Future<List<Map<String,dynamic>>> futurestateresponse;
   print("Below is state api call");


  StateCall().getState().then((futurestateresponse) {
    //var map=Map.fromIterable(futurestateresponse,key: (e)=>e.key,value: (e)=>e.value);
    //print(map.toString());
    //print("What is happening");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("Hello states");
      stlist = futurestateresponse;
      for (var i = 0; i < stlist.length; i++)
      {
         st.add(stlist[i]);
      }
      print(st.toString());

    });
  });

  CityCall().getCity().then((futurenativeresponse) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      list = futurenativeresponse;
      for (var i = 0; i < list.length; i++) {
        ct.add(list[i]);
        print(ct[i].toString());
      }
      print(ct.toString());

    });
  });



  runApp(

      MaterialApp(
          home: Mainpage(),
          routes: {
            '/signup': (context) => Signup(st,ct),
            '/step2': (context) => Steptwo(),
            '/login': (context) => Login(st,ct,nativeln),
            '/menu': (context) => Menu(),
            '/home': (context) => Home(),
            '/personalacd': (context) => Personalacademic(),
            '/parentsibling': (context) => Parentsibling(),
          }
      ),
 );
  FlutterNativeSplash.remove();
}



class Mainpage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children:<Widget>[
          TextButton(onPressed: (){

            Navigator.pushNamed(context,'/login');
          },
              child: Text('Click Me'),
            style:TextButton.styleFrom(
              primary:Colors.blue,
            ),),
            ],
          ),

      );



  }
}

/*void main() {
  runApp(const MyApp(
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/