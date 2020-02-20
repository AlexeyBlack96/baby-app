import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';












class DataBackup extends StatefulWidget {
  @override
  _DataBackup createState() => _DataBackup();
}

class _DataBackup extends State<DataBackup>
    with SingleTickerProviderStateMixin {
    
  bool state1 = false;

  _onChange(bool value){
    setState(() {
      state1 = value;
    });
  }

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
              child: Text('To change your Cloud provider, disable the iCloud toggle switch below.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('iCloud'),
                  trailing: Switch(
                    value: true,
                    onChanged: (bool value){
                      _onChange(value);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Backups are run in the background and may take anywhere from a few minutes to an hour to complete. You can verify the backup by looking for the Baby Tracker iCloud folder from a different device.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Backup Now'),
                  
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('You can restore your Baby Tracker data by tapping one of the backup files.'),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text(DateTime.now().toString()),
                  
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
            "Data Backup",
            style: TextStyle(),
          ),
          SizedBox(width: 4.0),
          
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[50],
          onPressed: (){
            
          },
          child:Icon(Icons.check, size: 24.0,),
        )
        
        
      ],
    );
  }
}
