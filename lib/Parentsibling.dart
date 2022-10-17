import 'package:flutter/material.dart';
import 'package:learning_fitbit_mapp/Menu.dart';
class Parentsibling extends StatelessWidget {
  const Parentsibling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Menu(),
      ),
      appBar:AppBar(
        title: Row(
          children:<Widget>[
            Padding(
              padding:EdgeInsets.all(80.0),
            ),
            CircleAvatar(
              radius:30.0,
              foregroundImage: AssetImage('assets/Images/Login image.png'),
            ),
            Padding(padding:EdgeInsets.all(10.0)),
            Icon(Icons.notifications_active),
          ],
        ),
        backgroundColor: Colors.pink[50],
        iconTheme: IconThemeData(color:Colors.black),
      ),
      body: Parsib(),
    );
  }
}
class Parsib extends StatefulWidget {
  const Parsib({Key? key}) : super(key: key);

  @override
  State<Parsib> createState() => _ParsibState();
}
final key=GlobalKey<FormState>();
class _ParsibState extends State<Parsib> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scrollbar(
        isAlwaysShown:true,
        hoverThickness: 40.0,
        thickness: 15.0,
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0)),
            Text('Edit profile',style: TextStyle(fontSize: 18.0),),
            Padding(padding: EdgeInsets.all(10.0)),
            Text('Parent details',style: TextStyle(fontSize: 25.0,color: Colors.orange,fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(10.0)),
            Text('Parent name',style: TextStyle(fontSize: 13.0,color:Colors.grey,),),
            Container(
              height:40.0,
              width:268.0,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(padding:EdgeInsets.all(10.0)),
            Text('Profession',style: TextStyle(fontSize: 13.0,color:Colors.grey),),
            Container(
              height: 40.0,
              width:268.0,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(15.0),),
            Text('Email',style: TextStyle(fontSize: 13.0,color:Colors.grey),),
            Container(
              height:40.0,
              width: 268.0,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Text('Contact',style: TextStyle(fontSize: 13.0,color:Colors.grey),),
            Container(
              height:40.0,
              width:268.0,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(padding:EdgeInsets.all(10.0)),
            Text('Sibling details',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.orange),),
            Padding(padding:EdgeInsets.all(10.0)),
            Text('Name', style:TextStyle(fontSize:13.0,color:Colors.grey)),
            Container(
              height:40.0,
              width:268.0,
              child: TextFormField(
                decoration:InputDecoration(
                  border: OutlineInputBorder(),
                )
              )
            ),
            Padding(padding: EdgeInsets.all(15.0)),
            Text('Date of birth',style:TextStyle(fontSize:13.0,color:Colors.grey)),
            Container(
              height:40.0,
              width:268.0,
              child:TextFormField(
                decoration:InputDecoration(
                  border: OutlineInputBorder(),
                )
              )
            ),
            Padding(padding:EdgeInsets.all(10.0)),
            Text('Education',style:TextStyle(fontSize:13.0,color:Colors.grey)),
            Container(
              height:40.0,
              width:268.0,
              child:TextFormField(
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
