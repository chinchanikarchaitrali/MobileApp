import 'package:http/http.dart' as http;
import 'package:learning_fitbit_mapp/Apiconstants.dart';
import 'package:learning_fitbit_mapp/Education.dart';
//import 'package:learning_fitbit_mapp/States.dart';
import 'dart:developer';
import 'dart:convert';
import'dart:io';
import 'dart:async';

class EducationCall{
  static List<Map<String,dynamic>>ecation= List.empty(growable: true);
  var response;
  Future<List<Map<String,dynamic>>> getEdu() async {
    var location = Uri.http(Apiconstants.baseurl, Apiconstants.edu);
    response =
    await http.get(location, headers: {HttpHeaders.contentTypeHeader: 'Jsonp'});
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        // print(response.body);
        // displaycities(response);
        Education.fromJson(json.decode(response.body));
        ecation= Education().getlist();
        for (var j = 0; j < ecation.length; j++) {
          //print(citi[j].valuestring.toString());
        }
        return Future(() => ecation);
      }

      //Cities city = Cities.fromJson(jsonDecode(response.body),);



      //  print(city.toString());
      // return citi;

      else {
        print(response.statusCode);
        return Future(() =>ecation);

      }
    }


    catch (e) {
      print(e.toString());
      //return response;
      return Future(() => ecation);
    }
  }


//List<Cities> citylist=List<Cities>.empty(growable: true);


}

