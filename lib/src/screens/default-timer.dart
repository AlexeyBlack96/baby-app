import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/setting.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';












class DefaultTimer extends StatefulWidget {
      final Setting setting;
    DefaultTimer({this.setting});
  @override
  _DefaultTimer createState() => _DefaultTimer();
}

class _DefaultTimer extends State<DefaultTimer>
    with SingleTickerProviderStateMixin {

  bool state1 = false;

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
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Lactation'),
                  trailing: Switch(
                    value: widget.setting.lactation,
                    onChanged: (bool value){
                      widget.setting.lactation = value;
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Expressing'),
                  trailing: Switch(
                    value: widget.setting.expressing,
                    onChanged: (bool value){
                      widget.setting.expressing = value;
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Other'),
                  trailing: Switch(
                    value: widget.setting.other,
                    onChanged: (bool value){
                      widget.setting.other = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('You can turn off auto-lock when using a timer.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Turn off Auto-lock'),
                  trailing: Switch(
                    value: widget.setting.turnAutoLock,
                    onChanged: (bool value){
                      widget.setting.turnAutoLock = value;
                    },
                  ),
                ),
              ),
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
          Text(
            "Sign In",
            style: TextStyle(),
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
