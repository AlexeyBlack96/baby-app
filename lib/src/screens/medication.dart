import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/medication.dart';
import 'package:insta_clone/src/screens/alarm-create-or-edit.dart';
import 'package:insta_clone/src/screens/drugs.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';
 import 'package:insta_clone/src/CRUDs/CRUDMedicationModel.dart';
import 'package:provider/provider.dart';

class Medication extends StatefulWidget {
  @override
      final Baby baby;
  Medication({Key key, @required this.baby}) : super(key: key);
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> with SingleTickerProviderStateMixin {

  FocusNode _focus = new FocusNode();
  DateTime _date = DateTime.now();

  final _formKey = GlobalKey<FormState>();
  MedicationModel data = new MedicationModel("", "", "", DateTime.now(), "","");
  @override
  void initState() {
    super.initState();
    data.babyId = widget.baby.id;
  }

  void _onFocusChange(){
    if(_focus.hasFocus){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Drugs()),
      );
    }
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
                focusNode: _focus,
              decoration: InputDecoration(
                labelText: 'Drug'
              ),
              onSaved: (val) => data.drug = val
            )
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Count'
              ),
              onSaved: (val) => data.count = val
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
                      MaterialPageRoute(builder: (context) => AlarmUpdate(baby: widget.baby,)),
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
  final provider = Provider.of<CRUDMedicationModel>(context);
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
            "Medication", style: TextStyle(color: Colors.green[300])
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
                await provider.addMedicationModel(data);
                Navigator.pop(context);
            }
          },
          child:Icon(Icons.check, size: 24.0,),
        )
        
        
      ],
    );
  }
}
