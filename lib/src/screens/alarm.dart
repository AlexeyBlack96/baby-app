import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/alarm.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/screens/alarm-create-or-edit.dart';
import 'package:provider/provider.dart';
import 'package:insta_clone/src/CRUDs/CRUDAlarmModel.dart';

class Alarm extends StatefulWidget {
  @override
  final Baby baby;
  final String type;
  Alarm({Key key, @required this.baby, this.type}) : super(key: key);
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> with SingleTickerProviderStateMixin {


  List<AlarmModel> alarms = new List<AlarmModel>();
  CRUDAlarmModel alarmCRUD = new CRUDAlarmModel();
  AlarmModel emptyAlarm; 

  setAlarms(){
    print(1);
    alarmCRUD.getAlarmModelByBabyId(widget.baby.id).then((data){
      setState(() {
        print(data);
        if(data.length > 0){
          alarms = data;
        }
        else{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AlarmUpdate(baby: widget.baby, alarm: emptyAlarm)),
          ).then((data){
            setAlarms();
          });
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    emptyAlarm = new AlarmModel("", widget.baby.id, "", DateTime.now(), widget.type, false, false,false,false,false,false,false, true);
    setAlarms();
  }

  _changeAlarm(alarm, data){
    alarm.isActive = data;
    print(data);
    alarmCRUD.updateAlarmModel(alarm, alarm.id);
  }

  List<Widget> days(AlarmModel alarm){
    List<Widget> ret = new List<Widget>();
    print(alarm.mon);
    if(alarm.mon && alarm.thu && alarm.tue && alarm.wed && alarm.sat && alarm.sun && alarm.fri ){
      ret.add(Text('All', style: TextStyle(color: Color(0xff3879c1)))); 
    }
    else{
      if(alarm.mon)
        ret.add(Text('Mon ', style: TextStyle(color: Color(0xff3879c1)))); 
      if(alarm.thu )
        ret.add(Text('Thu ', style: TextStyle(color: Color(0xff3879c1)))); 
      if(alarm.tue  )
        ret.add(Text('Tue ', style: TextStyle(color: Color(0xff3879c1)))); 
      if(alarm.wed  )
        ret.add(Text('Wed ', style: TextStyle(color: Color(0xff3879c1)))); 
      if(alarm.sat  )
        ret.add(Text('Sat ', style: TextStyle(color: Color(0xff3879c1)))); 
      if(alarm.sun )
        ret.add(Text('Sun ', style: TextStyle(color: Color(0xff3879c1)))); 
      if(alarm.fri )
        ret.add(Text('Fri ', style: TextStyle(color: Color(0xff3879c1)))); 
    }
    return ret;
  }

  Widget getContent(){
    
    return Container(
        child: ListView.builder(
          itemCount: alarms.length,
          itemBuilder: (context, index){
            return Padding(
            padding: EdgeInsets.all(14.0),
            child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(14.0),
                child: Icon(Icons.alarm),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        '${alarms[index].time.hour}:${alarms[index].time.minute}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, top: 2.0,right: 5.0, bottom: 2.0),
                      child: Text('${alarms[index].note}')
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, top: 2.0,right: 5.0, bottom: 2.0),
                      child: Row(
                        children: days(alarms[index])
                      ),
                    ),
                    
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AlarmUpdate(baby: widget.baby, alarm: alarms[index],)),
                        ).then((value){
                            setAlarms();
                          });
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black26,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      )
                    ),
                  ],
                ),
              ),
                Switch(
                  value: alarms[index].isActive,
                  onChanged: (bool value){
                      _changeAlarm(alarms[index], !alarms[index].isActive);
                  },
                ),
            ],
          ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Scaffold(
          body: getContent()
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
            Icons.alarm,
            size: 26.0,
            color: Colors.purple,
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            "Alarm", style: TextStyle(color: Colors.purple)
          ),
          ),
          SizedBox(width: 4.0),
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[50],
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AlarmUpdate(baby: widget.baby, alarm: emptyAlarm)),
            ).then((value){
              setAlarms();
            });
          },
          child:Icon(Icons.add, size: 24.0,),
        )
      ],
    );
  }
}
