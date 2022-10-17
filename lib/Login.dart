import "package:flutter/material.dart";

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
import 'dart:async';

class Login extends StatefulWidget {
  List <Map<dynamic,dynamic>>st=List.empty(growable: true);
  List<Map<dynamic,dynamic>> ct=List.empty(growable: true);
  List nativeln=List.empty(growable:true);
   Login(this.st,this.ct,this.nativeln,{Key? key}) : super(key: key);

  @override
  //List st=List.empty(growable: true);




    State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  late Future <Result>  futureresult;
  //List st=List.empty(growable: true);
  void initState(){

    //List stlist=List.empty(growable: true);
  }

  final usernamecontroller=TextEditingController();
  final passcodecontroller=TextEditingController();
  Widget build(BuildContext context) {
    final ScrollController controller=ScrollController();
    return Scaffold(
      body :
      new Container(
        child : Scrollbar(
            isAlwaysShown: true,
            hoverThickness: 40.0,
            thickness: 15.0,
            controller: controller,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(15.0)),
                Image.asset('assets/Images/Login image.png',
                  height:269.0,
                  width:500.0,
                ),
                Padding(padding:EdgeInsets.fromLTRB(0.0,15.0,15.0,15.0)),
                Text('Login',
                    textAlign:TextAlign.left,
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                      color:Colors.orange,



                    )),
                Padding(padding:EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0)),
                Container(
                  height:48.0,
                  width:344.0,
                  child:TextField(
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: 'Email ID'
                      )),

                ),
                Padding(padding:EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0)),
                Container(
                  height:48.0,
                  width:344.0,
                  child:TextField(
                    controller:passcodecontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(239.0, 10.0, 2, 10.0)),
                Text('Forgot password ?',  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[5],
                  ),),
                Padding(padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0)),
                Container(
                  height: 48.0,
                  width: 345.0,
                  child: TextButton(
                      child: Text('Login',style: TextStyle(fontSize: 18.0),),
                      onPressed:(){//async {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>);
                           Navigator.pushNamed(context, '/home');
                      // await Apiservice(username: usernamecontroller.text.toString(),password: passcodecontroller.text.toString());

                       // print("Username:-"+usernamecontroller.text);
                        //print("Password:-"+passcodecontroller.text);
                        //print(futureresult.toString());

                         // var response=await http.get(Uri.parse(Apiconstants.baseurl));
                          //print(response.statusCode);
                         // setState((){

                              //Apiservice().fetchResult();


                         //});                          //print(response.body);
                        //print(futureresult.toString());
                      },
                      style:ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                        shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Container(
                  height: 48.0,
                  width: 345.0,
                  child: TextButton(child: Text('Signup',style: TextStyle(fontSize: 18.0),),
                      onPressed: (){
                       // Navigator.pushNamed(context, '/signup');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup(widget.st,widget.ct

                        )),);
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),


                      )),
                ),
              ],
            )
        ),

      ),
    );
  }
  }






