import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/alarm-create-or-edit.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';












class DrugsCRUD extends StatefulWidget {
  @override
  _DrugsCRUDState createState() => _DrugsCRUDState();
}

class _DrugsCRUDState extends State<DrugsCRUD> with SingleTickerProviderStateMixin {
  FocusNode _focus = new FocusNode();

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

            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
              decoration: InputDecoration(
                labelText: 'Name'
              ),
            )
            ),
            
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextField(
                maxLines: 4,
                decoration: InputDecoration(
                labelText: 'Note',
                border: OutlineInputBorder (
                  borderSide: BorderSide(color: Colors.blue)
                )
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
              decoration: InputDecoration(
                labelText: 'Count'
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
              decoration: InputDecoration(
                labelText: 'Unit'
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
              decoration: InputDecoration(
                labelText: 'Interval'
              ),
            )
            ),
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
            "Create drug", style: TextStyle(color: Colors.green[300])
          ),
          ),
          SizedBox(width: 4.0),
          
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[50],
          onPressed: (){
            
          },
          child:Icon(Icons.check, size: 24.0,),
        )
        
        
      ],
    );
  }
}
