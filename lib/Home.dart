import "package:flutter/material.dart";
import "package:learning_fitbit_mapp/Menu.dart";
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  //final _scaffoldkey= GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return new  Scaffold(
     //  key: _scaffoldkey,
       drawer :Drawer(
        child: Menu()
       ),
      appBar: AppBar(
        title: Row(

          children: [
            Padding(padding: EdgeInsets.all(2.0),),


            Padding(padding:EdgeInsets.all(5.0)),
            Text('VIDYA PRBODHINI',style: TextStyle(color:Colors.orange,fontSize: 18.0),),
            Padding(padding: EdgeInsets.all(5.0)),
            IconButton(
                onPressed: (){
                  print("Notification");
                },
                icon: Icon(Icons.notifications_active),
                 color: Colors.black,)
          ],
        ),
        backgroundColor: Colors.pink[50],
        iconTheme:IconThemeData(color : Colors.black),
      ),
    );
  }
}
