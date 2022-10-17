import "package:flutter/material.dart";
import "package:learning_fitbit_mapp/Menu.dart";
class Personalacademic extends StatelessWidget {
  const Personalacademic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Menu(),
      ),
      appBar: AppBar(
        title: Row(
          children:<Widget>[
            Padding(padding: EdgeInsets.all(80.0),),
            CircleAvatar(
              radius: 30.0,
              foregroundImage: AssetImage('assets/Images/Login image.png'),

            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Icon(Icons.notifications_active),
          ],
        ),
         backgroundColor: Colors.pink[50],
        iconTheme: IconThemeData(color:Colors.black),

        ),
      body: Personalaca(),

    );
  }
}
class Personalaca extends StatefulWidget {
  const Personalaca({Key? key}) : super(key: key);

  @override
  State<Personalaca> createState() => _PersonalacaState();
}
final key=GlobalKey<FormState>();
class _PersonalacaState extends State<Personalaca> {
  final eduboard=['State board','ICSE','CBSE'];
  String ? board="State board";
  final clas=['8th','9th','10th','11th','12th'];
  String ? cl="8th";
  @override
  Widget build(BuildContext context) {
    return new Container(
      child:Scrollbar(
        isAlwaysShown: true,
        hoverThickness: 40.0,
        thickness:15.0 ,
        child: Form(
          key: key,
          child: ListView(
            children: <Widget>[
              Padding(padding:EdgeInsets.all(10.0)),
              Text('Edit profile', style:TextStyle(fontSize:15.0)),
              Padding(padding: EdgeInsets.all(10.0),),
              Text('Personal details',style: TextStyle(fontSize:25.0 ,fontWeight:FontWeight.bold,color:Colors.orange)),
              Padding(padding:EdgeInsets.all(10.0)),
              Text('Full Name',style:TextStyle(fontSize: 13.0,color:Colors.grey)),
              Container(
                height:40.0,
                width:268.0,
              child: TextFormField(decoration: InputDecoration(border:OutlineInputBorder()),),

             ),
              Padding(padding:EdgeInsets.all(10.0)),
              Text('Dat of birth',style:TextStyle(fontSize: 13.0,color:Colors.grey)),
              Container(
                height: 40.0,
                width:268.0,
                child:TextFormField(decoration:InputDecoration(border: OutlineInputBorder())),

              ),
              Padding(padding:EdgeInsets.all(10.0)),
              Text('Email',style:TextStyle(fontSize: 13.0,color:Colors.grey)),
              Container(
                height:40.0,
                width:268.0,
                child: TextFormField(decoration:InputDecoration(border:OutlineInputBorder())),
              ),
              Padding(padding:EdgeInsets.all(10.0)),
              Text('Contact',style:TextStyle(fontSize: 13.0,color:Colors.grey)),
              Container(
                height:40.0,
                width:268.0,
                child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),),

              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text('Address', style: TextStyle(fontSize:13.0,color:Colors.grey),),
              Container(
                height:40.0,
                width:268.0,
                child:TextFormField(decoration:InputDecoration(border:OutlineInputBorder())),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text('State',style: TextStyle(fontSize:13.0,color:Colors.grey),),
              Container(
                height:40.0,
                width:268.0,
                child:TextFormField(decoration:InputDecoration(border:OutlineInputBorder())),

              ),
              Padding(padding:EdgeInsets.all(10.0)),
              Text('City',style:TextStyle(fontSize: 13.0,color:Colors.grey)),
              Container(
                height:40.0,
                width:268.0,
                child: TextFormField(decoration:InputDecoration(border: OutlineInputBorder())),

              ),
              Padding(padding: EdgeInsets.all(10.0),),
              Text('Pincode',style:TextStyle(fontSize: 13.0,color:Colors.grey)),
              Container(
                height:40.0,
                width:268.0,
                child:TextFormField(decoration:InputDecoration(border:OutlineInputBorder())),

              ),
              Padding(padding: EdgeInsets.all(10.0),),
              Text('Academic details',style: TextStyle(fontSize:25.0 ,fontWeight:FontWeight.bold,color:Colors.orange)),
              Padding(padding:EdgeInsets.all(10.0)),
              Text('Native languages',style: TextStyle(fontSize: 13.0,color:Colors.grey),),
              Container(
                height:44.0,
                width: 268.0,
                child:TextFormField(decoration:InputDecoration(border: OutlineInputBorder())),

              ),
              Padding(padding: EdgeInsets.all(10.0),),
              Text('Board',style: TextStyle(fontSize:13.0,color:Colors.grey),),
              DropdownButtonFormField(
                decoration:InputDecoration(border:OutlineInputBorder()),
                onChanged:(String ? b){
                  setState((){
                    board=b!;
                  });
                },
                value:board,
                items:eduboard.map((bor)=> DropdownMenuItem(child: Text(bor),value:bor)).toList(),

              ),
              Padding(padding: EdgeInsets.all(10.0),),
              Text('Class',style:TextStyle(fontSize: 13.0,color:Colors.grey)),
              DropdownButtonFormField(
                decoration:InputDecoration(border:OutlineInputBorder()),
                onChanged:(String ? cs){
                  setState((){cl=cs!;});
              },
                items:clas.map((c)=>DropdownMenuItem(child: Text(c),value:c)).toList()
              ),
              Padding(padding:EdgeInsets.all(10.0)),
              TextButton(onPressed: (){print("Saved personal details");},
                  child: Text('Save',style:TextStyle(fontSize:18.0)),
                   style:ButtonStyle(
                     foregroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                     backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                     shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15.0),
                         side: BorderSide(color: Colors.orange),
                       )
                     )
                   ))


            ],
          ),

        ),
      ),

    );
  }
}
