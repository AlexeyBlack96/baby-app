import 'package:flutter/material.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/models/setting.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';












class HideShowButton extends StatefulWidget {
        final Setting setting;
    HideShowButton({this.setting});
  @override
  _HideShowButton createState() => _HideShowButton();
}

class _HideShowButton extends State<HideShowButton>
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
                  title: Text('Icon'),
                  leading: Icon(
                  CustomIcons.feedingBottle,
                  size: 32.0,
                  color: Colors.brown,
                ),
                  trailing: Switch(
                    value: widget.setting.icon1,
                    onChanged: (bool value){
                      widget.setting.icon1 = value;
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
                  title: Text('Icon'),
                  leading: Icon(
                  CustomIcons.babyFood,
                  size: 32.0,
                  color: Colors.brown,
                ),
                  trailing: Switch(
                    value: widget.setting.icon2,
                    onChanged: (bool value){
                      widget.setting.icon2 = value;
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
                  title: Text('Icon'),
                  leading: Icon(
                  CustomIcons.babyStroller,
                  size: 32.0,
                  color: Colors.brown,
                ),
                  trailing: Switch(
                    value: widget.setting.icon3,
                    onChanged: (bool value){
                      widget.setting.icon3 = value;
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
                  title: Text('Icon'),
                  leading: Icon(
                  CustomIcons.diaper,
                  size: 32.0,
                  color: Colors.brown,
                ),
                  trailing: Switch(
                    value: widget.setting.icon4,
                    onChanged: (bool value){
                      widget.setting.icon4 = value;
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
                  title: Text('Icon'),
                  leading: Icon(
                  CustomIcons.motherWithBabyInArms,
                  size: 32.0,
                  color: Colors.brown,
                ),
                  trailing: Switch(
                    value: widget.setting.icon5,
                    onChanged: (bool value){
                      widget.setting.icon5 = value;
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
                  title: Text('Icon'),
                  leading: Icon(
                  CustomIcons.thermometerTool,
                  size: 32.0,
                  color: Colors.brown,
                ),
                  trailing: Switch(
                    value: widget.setting.icon6,
                    onChanged: (bool value){
                      widget.setting.icon6 = value;
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
                  title: Text('Icon'),
                  leading: Icon(
                  CustomIcons.vaccine,
                  size: 32.0,
                  color: Colors.brown,
                ),
                  trailing: Switch(
                    value: widget.setting.icon7,
                    onChanged: (bool value){
                      widget.setting.icon7 = value;
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
                  title: Text('Icon'),
                  leading: Icon(
                  CustomIcons.wrappedBaby,
                  size: 32.0,
                  color: Colors.brown,
                ),
                  trailing: Switch(
                    value: widget.setting.icon8,
                    onChanged: (bool value){
                      widget.setting.icon8 = value;
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
            "Hide/Show Buttons",
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
