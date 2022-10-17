import 'package:http/http.dart' as http;
import 'package:learning_fitbit_mapp/Apiconstants.dart';
import 'package:learning_fitbit_mapp/Boards.dart';

//import 'package:learning_fitbit_mapp/States.dart';
import 'dart:developer';
import 'dart:convert';
import'dart:io';
import 'dart:async';

class BoardCall{
  static List<Map<String,dynamic>>board= List.empty(growable: true);
  var response;
  Future<List<Map<String,dynamic>>> getBoard() async {
    var location = Uri.http(Apiconstants.baseurl, Apiconstants.eduboard);
    response =
    await http.get(location, headers: {HttpHeaders.contentTypeHeader: 'Jsonp'});
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        // print(response.body);
        // displaycities(response);
        Boards.fromJson(json.decode(response.body));
        board= Boards().getlist();
        for (var j = 0; j < board.length; j++) {
          //print(citi[j].valuestring.toString());
        }
        return Future(() => board);
      }

      //Cities city = Cities.fromJson(jsonDecode(response.body),);



      //  print(city.toString());
      // return citi;

      else {
        print(response.statusCode);
        return Future(() =>board);

      }
    }


    catch (e) {
      print(e.toString());
      //return response;
      return Future(() => board);
    }
  }


//List<Cities> citylist=List<Cities>.empty(growable: true);


}

