import 'package:http/http.dart' as http;
import 'package:learning_fitbit_mapp/Apiconstants.dart';
import 'package:learning_fitbit_mapp/States.dart';
import 'dart:developer';
import 'dart:convert';
import'dart:io';
import 'dart:async';

class StateCall{
  static List<Map<String,dynamic>>states= List.empty(growable: true);
  var response;
  Future<List<Map<String,dynamic>>> getState() async {
    var location = Uri.http(Apiconstants.baseurl, Apiconstants.states);
    response =
    await http.get(location, headers: {HttpHeaders.contentTypeHeader: 'Jsonp'});
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        // print(response.body);
        // displaycities(response);
        States.fromJson(json.decode(response.body));
        states= States().getlist();
        //for (var j = 0; j < states.length; j++) {
          //print(citi[j].valuestring.toString());
        //}
        return Future(() => states);
      }

      //Cities city = Cities.fromJson(jsonDecode(response.body),);



      //  print(city.toString());
      // return citi;

      else {
        print(response.statusCode);
        return Future(() => states);

      }
    }


    catch (e) {
      print(e.toString());
      //return response;
      return Future(() => states);
    }
  }


//List<Cities> citylist=List<Cities>.empty(growable: true);


}

