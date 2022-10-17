

import "package:flutter/material.dart";
import "package:learning_fitbit_mapp/Personalacademic.dart";
import "package:expandable_tree_menu/expandable_tree_menu.dart";
import 'package:learning_fitbit_mapp/Parentsibling.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isupdate=false;
  final updations=[TextButton(onPressed: (){
    print('1st item');
  }, child: Text('Personal/academic detail')),TextButton(onPressed:(){
    print('2nd item');
  }, child: Text('Parent/Sibling details'))];
  String newvalue="somevalue";
  @override
  Widget build(BuildContext context) {


    final ScrollController controller=ScrollController();
    return Scaffold(
      body: Container(
           width:375.0,

        child:Scrollbar(
          isAlwaysShown:true,
          hoverThickness: 40,
          thickness:15,
          controller: controller,

          child:ListView(
            children: <Widget>[
              const Padding(padding:EdgeInsets.all(10)),
              Container(
                height:44.0,
                width:290,
                child:
                TextButton(
                  child:const Text('X',textAlign: TextAlign.right,),
                  onPressed: (){
                    print('Closed');
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                  ),
                ),
              ),
              const Padding(padding:EdgeInsets.all(12.0)),
              ListTile(
                onTap:(){
                  print('Profile');
                },
                title: const Text('Chaitrali Chinchanikar\n chinchanikarcb@gmail.com'),
                leading: const CircleAvatar(
                    radius: 30.0,

                    foregroundImage: const AssetImage('assets/Images/Login image.png',
                    )
                ),
              ),

              const Padding(
                padding:EdgeInsets.all(12.0),
              ),
              Container(
                height:44.0,
                width:100.0,
                child: TextButton(
                  child: Text('Home',textAlign:TextAlign.left,
                      style: TextStyle(fontSize: 18.0)),
                  onPressed: (){
                    Navigator.pushNamed(context, '/signup');
                  },
                  style:ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(12.0)),
              Container(
                height: 44.0,
                width: 100.0,
                child: TextButton(
                  child: Text('Notifications',style: TextStyle(fontSize: 18.0)),
                  onPressed:(){
                    print('Notification');
                  },
                  style:ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
              ),
              Container(
                height: 44,
                width: 10.0,
                 child:Row(
                   children: <Widget>[
                     Padding(padding: EdgeInsets.all(35.0)),
                     Text('Profile update', style: TextStyle(fontSize: 18.0)),
                     Padding(padding:EdgeInsets.all(5.0)),
                     PopupMenuButton(


                         onSelected: (isupdate){
                           Navigator.pushNamed(context, '/signup');
                         },

                         itemBuilder: (BuildContext  context)=>
                         <PopupMenuEntry>[
                           PopupMenuItem(child:TextButton(child:Text('Personal/academic detail'),onPressed: (){Navigator.pushNamed(context, '/personalacd');},)),
                           PopupMenuItem(child: TextButton(child: Text('Parent/Sibling details'),onPressed: (){Navigator.pushNamed(context, '/parentsibling');print("Parent/Sibling details");},)),
                         ]
                     )


                   ],
                 ),


              ),

              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Container(
                height:44.0,
                width: 100.0,
                child: TextButton(
                  child: Text('Quiz',style: TextStyle(fontSize: 18.0),),
                  onPressed: (){
                    print('Quiz');
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),

                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(12.0)),
              Container(
                height: 44.0,
                width: 100.0,
                child: TextButton(
                  child: Text('My Reward',style: TextStyle(
                      fontSize: 18.0
                  ),),
                  onPressed:(){
                    print('My Reward');
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),

                  ),

                ),
              ),
              Padding(padding: EdgeInsets.all(12.0)),
              Container(
                height:44,
                width: 100.0,
                child: TextButton(
                  child: Text('Change Password',style: TextStyle(fontSize: 18.0),),
                  onPressed: (){
                    print('Change Password');
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
              ),
              Container(
                height: 44.0,
                width: 100.0,
                child: TextButton(
                  child:Text('Log Out',style: TextStyle(fontSize: 18.0),),
                  onPressed: (){
                    print('Logged out');
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ),
            ],
          ),

        ),),

    );
  }
}
