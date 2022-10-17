import 'dart:convert';
import 'dart:async';
class Cities {
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


  Cities(
      {this.id, this.idnew, this.providerid, this.key, this.sequenceid, this.valueint, this.valuestring,this.isdefault, this.isactive, this.createdby, this.createddate, this.updatedby, this.updateddate});
static  List<Map<String,dynamic>> citylist=List.empty(growable: true);

 Cities.fromJson(Map<dynamic,dynamic>json){
   print('Hello');
   var data = json['\$values'];
   //print(data.toString());
   print(data.length);
   var i = 1;
   var cpy = 0;
   var city;


   for (var i = 0; i < data.length; i++) {
     city=Cities(

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
         citylist.add({'key':city.valueint,'value':city.valuestring},);
      //   print(citylist[i].id.toString());

   }
 }
 List<Map<String,dynamic>> getlist(){
   return citylist;
 }
    }





