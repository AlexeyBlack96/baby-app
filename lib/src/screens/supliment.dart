import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/supliment.dart' as model;
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
import 'package:provider/provider.dart';
 import 'package:insta_clone/src/CRUDs/CRUDSuplimentModel.dart';

// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';


class Supliment extends StatefulWidget {
  @override
  final Baby baby;
  Supliment({Key key, @required this.baby}) : super(key: key);
  _SuplimentState createState() => _SuplimentState();
}

class _SuplimentState extends State<Supliment> with SingleTickerProviderStateMixin {

  DateTime _date = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  model.Supliment data = new model.Supliment("", "", "", "", "", DateTime.now(), "");
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
              padding: EdgeInsets.all(20.0),
              child: MultiSelect(
                autovalidate: false,
                titleText: "Supliment",
                validator: (value) {
                  if (value == null) {
                    return 'Please select one or more option(s)';
                  }
                },
                errorText: 'Please select one or more option(s)',
                dataSource: [
                  {
                    "display": "Cereal",
                    "value": 1,
                  },
                  {
                    "display": "Finger Foods",
                    "value": 2,
                  },
                  {
                    "display": "Fruit",
                    "value": 3,
                  },
                  {
                    "display": "Juice",
                    "value": 4,
                  },
                  {
                    "display": "Meat",
                    "value": 5,
                  },
                  {
                    "display": "Milk",
                    "value": 6,
                  },
                  {
                    "display": "Veggies",
                    "value": 7,
                  },
                  {
                    "display": "Vitamins",
                    "value": 8,
                  },
                  {
                    "display": "Water",
                    "value": 9,
                  }
                ],
                textField: 'display',
                valueField: 'value',
                filterable: true,
                required: true,
                value: null,
                onSaved: (value) {
                  data.supliment = value.toString();
                }
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                   // listen to ChangeNotifier
                    child: Column(
                        children: <Widget>[

                            Padding(
                              padding: EdgeInsets.only(left:20.0, top:20.0, right: 14.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Count'
                                ),
                                onSaved: (val) => data.count = val,
                              )
                            ),
                            
                          ],
                        )),
                Expanded(
                  flex: 5,
                  child: Column(
                          children: <Widget>[

                              Padding(
                                padding: EdgeInsets.only(left:14.0, top:20.0, right: 20.0),
                                child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Units'
                                ),
                                onSaved: (val) => data.units = val,
                              )
                              ),
                              
                            ],
                          )
                      ),

              ],
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
    ))
  );


  

  }
Widget appBar() {
      final suplimentProvider = Provider.of<CRUDSuplimentModel>(context);

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Icon(
            CustomIcons.motherWithBabyInArms,
            size: 26.0,
            color: Colors.orange,
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            "Supliment", style: TextStyle(color: Colors.orange)
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
                await suplimentProvider.addSupliment(data);
                Navigator.pop(context);
            }
          },
          child:Icon(Icons.check, size: 24.0,),
        )
        
        
      ],
    );
  }
}
