import 'package:flutter/material.dart';
import 'package:insta_clone/src/CRUDs/CRUDSettingModel.dart';
import 'package:insta_clone/src/models/setting.dart';
import 'package:insta_clone/src/screens/default-timer.dart';
import 'package:insta_clone/src/screens/hide-show-button.dart';
import 'package:insta_clone/src/screens/font-and-color.dart';
import 'package:insta_clone/src/screens/units-of-measurement.dart';

class Preferences extends StatefulWidget {
  final Setting setting;
  Preferences({this.setting});
  @override
  _Preferences createState() => _Preferences();
}

class _Preferences extends State<Preferences> with SingleTickerProviderStateMixin {
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
              padding: EdgeInsets.all(14.0),
              child: Text('Customize UI for Baby Tracker.'),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FontAndColor()),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text('Fonts & Color'),
                  
                ),
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Night Mode'),
                  trailing: Switch(
                    value: widget.setting.nightMode,
                    onChanged: (bool value){
                      widget.setting.nightMode = value;
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HideShowButton()),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text('Hide/Show Buttons'),
                  
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Tap the time labels on the main page to change the time format between time and time-lapse.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Tap to Switch'),
                  trailing: Switch(
                    value: widget.setting.tapToSwitch,
                    onChanged: (bool value){
                      widget.setting.tapToSwitch = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Use the timer to track nursing, pumping, or other activities.'),
            ),
            
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DefaultTimer()),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text('Default Timer'),
                  
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('You can change units if any system default does not work for you.'),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UnitsOfMeasurement()),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text('Units of Measurement'),
                  
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Want to see the last log first? You can reverse the log order here.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Reverse Review Order'),
                  trailing: Switch(
                    value: widget.setting.reverseReviewOrder,
                    onChanged: (bool value){
                      widget.setting.reverseReviewOrder = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Checking the pattern often? Try moving it to the top of the page for quicker viewing.'),
            ),

            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Pattern on Top'),
                  trailing: Switch(
                    value: widget.setting.patternOnTop,
                    onChanged: (bool value){
                      widget.setting.patternOnTop = value;
                    },
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('For the pattern chart, if you prefer having the morning hours at the bottom, the afternoon hours at the top, flip the pattern chart.'),
            ),

            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Flip Pattern'),
                  trailing: Switch(
                    value: widget.setting.filipPattern,
                    onChanged: (bool value){
                      widget.setting.filipPattern = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Line charts work better for comparing different activities.'),
            ),

            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Line Chart'),
                  trailing: Switch(
                    value: widget.setting.lineChart,
                    onChanged: (bool value){
                      widget.setting.filipPattern = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('For premature baby, this will adjust age based on due date for growth records.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Use Adjusted Age for Growth'),
                  trailing: Switch(
                    value: widget.setting.useAdjusted,
                    onChanged: (bool value){
                      widget.setting.useAdjusted = value;
                    },
                  ),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Age in weeks will give you actual days.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Show Age in Weeks'),
                  trailing: Switch(
                    value: widget.setting.showAge,
                    onChanged: (bool value){
                      widget.setting.showAge = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Statistical analysis can use midnight to split overnight sleep time to 2 days.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Split Sleep Time at Midnight'),
                  trailing: Switch(
                    value: widget.setting.splitSleep,
                    onChanged: (bool value){
                      widget.setting.splitSleep = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('SAdjust the daytime period to fit your baby\'s schedule.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Nap (daytime sleep)'),
                  trailing: Switch(
                    value: widget.setting.isNap,
                    onChanged: (bool value){
                      widget.setting.isNap = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Count last feeding time using nursing start or finish time.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Show Nursing Interval from Start'),
                  trailing: Switch(
                    value: widget.setting.showNursing,
                    onChanged: (bool value){
                      widget.setting.showNursing = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('The last feeding information will be shown on the main page. The supplemental feeding will be shown as the last feeding also. If you want to hide the supplemental feeding information of the main page, disable this option.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Show Last Supplemental Feeding'),
                  trailing: Switch(
                    value: widget.setting.showLastSupplementation,
                    onChanged: (bool value){
                      widget.setting.showLastSupplementation = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Baby Tracker\'s icon badges are used to indicate ongoing nursing sessions or when the baby is sleeping. The badge disappears if the sleep or nursing session is stopped. This feature can be disabled here.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Use Icon Badge'),
                  trailing: Switch(
                    value: widget.setting.useIconBadge,
                    onChanged: (bool value){
                      widget.setting.useIconBadge = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('If you want to print reports to a monochrome printer, select Black and White reports.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Export Black and White Reports'),
                  trailing: Switch(
                    value: widget.setting.exportBlackAndWhite,
                    onChanged: (bool value){
                      widget.setting.exportBlackAndWhite = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('You can reduce space usage and speed up backup/restore by scaling photos to one of the sizes listed below.'),
            ),

            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Photo Size'),
                  trailing: Switch(
                    value: widget.setting.photoSize,
                    onChanged: (bool value){
                      widget.setting.photoSize = value;
                    },
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Choose sound for alarms.'),
            ),

            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Alarm Sound'),
                  trailing: Switch(
                    value: widget.setting.alarmSound,
                    onChanged: (bool value){
                      widget.setting.alarmSound = value;
                    },
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Move ads to the bottom. NOTE: This can lead to more frequent accidental clicking of ads.'),
            ),

            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Ads on Bottom'),
                  trailing: Switch(
                    value: widget.setting.adsOnBottom,
                    onChanged: (bool value){
                      widget.setting.adsOnBottom = value;
                    },
                  ),
                ),
              ),
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
          Text(
            "Preferences",
            style: TextStyle(),
          ),
          SizedBox(width: 4.0),
          
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[50],
          onPressed: (){
              CRUDSettingModel settingCRUD = new CRUDSettingModel();
              settingCRUD.updateSettings(widget.setting, widget.setting.id).then((data){
                Navigator.pop(context);
              });
          },
          child:Icon(Icons.check, size: 24.0,),
        )
        
        
      ],
    );
  }
}
