import 'package:http/http.dart' as http;
import 'package:learning_fitbit_mapp/Apiconstants.dart';
import 'package:learning_fitbit_mapp/Nativelang.dart';
import 'package:learning_fitbit_mapp/States.dart';
import 'dart:developer';
import 'dart:convert';
import'dart:io';
import 'dart:async';

class NativeCall{
  static List<Map<String,dynamic>>language= List.empty(growable: true);
  var response;
  Future<List<Map<String,dynamic>>> getLang() async {
    var location = Uri.http(Apiconstants.baseurl, Apiconstants.nativelang);
    response =
    await http.get(location, headers: {HttpHeaders.contentTypeHeader: 'Jsonp'});
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        // print(response.body);
        // displaycities(response);
        Nativelang.fromJson(json.decode(response.body));
        language= Nativelang().getlist();
        for (var j = 0; j < language.length; j++) {
          //print(citi[j].valuestring.toString());
        }
        return Future(() => language);
      }

      //Cities city = Cities.fromJson(jsonDecode(response.body),);



      //  print(city.toString());
      // return citi;

      else {
        print(response.statusCode);
        return Future(() =>language);

      }
    }


    catch (e) {
      print(e.toString());
      //return response;
      return Future(() => language);
    }
  }


//List<Cities> citylist=List<Cities>.empty(growable: true);


}

