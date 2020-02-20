import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/nappy-change.dart' as model;
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
import 'package:provider/provider.dart';
 import 'package:insta_clone/src/CRUDs/CRUDNappyChangeModel.dart';

// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';

class NappyChange extends StatefulWidget {
  final Baby baby;
  NappyChange({Key key, @required this.baby}) : super(key: key);
  @override
  _NappyChangeState createState() => _NappyChangeState();
}

class _NappyChangeState extends State<NappyChange> with SingleTickerProviderStateMixin {

  String napyStatus = "";
  DateTime _date = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  model.NappyChange data = new model.NappyChange("","","",DateTime.now(),"");
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
                    data.time = date;

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
              child: Text('Status'),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  napyStatus = "Wet";
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
                  child:Card(
                    child: ListTile(
                    title: Text('Wet', style: napyStatus == "Wet" ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
                  ),
                )
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  napyStatus = "Dirty";
                });
              },
              child: Padding(
              padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
              child:Card(
              child: ListTile(
                title: Text('Dirty', style: napyStatus == "Dirty" ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
              ),
            ))),

            GestureDetector(
              onTap: (){
                setState(() {
                  napyStatus = "Mixed";
                });
              },
              child:Padding(
              padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
              child:Card(
              child: ListTile(
                title: Text('Mixed', style: napyStatus == "Mixed" ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
              ),
            ))),
            
            
            GestureDetector(
              onTap: (){
                setState(() {
                  napyStatus = "Dry";
                });
              },
              child:Padding(
              padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
              child:Card(
              child: ListTile(
                title: Text('Dry', style: napyStatus == "Dry" ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
              ),
            ))),
            
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
    ))
  );


  

  }
Widget appBar() {
      final nappyChangeProvider = Provider.of<CRUDNappyChangeModel>(context);

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Icon(
            CustomIcons.diaper,
            size: 26.0,
            color: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            "Nappy Change", style: TextStyle(color: Colors.blue)
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
              data.status = napyStatus;
                await nappyChangeProvider.addNappyChange(data);
                Navigator.pop(context);
            }
          },
          child:Icon(Icons.check, size: 24.0,),
        )
        
        
      ],
    );
  }
}
