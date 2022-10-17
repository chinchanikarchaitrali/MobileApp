import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
class Register {
  var userid;
  var providerid;
  var username;
  var passcode;
  var fullname;
  var fathername;
  var fathermobile;
  var fatheremail;
  var fatherprofession;
  var address;
  var state;
  var city;
  var pincode;
  var mobile;
  var email;
  var dob;
  var profilepicture;
  var isactive;
  var createdby;
  var createddate;
  var updatedby;
  var updateddate;
  var topics;
  var usertypeid;
  var educationid;
  var language;
  var board;
  var cls;
  var siblingdetailslist;
  var interestlist;

  Register(
      {this.userid, this.providerid, this.username, this.passcode, this.fullname, this.fathername, this.fathermobile, this.fatheremail, this.fatherprofession, this.address, this.state, this.city, this.pincode, this.mobile, this.email, this.dob, this.profilepicture, this.isactive,
        this.createdby, this.createddate, this.updatedby, this.updateddate, this.topics,
        this.usertypeid, this.educationid, this.language, this.board, this.cls, this.siblingdetailslist, this.interestlist});

  Register getvalues() {
    return Register(
        userid: this.userid,
        providerid: this.providerid,
        username: this.username,
        passcode: this.passcode,
        fullname: this.fullname,
        fathername: this.fathername,
        fathermobile: this.fathermobile,
        fatheremail: this.fatheremail,
        fatherprofession: this.fatherprofession,
        address: this.address,
        state: this.state,
        city: this.city,
        pincode: this.pincode,
        mobile: this.mobile,
        email: this.email,
        dob: this.dob,
        profilepicture: this.profilepicture,
        isactive: this.isactive,
        createdby: this.createdby,
        createddate: this.createddate,
        updatedby: this.updatedby,
        updateddate: this.updateddate,
        topics: this.topics,
        usertypeid: this.usertypeid,
        educationid: this.educationid,
        language: this.language,
        board: this.board,
        cls: this.cls,
        siblingdetailslist: this.siblingdetailslist,
        interestlist: this.interestlist
    );
    print('\n' + userid.toString());
    print('\n' + providerid.toString());
    print('\n' + username.toString());
    print('\n' + passcode.toString());
    print('\n' + fullname.toString());
    print('\n' + fathername.toString());
    print('\n' + fathermobile.toString());
    print('\n' + fatheremail.toString());
    print('\n' + fatherprofession.toString());
    print('\n' + address.toString());
    print('\n' + state.toString());
    print('\n' + city.toString());
    print('\n' + pincode.toString());
    print('\n' + mobile.toString());
    print('\n' + email.toString());
    print('\n' + dob.toString());
    print('\n' + profilepicture.toString());
    print('\n' + isactive.toString());
    print('\n' + createdby.toString());
    print('\n' + createddate.toString());
    print('\n' + updatedby.toString());
    print('\n' + updateddate.toString());
    print('\n' + topics.toString());
    print('\n' + usertypeid.toString());
    print('\n' + educationid.toString());
    print('\n' + language.toString());
    print('\n' + board.toString());
    print('\n' + cls.toString());
    print('\n' + siblingdetailslist.toString());
    print('\n' + interestlist.toString());
  }

  Map tojson() {
    return {'studentInfo': {
      'userId': int.parse(this.userid),
      'providerId': int.parse(this.providerid),
      'userName': this.username,
      'passCode': this.passcode,
      'fullName': this.fullname,
      'faherName':null,
      'fatherMobile': null,
      'fatherEmail': null,
      'fatherProfession': null,
      'address': this.address,
      'state': int.parse(this.state),
      'city': int.parse(this.city),
      'pinCode': int.parse(this.pincode),
      'mobile':int.parse(this.mobile),
      'email': this.email,
      'dob': this.dob,
      'profilePicture': null,
      'isActive': true,
      'createdBy': this.createdby,
      'createdDate': this.createddate,
      'updatedBy': this.updatedby,
      'updatedDate': this.updateddate,
      'topics': null,
      'userTypeId':int.parse(this.usertypeid)
    }, 'educationInfo': {
      'educationId':int.parse( this.educationid),
      'userId': int.parse(this.userid),
      'language': int.parse(this.language),
      'board': int.parse(this.board),
      'class': int.parse(this.cls),
      'createdBy': this.createdby,
      'createdDate': this.createddate,
      'updatedBy': this.updatedby,
      'updatedDate': this.updateddate
    }, 'siblingDetailsList': [1,2,3],
      'intrestList':  [1,2,3],

    };
  }
}