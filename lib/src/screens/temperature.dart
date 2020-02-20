import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/models/alarm.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/temperature.dart';
import 'package:insta_clone/src/screens/alarm-create-or-edit.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';
 import 'package:insta_clone/src/CRUDs/CRUDTemperatureModel.dart';
import 'package:provider/provider.dart';

class Temperature extends StatefulWidget {
  @override
  final Baby baby;
  Temperature({Key key, @required this.baby}) : super(key: key);
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> with SingleTickerProviderStateMixin {

  DateTime _date = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  TemperatureModel data = new TemperatureModel("", "", "", DateTime.now(), "","");
  @override
  void initState() {
    super.initState();
    data.babyId = widget.baby.id;
  }
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
 Future getImageFromGalery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Scaffold(
        
          body: Container(
          child: Form(
            key: _formKey,
            child:ListView(
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
                    data.time = _date;
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
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Temperature'
              ),
              onSaved: (val) => data.temperature = val
            )
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                labelText: 'Note',
                border: OutlineInputBorder (
                  borderSide: BorderSide(color: Colors.blue)
                )
              ),
              onSaved: (val) => data.note = val
            )
            ),
            
            Row(children: <Widget>[
              Expanded(
                  flex: 10,
                  child:Padding(
                padding: EdgeInsets.only(left:14.0, top:30.0, right: 14.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AlarmUpdate(baby: widget.baby,alarm: new AlarmModel("", "", "", DateTime.now(), "Temperature", false, false,false,false,false,false,false, true))),
                    );
                  },
                  child:Icon(
                      Icons.alarm,
                      size: 42.0,
                      color: Colors.grey[300],
                    ),
                  ))),
              
            ],),
            
          ]
        ),
      ),
    ))
  );


  

  }
Widget appBar() {
  final provider = Provider.of<CRUDTemperatureModel>(context);
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Icon(
            CustomIcons.thermometerTool,
            size: 26.0,
            color: Colors.green[300],
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            "Temperature", style: TextStyle(color: Colors.green[300])
          ),
          ),
          SizedBox(width: 4.0),
          
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[50],
          onPressed: ()async{
            if(_formKey.currentState.validate()){
              _formKey.currentState.save();
                await provider.addTemperatureModel(data);
                Navigator.pop(context);
            }
          },
          child:Icon(Icons.check, size: 24.0,),
        )
        
        
      ],
    );
  }
}
