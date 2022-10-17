import 'dart:convert';
import 'dart:async';
class States {
  var id;
  var idnew;
  var providerid;
  var key;
  var sequenceid;
  var valueint;
  var valuestring;
  var isdefault;
  var isactive;
  var createdby;
  var createddate;
  var updatedby;
  var updateddate;


  States(
      {this.id, this.idnew, this.providerid, this.key, this.sequenceid, this.valueint, this.valuestring,this.isdefault, this.isactive, this.createdby, this.createddate, this.updatedby, this.updateddate});
  static  List< Map<String,dynamic>> statemap= List.empty(growable: true);


  States.fromJson(Map<dynamic,dynamic>json){
    print('Hello');
    var data = json['\$values'];
    //print(data.toString());
    print(data.length);
    var i = 1;
    var cpy = 0;
    var states;


    for (var i = 0; i < data.length; i++) {
      states=States(

        id: data[i]['\$id'],
        idnew: data[i]['id'],
        providerid: data[i]['providerId'],
        key: data[i]['key'],
        sequenceid: data[i]['sequenceId'],
        valueint: data[i]['valueInt'],
        valuestring: data[i]['valueString'],
        isdefault: data[i]['isDefault'],
        isactive: data[i]['isActive'],
        createdby: data[i]['createdBy'],
        createddate: data[i]['createdDate'],
        updatedby: data[i]['updatedBy'],
        updateddate: data[i]['updatedDate'],
      );
      // print(city.id);
      statemap.add({'key':states.valueint,'value':states.valuestring},);
      //   print(citylist[i].id.toString());

    }
  }
 List<Map<String,dynamic>> getlist(){
    return statemap;
  }
}





