
// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
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
import 'package:learning_fitbit_mapp/Steptwo.dart';
import 'dart:async';

class Signup extends StatelessWidget {
  List<Map<dynamic,dynamic>> st=List.empty(growable: true);
  List<Map<dynamic,dynamic>> ct=List.empty(growable:true);
  //List nativeln=List.empty(growable:true);
   Signup(this.st,this.ct,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Signup',
                style:TextStyle(
                  color:Colors.orangeAccent,
                  fontSize: 30.0,
                )),
            Padding(
              padding:EdgeInsets.all(80.0),
            ),
            Text('Step 1/2',
                style:TextStyle(
                  color:Colors.orangeAccent,
                  fontSize: 15.0,
                ))
          ],
        ),
        backgroundColor: Colors.pink[50],
      ),
      body: new Signupform(st,ct),
    );
  }
}

/*class Signup extends StatefulWidget {
  List st=List.empty(growable: true);

  Signup(this.st,{Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Signup',
                style:TextStyle(
                  color:Colors.orangeAccent,
                  fontSize: 30.0,
                )),
            Padding(
              padding:EdgeInsets.all(80.0),
            ),
            Text('Step 1/2',
                style:TextStyle(
                  color:Colors.orangeAccent,
                  fontSize: 15.0,
                ))
          ],
        ),
        backgroundColor: Colors.pink[50],
      ),
      body: new Signupform(widget.st),
    );
  }
}
*/

class Signupform extends StatefulWidget {
List<Map<dynamic,dynamic>> st;
List<Map<dynamic,dynamic>>ct;

   Signupform(this.st,this.ct,{Key? key}) : super(key: key);

  @override
  State<Signupform> createState() => _SignupformState();
}
final _formkey=GlobalKey<FormState>();
class _SignupformState extends State<Signupform> {
  late Future<http.Response> futurepost;
  final fulname = TextEditingController();
  final dateinput = TextEditingController();
  final email = TextEditingController();
  final mobno = TextEditingController();
  final address = TextEditingController();
  final state = TextEditingController();
  final citycon = TextEditingController();
  final pincode = TextEditingController();
  final password = TextEditingController();
  final conpassword = TextEditingController();

  bool passwordvisible = false;
  bool confirmpasswordvisible = false;
  //var items = ['Maharashtra', 'gujrat'];

//var c=['Pune','Gujrat'];

//late Future value;
   var selectedValue;
  var city;

  var response;

  //List ct=List.empty(growable: true);
  //List list=List.empty(growable:true);







  /* void getresponse(var futureresponse) async {
   .toString());
    //print(futureresponse);

  }
*/
  /*Future<List<dynamic>> getlist(futureresponse)async{
    var m = 0;
    do {
      if (futureresponse[m].isdefault == "true")  {
        city = await futureresponse[m].valuestring;
        break;
      }
      else {
        m = m + 1;
      }
    } while (m < 13);
    for (var i = 0; i < futureresponse.length; i++) {
      cities.add(futureresponse[i].valueString.toString());
      print(cities[i]);
      //  if(list[i].isdefault){
      //  city=cities[i];
      // }

    }
    print(cities);
    return Future(() => cities);


  }

*/
  List<Map<dynamic,dynamic>>stt=[];
  List<Map<dynamic,dynamic>> ctt=[];
  List<dynamic> natln=[];


  void initState() {
    super.initState();
    stt=widget.st;
    ctt=widget.ct;


  }





  // final cities=['Pune','Mumbai'];

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();


    return new Container(
        child: Scrollbar
          (
          isAlwaysShown: true,
          hoverThickness: 40.0,
          thickness: 15.0,
          controller: controller,

          child:
          Form(
            key: _formkey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Text('* indicates required', style: TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                ),),
                Padding(padding: EdgeInsets.all(12.0)),
                Container(
                    height: 33.0,
                    width: 200,
                    child: TextField(
                      controller: fulname,
                      decoration: const InputDecoration(
                          hintText: 'Full Name',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(1.0),

                          prefixText: '\*',
                          prefixStyle: TextStyle(color: Colors.red,
                            fontSize: 30.0,
                          )


                      ),


                    )
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Container(
                    height: 33.0,
                    width: 200,
                    child: TextField(
                        controller: dateinput,

                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(1.0),
                          hintText: 'Date of Birth',
                          suffixIcon: Icon(Icons.calendar_today),

                          prefixText: '\*',
                          prefixStyle: TextStyle(
                              color: Colors.red, fontSize: 30.0),

                        ),
                        onTap: () async
                        {
                          var setdate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),);
                          if (setdate != null) {
                            String dateformat = DateFormat('yyyy-MM-dd').format(
                                setdate);
                            setState(() {
                              dateinput.text = dateformat;
                            });
                          }
                          else {
                            setState(() {
                              dateinput.text = 'Date is not selected';
                            });
                          }
                        }

                    )
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Container(
                    height: 33.0,
                    width: 200,
                    child: TextField(
                      controller: email,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5.0),
                          hintText: 'Email ID',
                          prefixText: '\*',
                          prefixStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                          )
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Container(
                    height: 33.0,
                    width: 200,
                    child: TextField(
                      controller: mobno,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5.0),
                          hintText: 'Mobile Number',
                          prefixText: '\*',
                          prefixStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                          )
                      ),

                    )
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Container(
                  height: 33.0,
                  width: 200.0,
                  child: TextField(
                    controller: address,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(5.0),
                        hintText: 'Address'
                    ),

                  ),
                ),
                Padding(padding: EdgeInsets.all(8.0)),

                DropdownButtonFormField(

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'States',

                  ),


                  onChanged: (changedvalue) {
                    setState(() {
                      selectedValue=changedvalue;                    });
                  },
                  value:selectedValue,
                  items: stt.map((ci){
                    {
                      print(ci.toString());
                      return DropdownMenuItem(
                          child: Text(ci['value'].toString()),
                          value:ci['key']);
                    }
                  }


                  ).toList(),
                ),
                Padding(padding: EdgeInsets.all(8.0)),

                DropdownButtonFormField(

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Cities',

                  ),


                  onChanged: (cityvalue) {
                    setState(() {
                      city =cityvalue;
                    });
                  },
                  value: city,
                  items: ctt.map((ci) {
                    print(ci.toString());
                    return DropdownMenuItem(
                        child: Text(ci['value'].toString()),
                        value: ci['key'].toString());
                  }

                  ).toList(),
                ),


                Padding(
                  padding: EdgeInsets.all(8.0),
                ),

                Padding(padding: EdgeInsets.all(8.0)),
                Container(
                    height: 33.0,
                    width: 200.0,
                    child: TextField(
                      controller: pincode,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(5.0),
                        hintText: 'Pincode',
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),

                ),
                Container(
                    height: 33.0,
                    width: 200.0,
                    child: passwordvisible ? TextField(
                      controller: password,
                      onTap: () {
                        setState(() {
                          passwordvisible = !passwordvisible;
                        });
                      },
                      obscureText: !passwordvisible,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5.0),
                          hintText: 'Password',
                          prefixText: '\*',

                          prefixStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                          ),

                          suffixIcon: Icon(Icons.visibility)

                      ),

                    ) : TextField(
                      controller: password,
                      obscureText: !passwordvisible,
                      onTap: () {
                        setState(() {
                          passwordvisible = !passwordvisible;
                        });
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5.0),
                          hintText: 'Password',
                          prefixText: '\*',

                          prefixStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                          ),

                          suffixIcon: Icon(Icons.visibility_off)

                      ),

                    )

                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),

                Container(
                    height: 33.0,
                    width: 200.0,
                    child: confirmpasswordvisible ? TextField(
                        onTap: () {
                          setState(() {
                            confirmpasswordvisible = !confirmpasswordvisible;
                          });
                        },
                        obscureText: !confirmpasswordvisible,
                        controller: conpassword,

                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(5.0),
                            hintText: 'Confirm Password',
                            suffixIcon: Icon(Icons.visibility)
                        )

                    ) :
                    TextField(
                        onTap: () {
                          setState(() {
                            confirmpasswordvisible = !confirmpasswordvisible;
                          });
                        },
                        obscureText: !confirmpasswordvisible,
                        controller: conpassword,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(5.0),
                            hintText: 'Confirm Password',
                            suffixIcon: Icon(Icons.visibility_off)
                        )

                    )
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Container(
                    height: 33.0,
                    width: 200.0,
                    color: Colors.orange,
                    child: TextButton(
                      child: Text('Next Step',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          )
                      ),
                      onPressed: () {
                        //Citycall().printresponse(futureresponse);
                          //Navigator.pushNamed(context, '/step2');
                          Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(settings:const RouteSettings(name:'/steptwo'),
                              builder: (context)=>new  Steptwo(fulname: fulname.text,dob:dateinput.text,
                              email: email.text,mob:mobno.text,address:address.text,state:selectedValue.toString(),city:city.toString(),pincode:pincode.text,password:password.text,confirmpassword:conpassword.text))
                        );
                                             // Registration(fulname: fulname.text,dob: dateinput.text,emailid: email.text,mobno: mobno.text,address: address.text,state: ,city:,pincode: pincode.text,passcode: password.text);
                       /* futurepost = Registration().Postdata(
                            fulname.text,
                            dateinput.text,
                            email.text,
                            mobno.text,
                            address.text,
                            selectedValue.toString(),
                            city.toString(),
                            pincode.text,
                            password.text);
                        print(futurepost.toString());*/
                      }
                    ),
                ),
                Container(
                    alignment: Alignment.center,


                    child:
                    Column(

                      children: <Widget>[

                        Column(
                          children: <Widget>[
                            Text('Have an account?'),
                            Text('Login', style: TextStyle(
                                color: Colors.deepOrange)),
                          ],
                        ),
                      ],
                    )
                ),


              ],

            ),
          ),
        ),


      );
    }

  }

 // class getvaluefuture{

  //void getvaluetolist()async {


  //}
