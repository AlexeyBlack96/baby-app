import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/alarm-create-or-edit.dart';
import 'package:insta_clone/src/screens/drugsCRUD.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';












class Drugs extends StatefulWidget {
  @override
  _DrugsState createState() => _DrugsState();
}

class _DrugsState extends State<Drugs>
    with SingleTickerProviderStateMixin {

  bool state1 = false;

  _onChange(bool value){
    setState(() {
      state1 = value;
    });
  }
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Scaffold(
        
          body: Container(
          child: ListView(
          children: <Widget>[
            
            
          ]
        ),
      ),
    )
  );


  

  }
Widget appBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Icon(
            Icons.local_hospital,
            size: 26.0,
            color: Colors.green[300],
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            "Drugs", style: TextStyle(color: Colors.green[300])
          ),
          ),
          SizedBox(width: 4.0),
          
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[50],
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DrugsCRUD()),
            );
          },
          child:Icon(Icons.add, size: 24.0,),
        )
        
        
      ],
    );
  }
}
