import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';












class OtherActivity extends StatefulWidget {
  @override
  _OtherActivityState createState() => _OtherActivityState();
}

class _OtherActivityState extends State<OtherActivity>
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
            
            Padding(
              padding: EdgeInsets.only(left:20.0, top:14.0, right: 14.0),
              child: Text('Time'),
            ),
            GestureDetector(
              onTap: (){
                  DatePicker.showTimePicker(context,
                  showTitleActions: true,
                  theme: DatePickerTheme(
                    containerHeight: 210.0,
                  ),
                  onConfirm: (date) {
                  print('confirm $date');
                  
                  setState(() {
                    _date = date;
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Padding(
              padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
              child: Card(
                child: ListTile(
                  title: Text('${_date.hour}:${_date.minute}:${_date.second}'),
                ),
              ),
            ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextField(
              decoration: InputDecoration(
                labelText: 'Long'
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextField(
              decoration: InputDecoration(
                labelText: 'Weight'
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextField(
              decoration: InputDecoration(
                labelText: 'Head'
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextField(
              decoration: InputDecoration(
                labelText: 'BMI'
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
            CustomIcons.babyFood,
            size: 26.0,
            color: Colors.green[300],
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            "Other Activity", style: TextStyle(color: Colors.green[300])
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
