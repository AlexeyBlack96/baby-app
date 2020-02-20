import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/Expressed.dart';
import 'package:insta_clone/src/screens/alarm.dart';
import 'package:insta_clone/src/screens/feeding.dart';
import 'package:insta_clone/src/screens/formula.dart';
import 'package:insta_clone/src/screens/growth.dart';
import 'package:insta_clone/src/screens/joy.dart';
import 'package:insta_clone/src/screens/medication.dart';
import 'package:insta_clone/src/screens/nappy-change.dart';
import 'package:insta_clone/src/screens/others.dart';
import 'package:insta_clone/src/screens/pumping.dart';
import 'package:insta_clone/src/screens/sleep.dart';
import 'package:insta_clone/src/screens/supliment.dart';
import 'package:insta_clone/src/screens/temperature.dart';
import 'package:insta_clone/src/screens/vaccination.dart';
import 'package:insta_clone/src/models/baby.dart';

class MainTab extends StatelessWidget {
  @override
  final Baby baby;
  final VoidCallback callback;
  MainTab({Key key, @required this.baby, this.callback}) : super(key: key);

  @override
  void initState() {
  }
  @override
  void dispose() {
  }

  @override
  Widget build(BuildContext context) {
        return ListView(
          children: <Widget>[
            Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Card(
                child: ListTile(
                title: Text('Feeding', style: TextStyle(color: prefix1.Color(0xfff26730)),),
                leading: Icon(
                  CustomIcons.babyFood,
                  size: 32.0,
                  color: Colors.orange,
                ),
                trailing: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Alarm(baby: baby, type: 'Feeding')),
                    );
                  },
                  child: Icon(Icons.alarm,
                  color: Colors.orange,),
                ),
              ),
            ),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Nursing',
                  foregroundColor: Colors.white,
                  color: Colors.orange,
                  icon: CustomIcons.babyFood,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Feeding(baby: baby)),
                    ).then((data) {
                      callback();
                    });
                  },
                ),
                IconSlideAction(
                  caption: 'Expressed',
                  color: Colors.orange,
                  foregroundColor: Colors.white,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Expressed(baby: baby)),
                    ).then((data) {
                      callback();
                    });
                  },
                  icon: CustomIcons.babyStroller,
                ),
                IconSlideAction(
                  caption: 'Formula',
                  foregroundColor: Colors.white,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Formula(baby: baby)),
                    ).then((data) {
                      callback();
                    });
                  },
                  color: Colors.orange,
                  icon: CustomIcons.feedingBottle,
                ),
                IconSlideAction(
                  caption: 'Supliment',
                  color: Colors.orange,
                  foregroundColor: Colors.white,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Supliment(baby: baby)),
                    ).then((data) {
                      callback();
                    });
                  },
                  icon: CustomIcons.motherWithBabyInArms,
                ),

              ],
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NappyChange(baby: baby,)),
                ).then((data) {
                    callback();
                  });
              },
              child: Card(
              child: ListTile(
                title: Text('Nappy Change', style: TextStyle(color: prefix1.Color(0xff3879c1)),),
                leading: Icon(
                  CustomIcons.diaper,
                  size: 32.0,
                  color: Colors.blue,
                ),
                trailing: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Alarm(baby: baby, type: 'Nappy Change')),
                    ).then((data) {
                      callback();
                    });
                  },
                  child: Icon(Icons.alarm,
                  color: Colors.blue[300],)),
              ),
            )),

            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sleep(baby: baby,)),
                ).then((data) {
                      callback();
                    });
              },
              child:Card(
              child: ListTile(
                title: Text('Sleep', style: TextStyle(color: prefix1.Color(0xff43a06b)),),
                leading: Icon(
                  CustomIcons.babyStroller,
                  size: 32.0,
                  color: Colors.green,
                ),
                trailing: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Alarm(baby: baby, type: 'Sleep')),
                    ).then((data) {
                      callback();
                    });
                  },
                  child: Icon(Icons.alarm,
                  color: Colors.green[300],)),
                ),
                
            )),
            
            
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pumping(baby: baby,)),
                ).then((data) {
                    callback();
                  });
              },
              child:Card(
              child: ListTile(
                title: Text('Pumping', style: TextStyle(color: prefix1.Color(0xff9c7a54)),),
                leading: Icon(
                  CustomIcons.feedingBottle,
                  size: 32.0,
                  color: Colors.brown,
                ),
                trailing: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Alarm(baby: baby, type: 'Pumping')),
                    ).then((data) {
                      callback();
                    });
                  },
                  child: Icon(Icons.alarm,
                  color: Colors.brown[300],)),
                ),
            )),
            Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Card(
                child: ListTile(
                title: Text('Other Activity', style: TextStyle(color: prefix1.Color(0xff93c31f)),),
                leading: Icon(
                  Icons.bookmark_border,
                  size: 32.0,
                  color: Colors.green[300],
                ),
                trailing: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Alarm(baby: baby, type: 'Other Activity')),
                    ).then((data) {
                      callback();
                    });
                  },
                  child: Icon(Icons.alarm,
                  color: Colors.green[200],)),
                ),
                
            ),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Temperature',
                  foregroundColor: Colors.white,
                  color: Colors.green[300],
                  icon: CustomIcons.thermometerTool,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Temperature(baby: baby,)),
                    ).then((data) {
                      callback();
                    });
                  },
                ),
                IconSlideAction(
                  caption: 'Vaccination',
                  foregroundColor: Colors.white,
                  color: Colors.green[300],
                  icon: CustomIcons.vaccine,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Vaccination(baby: baby,)),
                    ).then((data) {
                      callback();
                    });
                  }
                ),
                IconSlideAction(
                  caption: 'Medication',
                  foregroundColor: Colors.white,
                  color: Colors.green[300],
                  icon: Icons.local_hospital,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Medication(baby: baby,)),
                    ).then((data) {
                      callback();
                    });
                  }
                ),
              ],
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Growth',
                  foregroundColor: Colors.white,
                  color: Colors.purple,
                  icon: Icons.child_care,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Growth(baby: baby,)),
                    ).then((data) {
                      callback();
                    });
                  },
                ),
                IconSlideAction(
                  caption: 'Joy',
                  foregroundColor: Colors.white,
                  color: Colors.purple,
                  icon: Icons.photo_camera,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Joy(baby: baby,)),
                    ).then((data) {
                      callback();
                    });
                  },
                ),
                IconSlideAction(
                  caption: 'Others',
                  color: Colors.purple,
                  foregroundColor: Colors.white,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Others(baby: baby,)),
                    ).then((data) {
                      callback();
                    });
                  },
                  icon: CustomIcons.babyIcon,
                ),
              ],
            ),
          ],
        );
  }
}
