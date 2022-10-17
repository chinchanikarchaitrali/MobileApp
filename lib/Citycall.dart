
import 'package:http/http.dart' as http;
import 'package:learning_fitbit_mapp/Apiconstants.dart';
import 'package:learning_fitbit_mapp/Cities.dart';
import 'dart:developer';
import 'dart:convert';
import'dart:io';
import 'dart:async';

class CityCall {
  static List<Map<String,dynamic>>citi = List.empty(growable: true);
  var response;
 Future<List<Map<String,dynamic>>> getCity() async {
    var location = Uri.http(Apiconstants.baseurl, Apiconstants.citie);
    response =
    await http.get(location, headers: {HttpHeaders.contentTypeHeader: 'Jsonp'});
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        // print(response.body);
        // displaycities(response);
         Cities.fromJson(json.decode(response.body));
        citi = Cities().getlist();
        for (var j = 0; j < citi.length; j++) {
          //print(citi[j].valuestring.toString());
        }
        return Future(() => citi);
      }

      //Cities city = Cities.fromJson(jsonDecode(response.body),);



      //  print(city.toString());
      // return citi;

      else {
        print(response.statusCode);
        return Future(() =>citi);

      }
    }


    catch (e) {
      print(e.toString());
      //return response;
      return Future(() => citi);
    }
  }


//List<Cities> citylist=List<Cities>.empty(growable: true);


  }
