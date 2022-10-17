import 'dart:io';

import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:learning_fitbit_mapp/Apiconstants.dart';
import 'package:learning_fitbit_mapp/Registration.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';
import 'package:learning_fitbit_mapp/Nativelang.dart';
import 'package:learning_fitbit_mapp/Nativecall.dart';
import 'package:learning_fitbit_mapp/Boards.dart';
import 'package:learning_fitbit_mapp/Boardcall.dart';
import 'package:learning_fitbit_mapp/Education.dart';
import 'package:learning_fitbit_mapp/Educationcall.dart';
import 'package:learning_fitbit_mapp/Interests.dart';
import 'package:learning_fitbit_mapp/Interestcall.dart';


import 'dart:async';
class Steptwo extends StatelessWidget {
 //List nativeln=List.empty(growable:true);
  var fulname;
  var dob;
  var email;
  var mob;
  var address;
  var state;
  var city;
  var pincode;
  var password;
  var confirmpassword;

  Steptwo({Key ?key,
    this.fulname,this.dob,this.email,this.mob,
    this.address,this.state,this.city,this.pincode,this.password,this.confirmpassword
}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(
          children:<Widget>[
            Text('Almost done ...',style:TextStyle(color:Colors.orange,
            fontSize:25.0),

      ),
            Padding(

              padding:EdgeInsets.all(40.0),
            ),
            Text('Step 2/2',style:TextStyle(
              color:Colors.orange,
              fontSize: 15.0,
            ),
            )
        ],
      ),
        backgroundColor: Colors.pink[50],
    ),
      body:Secondstep(fulname:fulname,dob: dob,email: email,mob: mob,address: address,state:this.state,city: city,pincode: pincode,password: password,confirmpassword: confirmpassword,),

    );
  }
}


class Secondstep extends StatefulWidget {

 var fulname;
  var dob;
  var email;
  var mob;
  var address;
  var state;
  var city;
  var pincode;
  var password;
  var confirmpassword;


   Secondstep({Key ?key,this.fulname,this.dob,this.email,this.mob,this.address,this.state,this.city,
  this.pincode,this.password,this.confirmpassword}):super(key: key);
  @override

  State<Secondstep> createState() => _SecondstepState();
}

final _formKey=GlobalKey<FormState>();
class _SecondstepState extends State<Secondstep> {

  @override
  //final nativeln = ['Marathi', 'Hindi'];
  var languages;

  //final educationbrd = ['SSC', 'CBSE', 'ICSE'];
  var boad;

  //final Clas = ['8th', '9th', '10th'];
 static var selection=[false,true,false,true,false,true,false];

  var clas;
  //bool isvideogame = true;
  //List nln=[];

  //List c=List.empty(growable:true);
  List<Map<dynamic,dynamic>>lnlist=List.empty(growable: true);
  List <Map<dynamic,dynamic>>bo= List.empty(growable: true);
  //List c=List.empty(growable:true);
  List<Map<dynamic,dynamic>>boardlist=List.empty(growable: true);
  List <Map<dynamic,dynamic>>ed= List.empty(growable: true);
  //List c=List.empty(growable:true);
  List<Map<dynamic,dynamic>> edlist=List.empty(growable: true);
  List<Map<dynamic,dynamic>>nativeln= List.empty(growable: true);
  List inr= List.empty(growable: true);
  //List c=List.empty(growable:true);
  List inlist=List.empty(growable: true);
  //List c=List.empty(growable:true);
 // List lnlist=List.empty(growable: true);



//bool isSpace=false;
  //bool isfootbal=false;
   //bool isswimming=false;
   //bool iscricket=false;
  //bool ischess=false;
  //bool isother=false;
  final noselectedinterests = [
    '+Video games',
    '+Space',
    '+Football',
    '+Swimming',
    '+Cricket',
    '+ Chess',
    '+ Other'
  ];
  final selectedinterests = [
    '-Video games',
    '-Space',
    '- Football',
    '- Swimming',
    '- Cricket',
    '- Chess',
    '- Other'
  ];

  List<Widget> cln = List<Widget>.empty(growable:true);
  static var j = 0;
  static var count = 0;
  static var n =0;
   static var l=0;
  static var x=0;
  static var cnt=0;
  static var c=0;
  static var d=0;
   static var vdo=0;
   static var spc=1;
   static var ftb=2;
   static var swm=3;
   static var crc=4;
   static var che=5;
   static var oth=6;
   static var change=0;
   static var a=0;
   static var b=0;
   static var e=0;
   static var f=0;
   static var g=0;
   static var p=0;
   static var q=0;
  static Map converted=Map();
    void Postdata()async{
      try {
        var url = Uri.https(Apiconstants.baseurl , Apiconstants.endpoints1);
        var response = await http.post(url, headers: <String, String>{
          HttpHeaders.contentTypeHeader: "application/json",


          HttpHeaders.userAgentHeader :"PostmanRuntime/7.29.2",
          HttpHeaders.acceptHeader:"*/*",
        HttpHeaders.acceptEncodingHeader:"gzip, deflate, br",
        HttpHeaders.connectionHeader:"keep-alive",
        },body: json.encode(converted),encoding:Encoding.getByName('utf-8'));
        while (response == Null) {
          print("Fetching results");
        }
        if (response.statusCode == 200) {
          print("Data sent successfully");
        }
        else {
          print("Something went wrong"+response.statusCode.toString()+response.body.toString());
        }
      }
      catch(e){
        print(e.toString());
      }

     }
  void initState() {
    // nln=widget.nativeln.toList();
    super.initState();
    late Future<List<Nativelang>> futurenativeresponse;
    late Future<List<Boards>> futureboardresponse;
    //late Future<List<States>> futurestateres;
    late Future<List<Education>> futureeduresponse;
    late Future<List<Interests>> futureintresponse;
    NativeCall().getLang().then((futurenativeresponse) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        lnlist = futurenativeresponse;
        for (var i = 0; i < lnlist.length; i++) {
          nativeln.add(lnlist[i]);
          print(nativeln[i].toString());
        }
        print(nativeln.toString());
      });
    });


    BoardCall().getBoard().then((futureboardresponse) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        boardlist = futureboardresponse;
        for (var i = 0; i < boardlist.length; i++) {
          bo.add(boardlist[i]);
          print(bo[i].toString());
        }
        print(bo.toString());
        setState(() {});
      });
    });
    EducationCall().getEdu().then((futureeduresponse) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        edlist = futureeduresponse;
        for (var i = 0; i < edlist.length; i++) {
          ed.add(edlist[i]);
          print(ed[i].toString());
        }
        print(ed.toString());
        setState(() {});
      });
    });
   /* InterestCall().getInte().then((futureintresponse) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        inlist = futureintresponse;
        for (var i = 0; i < inlist.length; i++) {
          inr.add(inlist[i]);
          print(inr[i].toString());
        }
        print(inr.toString());
        setState(() {});
      });
    });

    print(inr.toString());
    for (var i = 0; i < inr.length; i++) {
      cln.add(TextButton(
        onPressed: () {
          print(inr.toString);
        },
        child: Text(inr[i]['key'].toString()),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)),
      ),);
    }*/
  }









    //List list= futureresponse;
    //getvaluefuture().getvaluetolist();

    //  futureresponse=Statecall().getstates();
    //print(futureresponse);


    //  print(futurecity.runtimeType





  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();


    // ignore: unnecessary_new
    return Container(

      child: Scrollbar(
        isAlwaysShown: true,
        hoverThickness: 40.0,
        thickness: 15.0,
        child: Form(

          key: _formKey,
          child: ListView(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(20.0)),
                Text('* indicates required',
                  style: TextStyle(color: Colors.red, fontSize: 15.0),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Native Languages',
                    prefixText: '\*',
                    prefixStyle: TextStyle(color: Colors.red,
                        fontSize: 30.0),
                  ),
                  onChanged: (nl) {
                    setState(() {
                      languages = nl;
                    });
                  },
                  value: languages,
                  items:nativeln.map((nal){
                    return new DropdownMenuItem(child: Text(nal['value'].toString()),
                      value:nal['key'].toString());


                  }).toList()
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),

                ),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Education board',
                      prefixText: '\*',
                      prefixStyle: TextStyle(color: Colors.red,
                          fontSize: 30.0),
                    ),
                    onChanged: (brd) {
                      setState(() {
                         boad= brd;
                      });
                    },
                    value: boad,
                    items:bo.map((b){
                      return new DropdownMenuItem(child: Text(b['value'].toString()),
                          value:b['key']);


                    }).toList()
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Class",
                      prefixText: '\*',
                      prefixStyle: TextStyle(color: Colors.red,
                          fontSize: 30.0),
                    ),
                    onChanged: (cls) {
                      setState(() {
                        clas = cls;
                      });
                    },
                    value: clas,
                    items: ed.map((c){
                      return new
                        DropdownMenuItem(
                            child: Text(c['value'].toString()),
                          value: c['key'].toString());}).toList()),

                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                Container(
                  padding: EdgeInsets.all(9.0),
                  alignment: Alignment.topLeft,
                  child: Text('Interests',
                    style: TextStyle(
                      fontSize: 20.0,


                    ),
                    textAlign: TextAlign.left,),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0)

                   ),

                /*for(var i=0;i<cln.length;i++)
                   // Column(
                      children:<Widget>[

                        cln[i],
                      ],
                    ),*/





                /*if(x<inr.length)
                      if(l<inr.length)

                            if(j<inr.length)

                                    for(var i = 0; i < 3; i++)




                                          Container
                                            (
                                            child: Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                ),


                                                //selectedinterests[j]=='-Video games' ?

                                                //Padding(padding: EdgeInsets.all(8.0)),


                                                    for(var k = 0; k < 3; j++, k++)
                                                      if(j<inr.length)


                                                      TextButton(

                                                        onPressed:() {

                                                          print('Clicked');
                                                          if(change==0){

                                                           setState((){
                                                             selection[j]=!selection[j];
                                                             change=change+1;
                                                           });

                                                          }




                                                              },


                                                            //status[j] = !status[j]
                                                           // print('1 Change'):
                                                               // status[j]=!status[j]
                                                            //print('2 Change');




                                                        child: inr[j],
                                                        style: selection[j]  ? ButtonStyle(
                                                            foregroundColor: MaterialStateProperty
                                                                .all<Color>(Colors.white),
                                                            backgroundColor: MaterialStateProperty
                                                                .all<Color>(Colors.orange),
                                                            shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .circular(15.0),
                                                              ),
                                                            )
                                                        ) :
                                                        ButtonStyle(
                                                            foregroundColor: MaterialStateProperty
                                                                .all<Color>(Colors.black),
                                                            backgroundColor: MaterialStateProperty
                                                                .all<Color>(Colors.grey),
                                                            shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .circular(15.0),
                                                              ),
                                                            )
                                                        ),

                                                      ),
                                                         ],
                                            ),
                                          )

                            else if(n<inr.length)
                                      for(var i = 0; i < 3; i++)




                                        Container
                                          (
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                              ),


                                              //selectedinterests[j]=='-Video games' ?

                                              //Padding(padding: EdgeInsets.all(8.0)),



                                              for(var k = 0; k < 3; n++, k++)
                                                if(n<inr.length)


                                                  TextButton(

                                                    onPressed: () {

                                                        print('Clicked 1');
                                                        if(change==1)
                                                          {
                                                            setState(() {
                                                              selection[n] =
                                                              !selection[n];
                                                              change=change+1;
                                                            });
                                                            //print(selection[l].toString()+noselectedinterests[l]+selectedinterests[l]);

                                                          }


                                                        },
                                                    child: inr[n],
                                                    style: selection[n]?
                                                    ButtonStyle(
                                                        foregroundColor: MaterialStateProperty
                                                            .all<Color>(Colors.white),
                                                        backgroundColor: MaterialStateProperty
                                                            .all<Color>(Colors.orange),
                                                        shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(15.0),
                                                          ),
                                                        )
                                                    ) :
                                                    ButtonStyle(
                                                        foregroundColor: MaterialStateProperty
                                                            .all<Color>(Colors.black),
                                                        backgroundColor: MaterialStateProperty
                                                            .all<Color>(Colors.grey),
                                                        shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(15.0),
                                                          ),
                                                        )
                                                    ),)





                                            ],
                                          ),
                                   )
                            else
                              for(var i = 0; i < 3; i++)




                                Container
                                  (
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                      ),


                                      //selectedinterests[j]=='-Video games' ?

                                      //Padding(padding: EdgeInsets.all(8.0)),



                                      for(var k = 0; k < 3; l++, k++)
                                        if(l<inr.length)

                                          TextButton(

                                            onPressed: () {
                                              print('Clicked 2');
                                              if(change==2){
                                                setState((){
                                                  selection[l]=!selection[l];
                                                  change=change+1;

                                                });
                                              }

                                             // print(selection[c].toString()+selectedinterests[c]+noselectedinterests[c]);

                                            },
                                            child:inr[l],
                                            style:  selection[l]  ? ButtonStyle(
                                                foregroundColor: MaterialStateProperty
                                                    .all<Color>(Colors.white),
                                                backgroundColor: MaterialStateProperty
                                                    .all<Color>(Colors.orange),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(15.0),
                                                  ),
                                                )
                                            ) :
                                            ButtonStyle(
                                                foregroundColor: MaterialStateProperty
                                                    .all<Color>(Colors.black),
                                                backgroundColor: MaterialStateProperty
                                                    .all<Color>(Colors.grey),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(15.0),
                                                  ),
                                                )
                                            ),)





                                    ],
                                  ),
                                )
                else         if(x<inr.length)
                                if(c<inr.length)

                                         for(var i = 0; i < 3; i++)




                                                          Container
                                                          (
                                                          child: Row(
                                                          children: <Widget>[
                                                          Padding(
                                                          padding: EdgeInsets.all(5.0),
                                                          ),


                                                          //selectedinterests[j]=='-Video games' ?

                                                          //Padding(padding: EdgeInsets.all(8.0)),


                                                          for(var k = 0; k < 3; c++, k++)
                                                          if(c<selectedinterests.length)

                                                          TextButton(

                                                          onPressed: () {
                                                          print('Clicked 3');
                                                          if(change==3){
                                                            setState((){
                                                              selection[c]=!selection[c];
                                                              change=change+1;
                                                            });
                                                          }

                                                         // print(selection[d].toString()+selectedinterests[d]+noselectedinterests[d]);
                                                          },
                                                          child: inr[c],
                                                          style: selection[c] ? ButtonStyle(
                                                          foregroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.white),
                                                          backgroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.orange),
                                                          shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(15.0),
                                                          ),
                                                          )
                                                          ) :
                                                          ButtonStyle(
                                                          foregroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.black),
                                                          backgroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.grey),
                                                          shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(15.0),
                                                          ),
                                                          )
                                                          ),),







                                                          ],
                                                          ),
                                                          )
                                                          else if(d<inr.length)
                                                          for(var i = 0; i < 3; i++)




                                                          Container
                                                          (
                                                          child: Row(
                                                          children: <Widget>[
                                                          Padding(
                                                          padding: EdgeInsets.all(5.0),
                                                          ),


                                                          //selectedinterests[j]=='-Video games' ?

                                                          //Padding(padding: EdgeInsets.all(8.0)),



                                                          for(var k = 0; k < 3; d++, k++)
                                                          if(d<inr.length)

                                                          TextButton(

                                                          onPressed: () {
                                                          print('Clicked 4');
                                                          if(change==4){
                                                            setState((){
                                                              selection[d]=!selection[d];
                                                              change=change+1;
                                                            });
                                                          }

                                                          //print(selection[x].toString()+selectedinterests[x]+noselectedinterests[x]);
                                                          },
                                                          child:inr[d],
                                                          style: selection[d] ? ButtonStyle(
                                                          foregroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.white),
                                                          backgroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.orange),
                                                          shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(15.0),
                                                          ),
                                                          )
                                                          ) :
                                                          ButtonStyle(
                                                          foregroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.black),
                                                          backgroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.grey),
                                                          shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(15.0),
                                                          ),
                                                          )
                                                          ),)





                                                          ],
                                                          ),
                                                          )
                                                          else
                                                          for(var i = 0; i < 3; i++)




                                                          Container
                                                          (
                                                          child: Row(
                                                          children: <Widget>[
                                                          Padding(
                                                          padding: EdgeInsets.all(5.0),
                                                          ),


                                                          //selectedinterests[j]=='-Video games' ?

                                                          //Padding(padding: EdgeInsets.all(8.0)),



                                                          for(var k = 0; k < 3; x++, k++)
                                                          if(x<inr.length)

                                                          TextButton(

                                                          onPressed: () {


                                                          print('Clicked 5');
                                                          if(change==5){
                                                            setState((){
                                                              selection[x]=!selection[x];
                                                              change=change+1;
                                                            });
                                                          }

                                                          },
                                                          child: inr[x],
                                                          style: selection[x] ? ButtonStyle(
                                                          foregroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.white),
                                                          backgroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.orange),
                                                          shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(15.0),
                                                          ),
                                                          )
                                                          ) :
                                                          ButtonStyle(
                                                          foregroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.black),
                                                          backgroundColor: MaterialStateProperty
                                                              .all<Color>(Colors.grey),
                                                          shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(15.0),
                                                          ),
                                                          )
                                                          ),),






                                                          ]
                                                          ),
                                                          )
                        else
                          TextButton(
                            onPressed:(){
                              if(change==6){
                                setState((){
                                  selection[change]=!selection[change];
                                  change=change+1;
                                });
                              }

                            },
                            child: inr[change],
                             style: selection[change] ? ButtonStyle(
                               foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                               backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                               shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                 RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(15.0),
                                 ),
                               )
                             ):
                             ButtonStyle(
                                 foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                 backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                 shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                   RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(15.0),
                                   ),
                                 )
                             ),
                          )

            else
               if(a<inr.length)

                  if(b<inr.length)

                    for(var i = 0; i < 3; i++)




                      Container
                        (
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5.0),
                            ),


                            //selectedinterests[j]=='-Video games' ?

                            //Padding(padding: EdgeInsets.all(8.0)),


                            for(var k = 0; k < 3; b++, k++)
                              if(b<inr.length)


                                TextButton(

                                  onPressed:() {

                                    print('Clicked');
                                    if(change==7){

                                      setState((){
                                        selection[b]=!selection[b];
                                        change=change+1;
                                      });

                                    }




                                  },


                                  //status[j] = !status[j]
                                  // print('1 Change'):
                                  // status[j]=!status[j]
                                  //print('2 Change');




                                  child: inr[b],
                                  style: selection[b]  ? ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.orange),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(15.0),
                                        ),
                                      )
                                  ) :
                                  ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.black),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.grey),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(15.0),
                                        ),
                                      )
                                  ),

                                ),
                          ],
                        ),
                      )

                  else if(e<inr.length)
                    for(var i = 0; i < 3; i++)




                      Container
                        (
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5.0),
                            ),


                            //selectedinterests[j]=='-Video games' ?

                            //Padding(padding: EdgeInsets.all(8.0)),



                            for(var k = 0; k < 3; e++, k++)
                              if(e<inr.length)


                                TextButton(

                                  onPressed: () {

                                    print('Clicked 1');
                                    if(change==8)
                                    {
                                      setState(() {
                                        selection[e] =
                                        !selection[e];
                                        change=change+1;
                                      });
                                      //print(selection[l].toString()+noselectedinterests[l]+selectedinterests[l]);

                                    }


                                  },
                                  child: inr[e],
                                  style: selection[e]?
                                  ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.orange),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(15.0),
                                        ),
                                      )
                                  ) :
                                  ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.black),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.grey),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(15.0),
                                        ),
                                      )
                                  ),)





                          ],
                        ),
                      )
                  else
                    for(var i = 0; i < 3; i++)




                      Container
                        (
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5.0),
                            ),


                            //selectedinterests[j]=='-Video games' ?

                            //Padding(padding: EdgeInsets.all(8.0)),



                            for(var k = 0; k < 3; a++, k++)
                              if(a<inr.length)

                                TextButton(

                                  onPressed: () {
                                    print('Clicked 2');
                                    if(change==9){
                                      setState((){
                                        selection[a]=!selection[a];
                                        change=change+1;

                                      });
                                    }

                                    // print(selection[c].toString()+selectedinterests[c]+noselectedinterests[c]);

                                  },
                                  child: inr[a],
                                  style:  selection[a]  ? ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.orange),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(15.0),
                                        ),
                                      )
                                  ) :
                                  ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.black),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.grey),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(15.0),
                                        ),
                                      )
                                  ),)





                          ],
                        ),
                      )
                else
                  if(f<inr.length)

                    for(var i = 0; i < 3; i++)




                      Container
                        (
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5.0),
                            ),


                            //selectedinterests[j]=='-Video games' ?

                            //Padding(padding: EdgeInsets.all(8.0)),


                            for(var k = 0; k < 3; f++, k++)
                              if(f<inr.length)

                                TextButton(

                                  onPressed: () {
                                    print('Clicked 3');
                                    if(change==10){
                                      setState((){
                                        selection[f]=!selection[f];
                                        change=change+1;
                                      });
                                    }

                                    // print(selection[d].toString()+selectedinterests[d]+noselectedinterests[d]);
                                  },
                                  child: inr[f],
                                  style: selection[f] ? ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.orange),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(15.0),
                                        ),
                                      )
                                  ) :
                                  ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.black),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.grey),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(15.0),
                                        ),
                                      )
                                  ),),







                          ],
                        ),
                      )
                  else if(g<inr.length)
                    for(var i = 0; i < 3; i++)




                      Container
                        (
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5.0),
                            ),


                            //selectedinterests[j]=='-Video games' ?

                            //Padding(padding: EdgeInsets.all(8.0)),



                            for(var k = 0; k < 3; g++, k++)
                              if(g<inr.length)

                                TextButton(

                                  onPressed: () {
                                    print('Clicked 4');
                                    if(change==11){
                                      setState((){
                                        selection[g]=!selection[g];
                                        change=change+1;
                                      });
                                    }

                                    //print(selection[x].toString()+selectedinterests[x]+noselectedinterests[x]);
                                  },
                                  child:inr[g],
                                  style: selection[g] ? ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.orange),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(15.0),
                                        ),
                                      )
                                  ) :
                                  ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.black),
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Colors.grey),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(15.0),
                                        ),
                                      )
                                  ),)





                          ],
                        ),
                      )
                  else
                    for(var i = 0; i < 3; i++)




                      Container
                        (
                        child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(5.0),
                              ),


                              //selectedinterests[j]=='-Video games' ?

                              //Padding(padding: EdgeInsets.all(8.0)),



                              for(var k = 0; k < 3; p++, k++)
                                if(p<inr.length)

                                  TextButton(

                                    onPressed: () {


                                      print('Clicked 5');
                                      if(change==12){
                                        setState((){
                                          selection[p]=!selection[p];
                                          change=change+1;
                                        });
                                      }

                                    },
                                    child: inr[p],
                                    style: selection[p]
                                     ? ButtonStyle(
                                        foregroundColor: MaterialStateProperty
                                            .all<Color>(Colors.white),
                                        backgroundColor: MaterialStateProperty
                                            .all<Color>(Colors.orange),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius
                                                .circular(15.0),
                                          ),
                                        )
                                    ) :
                                    ButtonStyle(
                                        foregroundColor: MaterialStateProperty
                                            .all<Color>(Colors.black),
                                        backgroundColor: MaterialStateProperty
                                            .all<Color>(Colors.grey),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius
                                                .circular(15.0),
                                          ),
                                        )
                                    ),),






                            ]
                        ),
                      ),
*/























                /* Container(
                      child:Row(
                        children:<Widget>[
                          Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          isvideogame?
                          TextButton(
                              child:Text('- Video games'),

                              style:ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              onPressed: (){
                                setState((){
                                  isvideogame=!isvideogame;
                                });
                              } ):
                          TextButton(

                              child:Text('+ Video games'),

                              style:ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                                shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              onPressed: (){
                                setState((){
                                  isvideogame=!isvideogame;
                                });
                              } ),


                          Padding(
                            padding:EdgeInsets.all(4.0),
                          ),
                          isSpace?
                          TextButton(
                              child:Text('- Space'),
                              style:ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              onPressed: (){
                                setState((){
                                  isSpace=!isSpace;
                                });
                              }):
                          TextButton(
                              child:Text('+ Space'),
                              style:ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                                shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              onPressed: (){
                                setState((){
                                  isSpace=!isSpace;
                                });
                              }),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                          ),
                          isfootbal?
                          TextButton(
                            child:Text('- Football'),
                            style:ButtonStyle(
                              foregroundColor:MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            onPressed: (){
                              setState((){
                                isfootbal=!isfootbal;
                              });
                            },
                          ):TextButton(
                            child:Text('+ Football'),
                            style:ButtonStyle(
                              foregroundColor:MaterialStateProperty.all<Color>(Colors.black),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            onPressed: (){
                              setState((){
                                isfootbal=!isfootbal;
                              });
                            },
                          ),

                        ],
                      )
                  ),
                  Padding(
                    padding:EdgeInsets.all(8.0),
                  ),
                  Container(
                    child:Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5.0)),
                        isswimming?
                        TextButton(
                            child:Text('- Swimming'),
                            style:ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),


                              ),
                            ),
                            onPressed: (){
                              setState((){
                                isswimming=!isswimming;
                              });
                            }):
                        TextButton(
                            child:Text('+ Swimming'),
                            style:ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),


                              ),
                            ),
                            onPressed: (){
                              setState((){
                                isswimming=!isswimming;
                              });
                            }),

                        Padding(padding:EdgeInsets.all(8.0)),
                        iscricket?
                        TextButton(
                            child:Text(
                                '- Cricket'
                            ),
                            style:ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                )
                            ),
                            onPressed: (){
                              setState((){
                                iscricket=!iscricket;
                              });
                            } ):
                            TextButton(
                                child: Text('+ Cricket'),
                                style:ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  )
                                ),
                              onPressed: (){
                                  setState((){
                                    iscricket=!iscricket;
                                  });
                              },
                            ),
                        Padding(
                          padding:EdgeInsets.all(8.0),
                        ),
                        ischess?
                        TextButton(
                            child:Text('- Chess'),
                            style:ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                )
                            ),onPressed: (){
                          setState((){
                            ischess=!ischess;
                          });
                        }):
                        TextButton(
                            child:Text('+ Chess'),
                            style:ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                )
                            ),onPressed: (){
                          setState((){
                            ischess=!ischess;
                          });
                        })
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Container(
                      child:Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(5.0),),
                          isother?
                          TextButton(
                              child:Text('- Other'),
                              style:ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0)
                                      )
                                  )

                              ),
                              onPressed: (){
                                setState((){
                                  isother=!isother;
                                });
                              }):
                              TextButton(
                                  child: Text('+ Other'),
                                  style:ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                                    shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),


                                    ),


                              ),
                                onPressed: (){
                                    setState((){
                                      isother=!isother;
                                    });
                                },



                        ],
                      )
                  ),*/
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Text('You can always change these later',
                    style: TextStyle(color: Colors.grey)),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Container(
                    width: 400.0,
                    child: TextButton(
                      child: Text('Signup'),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<
                            Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<
                            Color>(Colors.orange),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        print('Signed up');
                      print('\n'+ widget.fulname);
                        print('\n'+widget.dob);
                        print('\n'+ widget.email);
                        print('\n'+ widget.mob);
                        print('\n'+ widget.address);
                        print('\n'+ widget.state.toString());
                        print('\n'+ widget.city.toString());
                        print('\n'+ widget.pincode);
                        print('\n'+ widget.password);
                        print('\n'+ widget.confirmpassword);
                        print('\n'+ languages.toString());
                        print('\n'+ boad.toString());
                        print('\n'+ clas.toString());
                        print("=========");
                         var reg=Register(userid: 0.toString(),providerid: 1002.toString(),username: widget.email.toString(),passcode: widget.password.toString(),fullname: widget.fulname.toString(),fathername:"".toString(),fathermobile:"".toString(),fatheremail: "".toString(),fatherprofession: "".toString(),address: widget.address.toString(),state:widget.state.toString(),city:widget.city.toString(),pincode: widget.pincode.toString(),mobile: widget.mob.toString(),email: widget.email.toString(),dob: widget.dob.toString(),profilepicture: "".toString(),isactive: "true",createdby: widget.fulname.toString(),createddate: DateTime.now().toString(),updatedby: widget.fulname.toString(),updateddate:DateTime.now().toString(),topics: "".toString(),usertypeid: 4.toString(),educationid: 0.toString(),language:languages.toString(),board: boad.toString(),cls: clas.toString(),siblingdetailslist:[].toString(),interestlist: [1,3,4].toString());
                        Register save=  reg.getvalues();
                        var converted=save.tojson();
                        print(converted.toString());
                          Postdata();

                        }

                       /* print("===========");
                        print('\n'+save.userid.toString());
                        print('\n'+save.providerid.toString());
                        print('\n'+save.username.toString());
                        print('\n'+save.passcode.toString());
                        print('\n'+save.fullname.toString());
                        print('\n'+save.fathername.toString());
                        print('\n'+save.fathermobile.toString());
                        print('\n'+save.fatheremail.toString());
                        print('\n'+save.fatherprofession.toString());
                        print('\n'+save.address.toString());
                        print('\n'+save.state.toString());
                        print('\n'+save.city.toString());
                        print('\n'+save.pincode.toString());
                        print('\n'+save.mobile.toString());
                        print('\n'+save.email.toString());
                        print('\n'+save.dob.toString());
                        print('\n'+save.profilepicture.toString());
                        print('\n'+save.isactive.toString());
                        print('\n'+save.createdby.toString());
                        print('\n'+save.createddate.toString());
                        print('\n'+save.updatedby.toString());
                        print('\n'+save.updateddate.toString());
                        print('\n'+save.topics.toString());
                        print('\n'+save.usertypeid.toString());
                        print('\n'+save.educationid.toString());
                        print('\n'+save.language.toString());
                        print('\n'+save.board.toString());
                        print('\n'+save.cls.toString());
                        print('\n'+save.siblingdetailslist.toString());
                        print('\n'+save.interestlist.toString());*/


                    )
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Column(
                    children: <Widget>[
                      Text('Have an account?'),
                      Text('Login', style: TextStyle(
                        color: Colors.orange,
                      )
                      )
                    ]
                )

              ]
          ),


        ),
      ),
    );
  }
}


/*class videogame {
    bool showvideogame=true;


   void setvideo(bool value)
   {

           showvideogame=!value;


   }

  bool getvideo()
  {
    return showvideogame;
  }
}*/

/*class Controller{

  var id;
  var status;
  Controller({this.id,});
  Widget  gettextbutton (bool isvideogame){
    status=true;
    Widget widget;
      print(isvideogame.toString());
      return new TextButton(
          onPressed:(){
            status=!status;

            gettextbutton(status);
          },
          child: isvideogame ? Text('- Video game'):Text('+Video game'),
            style: ButtonStyle(
              foregroundColor: isvideogame ? MaterialStateProperty.all<Color>(Colors.white): MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: isvideogame ? MaterialStateProperty.all<Color>(Colors.orange):MaterialStateProperty.all<Color>(Colors.grey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              )
            ),);

    }



  bool  getstatus(){
        return status;
  }
}*/

//class temporary{


  //
//}
