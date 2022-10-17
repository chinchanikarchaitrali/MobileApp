import 'dart:convert';
import 'dart:async';
class Interests{
  var id;
  var interestid;
  var providerid;
  String interests="Science";
  var description;
  var parentinterestid;
  String isactive="true";
  String isdefault="false";
  var createdby;
  var createddate;
  var updatedby;
  var updateddate;
  Interests({this.id,this.interestid,this.providerid,this.interests="Science",
  this.description,this.parentinterestid,this.isactive="true",this.isdefault="false",this.createdby,
  this.createddate,this.updatedby,this.updateddate});

  static  List<Map<String,dynamic>> interestlist=List.empty(growable: true);

  var data;
  var interest;

  Interests.fromJson(Map<dynamic,dynamic>json){
    data=json['\$values'];
    for(var i=0;i<data.length;i++){
      interest=Interests(id:data[i]['\$id'],
      interestid: data[i]['interestId'],
      providerid: data[i]['providerId'],
      interests: data[i]['interests'],
        description: data[i]['description'],
        parentinterestid: data[i]['parentInterestsId'],
        isactive: data[i]['isActive'].toString(),
        isdefault: data[i]['isDefault'].toString(),
        createdby: data[i]['createdBy'],
        createddate: data[i]['createdDate'],
        updatedby: data[i]['updatedBy'],
        updateddate: data[i]['updatedDate']

      );
      interestlist.add({'key':interest.valueint,'value':interest.valuestring},);
    }
  }
  List<Map<String,dynamic>>getlist(){
    return interestlist;
  }
}