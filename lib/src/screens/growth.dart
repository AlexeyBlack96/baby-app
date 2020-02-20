import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/growth.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
import 'package:provider/provider.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';
 import 'package:insta_clone/src/CRUDs/CRUDGrowModel.dart';

class Growth extends StatefulWidget {
  @override
  final Baby baby;
  Growth({Key key, @required this.baby}) : super(key: key);
  _GrowthState createState() => _GrowthState();
}

class _GrowthState extends State<Growth> with SingleTickerProviderStateMixin {

  DateTime _date = DateTime.now();
final _formKey = GlobalKey<FormState>();
  GrowthModel data = new GrowthModel("", "", "", DateTime.now(), "","","","");
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
              padding: EdgeInsets.all(14.0),
              child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Long'
              ),
              onSaved: (val) => data.long = val
            )
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Weight'
              ),
              onSaved: (val) => data.weight = val
            )

            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Head'
              ),
              onSaved: (val) => data.head = val
            )
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextFormField(
              decoration: InputDecoration(
                labelText: 'BMI'
              ),
              onSaved: (val) => data.bmi = val
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
          ]
        ),
      ),
    )
    )
  );


  

  }
Widget appBar() {
      final growthProvider = Provider.of<CRUDGrowthModel>(context);

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Icon(
            Icons.child_care,
            size: 26.0,
            color: Colors.purple,
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            "Growth", style: TextStyle(color: Colors.purple)
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
                await growthProvider.addGrowthModel(data);
                Navigator.pop(context);
            }
          },
          child:Icon(Icons.check, size: 24.0,),
        )
        
        
      ],
    );
  }
}
