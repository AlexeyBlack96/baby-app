import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/setting.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';












class UnitsOfMeasurement extends StatefulWidget {
        final Setting setting;
    UnitsOfMeasurement({this.setting});
  @override
  _UnitsOfMeasurement createState() => _UnitsOfMeasurement();
}

class _UnitsOfMeasurement extends State<UnitsOfMeasurement>
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
                  title: Text('Quantity'),
                  trailing: Switch(
                    value: widget.setting.quantity,
                    onChanged: (bool value){
                      widget.setting.quantity = value;
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
                  title: Text('Length'),
                  trailing: Switch(
                    value: widget.setting.length,
                    onChanged: (bool value){
                      widget.setting.length = value;
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
                  title: Text('Weight'),
                  trailing: Switch(
                    value: widget.setting.weight,
                    onChanged: (bool value){
                      widget.setting.weight = value;
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
                  title: Text('Temperature'),
                  trailing: Switch(
                    value: widget.setting.temperature,
                    onChanged: (bool value){
                      widget.setting.temperature = value;
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
            "Units of Measurement",
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
