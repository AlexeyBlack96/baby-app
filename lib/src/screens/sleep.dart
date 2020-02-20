import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/sleep.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
import 'package:provider/provider.dart';
 import 'package:insta_clone/src/CRUDs/CRUDSleepModel.dart';

// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';


class Sleep extends StatefulWidget {
  final Baby baby;
  Sleep({Key key, @required this.baby}) : super(key: key);
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> with SingleTickerProviderStateMixin {

  DateTime _date = DateTime.now();
  DateTime _awoke = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  SleepModel data = new SleepModel("","","",DateTime.now(),DateTime.now());

  @override
  void initState() {
    super.initState();
    data.babyId = widget.baby.id;

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
              child: Text('Fall asleep'),
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
              padding: EdgeInsets.only(left:20.0, top:14.0, right: 14.0),
              child: Text('Awoke'),
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
                    _awoke = date;
                    data.awoke = date;
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Padding(
              padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
              child: Card(
                child: ListTile(
                  title: Text('${_awoke.hour}:${_awoke.minute}:${_awoke.second}'),
                ),
              ),
            ),
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
              onSaved: (val) => data.note = val,
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
        final sleepProvider = Provider.of<CRUDSleepModel>(context);

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Icon(
            CustomIcons.babyStroller,
            size: 26.0,
            color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            "Sleep", style: TextStyle(color: Colors.green)
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
                await sleepProvider.addSleepModel(data);
                Navigator.pop(context);
            }
          },
          child:Icon(Icons.check, size: 24.0,),
        )
        
        
      ],
    );
  }
}
