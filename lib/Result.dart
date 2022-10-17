import 'dart:convert';

class Result{
   int id=1;
   int studid=2;
   String name="Chaitrali";
   String email="chinchanikarcb@gmail.com";

 Result({this.id=1,this.studid=1,this.name="chaitrali",this.email="chaitrali.chinchanikar@splaydid.com"});
   factory Result.fromJson(Map<String, dynamic> json) {
     return Result(
       id: json['id'],
       studid: json['studid'],
       name: json['name'],
       email: json['email'],
     );
   }
}