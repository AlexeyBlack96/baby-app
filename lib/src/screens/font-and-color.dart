import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:insta_clone/src/models/setting.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';












class FontAndColor extends StatefulWidget {
        final Setting setting;
    FontAndColor({this.setting});
  @override
  _FontAndColor createState() => _FontAndColor();
}

class _FontAndColor extends State<FontAndColor>
    with SingleTickerProviderStateMixin {
    
  bool state1 = false;

  _onChange(bool value){
    setState(() {
      state1 = value;
    });
  }

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
              padding: EdgeInsets.all(14.0),
              child: Text('Font Size'),
            ),

            Padding(
              padding: EdgeInsets.all(14.0),
              
              child: Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 15.0,
                  onChanged: (newRating) {

                  },
                  value: 5,
                ),
            ),
            Container(child: MaterialColorPicker(
              onColorChange: (Color color) {
              // Handle color changes
              },
              selectedColor: Colors.red,
              colors: [
                Colors.red,
                Colors.deepOrange,
                Colors.yellow,
                Colors.lightGreen
              ],
            ),)
            
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
            "Font & Color",
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
