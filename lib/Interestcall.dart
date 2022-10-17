import 'package:http/http.dart' as http;
import 'package:learning_fitbit_mapp/Apiconstants.dart';
import 'package:learning_fitbit_mapp/Interests.dart';
import 'dart:developer';
import 'dart:convert';
import'dart:io';
import 'dart:async';

class InterestCall{
  static List<Map<String,dynamic>>inte = List.empty(growable: true);
  var response;
  Future<List<Map<String,dynamic>>> getInte() async {
    var location = Uri.http(Apiconstants.baseurl, Apiconstants.intrest);
    response =
    await http.get(location, headers: {HttpHeaders.contentTypeHeader: 'Jsonp'});
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        // print(response.body);
        // displaycities(response);
        Interests.fromJson(json.decode(response.body));
        inte = Interests().getlist();
        for (var j = 0; j < inte.length; j++) {
          //print(citi[j].valuestring.toString());
        }
        return Future(() => inte);
      }

      //Cities city = Cities.fromJson(jsonDecode(response.body),);



      //  print(city.toString());
      // return citi;

      else {
        print(response.statusCode);
        return Future(() =>inte);

      }
    }


    catch (e) {
      print(e.toString());
      //return response;
      return Future(() => inte);
    }
  }


//List<Cities> citylist=List<Cities>.empty(growable: true);


}
