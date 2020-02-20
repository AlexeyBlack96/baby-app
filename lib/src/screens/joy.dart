import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/joy.dart';
// import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/screens/settings.dart';
// import 'package:insta_clone/src/screens/insta_gallery.dart';
 import 'package:insta_clone/src/screens/main_page.dart';
// import 'package:insta_clone/src/screens/insta_search.dart';
// import 'package:insta_clone/src/widgets/insta_activities.dart';
 import 'package:insta_clone/src/CRUDs/CRUDJoyModel.dart';
import 'package:provider/provider.dart';

class Joy extends StatefulWidget {
  @override
  final Baby baby;
  Joy({Key key, @required this.baby}) : super(key: key);
  _JoyState createState() => _JoyState();
}

class _JoyState extends State<Joy> with SingleTickerProviderStateMixin {

  DateTime _date = DateTime.now();

  final _formKey = GlobalKey<FormState>();
  JoyModel data = new JoyModel("", "", "", DateTime.now(), "");
  @override
  void initState() {
    super.initState();
    data.babyId = widget.baby.id;
  }
  File _image;

  Future uploadFile(BuildContext context) async {  
    final provider = Provider.of<CRUDJoyModel>(context);
    StorageReference storageReference = FirebaseStorage.instance    
        .ref()    
        .child('babies/${widget.baby.id}/joy/${data.id}.jpg');    
    StorageUploadTask uploadTask = storageReference.putFile(_image);    
    await uploadTask.onComplete;    
    storageReference.getDownloadURL().then((fileURL) async {  
      data.imagePath = fileURL;
      await provider.updateJoyModel(data, data.id).then((ret){
        PaintingBinding.instance.imageCache.clear();
        Navigator.pop(context);
      });
    });
  } 

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
            Padding(
              padding: EdgeInsets.all(14.0),
              child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
              ),
            Row(children: <Widget>[
              Expanded(
                  flex: 5,
                  child:Padding(
                padding: EdgeInsets.only(left:14.0, top:30.0, right: 14.0),
                child: GestureDetector(
                  onTap: getImageFromGalery,
                  child:Icon(
                      Icons.photo,
                      size: 42.0,
                      color: Colors.grey[300],
                    ),
                  ))),
              Expanded(
                  flex: 5,
                  child:Padding(
                padding: EdgeInsets.only(left:14.0, top:30.0, right: 14.0),
                child: GestureDetector(
                  onTap: getImage,
                  child:Icon(
                      Icons.photo_camera,
                      size: 42.0,
                      color: Colors.grey[300],
                    ),
                  ))),
            ],)
          ]
        ),
      ),
    ))
  );


  

  }
Widget appBar() {
    final provider = Provider.of<CRUDJoyModel>(context);

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Icon(
            Icons.photo_camera,
            size: 26.0,
            color: Colors.purple,
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            "Joy", style: TextStyle(color: Colors.purple)
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
                await provider.addJoyModel(data).then((id){
                  data.id = id;
                  if(_image != null) uploadFile(context);
                });
            }
          },
          child:Icon(Icons.check, size: 24.0,),
        )
        
        
      ],
    );
  }
}
