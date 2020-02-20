import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:insta_clone/src/models/alarm.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:provider/provider.dart';
import 'package:insta_clone/src/CRUDs/CRUDAlarmModel.dart';


class AlarmUpdate extends StatefulWidget {
  @override
  final Baby baby;
  final AlarmModel alarm ;
  final String type;
  AlarmUpdate({Key key, @required this.baby, this.alarm, this.type}) : super(key: key);
  _AlarmUpdateState createState() => _AlarmUpdateState();
}

class _AlarmUpdateState extends State<AlarmUpdate> with SingleTickerProviderStateMixin {

  DateTime _date = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  bool isAll = false;
  AlarmModel data;

  changeDay(int day, bool value ){
    setState(() {
      switch (day) {
      case 1:
        data.mon = value;
        break;
      case 2:
        data.tue = value;
        break;
      case 3:
        data.wed = value;
        break;
      case 4:
        data.thu = value;
        break;
      case 5:
        data.fri = value;
        break;
      case 6:
        data.sat = value;
        break;
      case 7:
        data.sun = value;
        break;
      case 0:
        data.mon = value;
        data.tue = value;
        data.wed = value;
        data.thu = value;
        data.fri = value;
        data.sat = value;
        data.sun = value;
        break;
      default:
        break;
      }
      isAll = (data.mon && data.tue && data.wed && data.thu && data.fri && data.sat && data.sun);

    });
  }

  _onChange(bool value){
    setState(() {
      data.isActive = value;
    });
  }

  @override
  void initState() {
    data = widget.alarm;
    isAll = (data.mon && data.tue && data.wed && data.thu && data.fri && data.sat && data.sun);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Scaffold(
          body: Container(
          child:  Form(
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
                  setState(() {
                    _date = date;
                    data.time = _date;
                  });
                }, currentTime: data.time, locale: LocaleType.en);
              },
              child: Padding(
              padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
              child: Card(
                child: ListTile(
                  title: Text('${data.time.hour}:${data.time.minute}'),
                ),
              ),
            ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                initialValue: data.note,
                decoration: InputDecoration(
                  labelText: 'Description'
                ),
                onSaved: (val) => data.note = val
              )
            ),
            Padding(
              padding: EdgeInsets.only(left:14.0, top:14.0, right: 14.0),
              child:  Card(
                child: ListTile(
                  title: Text('Enable'),
                  trailing: Switch(
                    value: data.isActive,
                    onChanged: (bool value){
                      _onChange(value);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:14.0, top:14.0, right: 14.0),
              child:  Card(
                child:Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          changeDay(0, !isAll);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:20.0, top:10.0, bottom: 10.0, right: 3.0),
                            child: Text('All', style: isAll ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          changeDay(1, !data.mon);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:3.0, top:10.0, bottom: 10.0, right: 3.0),
                            child: Text('Mon', style: data.mon ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          changeDay(2, !data.tue);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:3.0, top:10.0, bottom: 10.0, right: 3.0),
                            child:Text('Tue', style: data.tue ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          changeDay(3, !data.wed);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:3.0, top:10.0, bottom: 10.0, right: 3.0),
                            child: Text('Wed', style: data.wed ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          changeDay(4, !data.thu);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:3.0, top:10.0, bottom: 10.0, right: 3.0),
                            child:Text('Thu', style: data.thu ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          changeDay(5, !data.fri);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:3.0, top:10.0, bottom: 10.0, right: 3.0),
                            child: Text('Fri', style: data.fri ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          changeDay(6, !data.sat);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:3.0, top:10.0, bottom: 10.0, right: 3.0),
                            child: Text('Sat', style: data.sat ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          changeDay(7, !data.sun);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:3.0, top:10.0, bottom: 10.0, right: 3.0),
                            child:Text('Sun', style: data.sun ? TextStyle(color: Color(0xff3879c1)) : TextStyle(color: Color(0xffcccccc)),),
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ]
        ),
        )
      ),
    )
  );
}

  Widget appBar() {
    final provider = Provider.of<CRUDAlarmModel>(context);

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Icon(
            Icons.alarm,
            size: 26.0,
            color: Colors.purple,
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            widget.alarm.id == "" ? "New Alarm" : "Edit Alarrm", style: TextStyle(color: Colors.purple)
          ),
          ),
          SizedBox(width: 4.0),
          
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[50],
          onPressed: ()async{
           
              _formKey.currentState.save();
              if(widget.alarm.id == "") {
                await provider.addAlarmModel(data);
              }
              else{
                await provider.updateAlarmModel(data, widget.alarm.id);
              }
              Navigator.pop(context);
            
          },
          child:Icon(Icons.check, size: 24.0,),
        )
      ],
    );
  }
}
