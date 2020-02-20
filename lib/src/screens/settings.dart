import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/baseAuth.dart';
import 'package:insta_clone/src/models/setting.dart';
import 'package:insta_clone/src/screens/data-backup.dart';
import 'package:insta_clone/src/screens/preferences.dart';
import 'package:insta_clone/src/screens/signIn.dart';

class Settings extends StatefulWidget {
  Settings({this.auth, this.setting});
  final BaseAuth auth;
  final Setting setting;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with SingleTickerProviderStateMixin {

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
              child: Text('You can change preferences settings'),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Preferences(setting: widget.setting)),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text('Preferences'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Connect to the Cloud to back up data and synchronize records across devices.'),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataBackup()),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text('Data Backup'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn(
                    auth: widget.auth,
                    loginCallback: (){
                      
                  })),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text('Sync Data Between Devices'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Use AirDrop or email to export data to another device.'),
            ),
            
            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Export Date Clone'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Export Date to CSV'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Copy Photos to Camera Roll'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Icon Legend'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Frequently Asked Question'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Email Support'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text("You're using the free version of Baby Tracker. Upgrade to the full version to remove ads and unlock great featuresuch as Apple Watch and Siri Shortcuts."),
            ),




            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Rate Us'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Share with Friend'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Like Us on Facebook'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text("If you enjoy using Baby Tracker, would you mind taking a moment to rate it? It wont take more than a minute. Thank for you support!"),
            ),
            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Version'),
                  trailing: Text('1.0.0', style: TextStyle(color: Color(0xffaaaaaa)),),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                
              },
              child: Card(
                child: ListTile(
                  title: Text('Upgrade to Full Version'),
                  trailing: Icon(Icons.navigate_next),
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
            "Setting",
            style: TextStyle(),
          ),
          SizedBox(width: 4.0),
          
        ],
      ),
      // actions: <Widget>[
      //   RaisedButton(
      //     color: Colors.grey[50],
      //     onPressed: (){
      //       Navigator.pop();
      //     },
      //     child:Icon(Icons.close, size: 24.0,),
      //   )
        
        
      // ],
    );
  }
}

