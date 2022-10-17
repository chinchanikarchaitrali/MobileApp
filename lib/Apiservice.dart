
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:learning_fitbit_mapp/Apiconstants.dart';
import 'package:learning_fitbit_mapp/Result.dart';

class Apiservice{
var username;
var password;
Apiservice({this.username,this.password});

  void fetchResult() async{

   var  queryparams={
      "username":username,
     "passcode":password
    };
    try{
     //print('In try block');

    //  print(url.toString());

      var url=Uri.https(Apiconstants.baseurl, Apiconstants.endpoints);
      var response= await http.post(url,headers: <String,String>{HttpHeaders.contentTypeHeader:"application/json"},body: jsonEncode({"userName": username, "password":password}));

      if(response.statusCode==200) {
       // print(response.statusCode);
     //   return response.body;
        print(response.statusCode);
        print(response.body);
       // Result result=Result.fromJson(jsonDecode(response.body));
        //return result;
      }
      else{
        print(response.statusCode);
        print(response.body);
        //return new Result();
       // print(response.statusCode);
      }

      //return response.body;
        //
         // return result;


      //    return response.statusCode;


    }
    catch(e)
    {

      print(e.toString());
      //return new Result();


    }
  }
}