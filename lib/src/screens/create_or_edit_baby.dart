import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/models/baseAuth.dart';
import 'package:insta_clone/src/CRUDs/CRUDBabyModel.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';
import 'package:provider/provider.dart';


class Babys extends StatefulWidget {
  @override
  final Baby baby;
  final BaseAuth auth;

  Babys({Key key, @required this.baby, this.auth}) : super(key: key);
  _Babys createState() => _Babys();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _Babys extends State<Babys> with SingleTickerProviderStateMixin {
  CRUDBabyModel babyCRUD = new CRUDBabyModel();
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
  final _formKey = GlobalKey<FormState>();
  String fileName;
  File _image;
  DateTime _date = DateTime.now();
  double pi = 3.1415926535897932;

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus = user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  _onChange(bool value){
    setState(() {
      widget.baby.isWomen = value;
    });
  }
    Future uploadFile(BuildContext context) async {  
    final babyProvider = Provider.of<CRUDBabyModel>(context);
  
    StorageReference storageReference = FirebaseStorage.instance.ref()    
        .child('babies/${widget.baby.id}/${_image.path.split("/").last}');    
    StorageUploadTask uploadTask = storageReference.putFile(_image);    
    await uploadTask.onComplete;    
    storageReference.getDownloadURL().then((fileURL) async {  
      widget.baby.imagePath = fileURL;
      await babyProvider.updateBaby(widget.baby, widget.baby.id).then((ret){
        Navigator.pop(context);
      });
    });
  } 

  Future setImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      if( image != null ){
        fileName = image.path;
      }
    });
  }

  Future setImageFromGalery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      if( image != null ){
        fileName = image.path;
      }
    });
  }

  DecorationImage getImage(){
    if(widget.baby.imagePath.length > 0 && fileName == null){
      return DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.baby.imagePath.toString())
              );
    }
    else{
      return DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                fileName ?? UIImageData.child,
              ),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    final babyProvider = Provider.of<CRUDBabyModel>(context);
    _date = widget.baby.birthDate;
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Text(
            widget.baby.id == "" ? "Create" : "Edit",
            style: TextStyle(),
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
              if(widget.baby.id == ""){
                await babyProvider.addBaby(widget.baby)
                .then((onValue) async {
                  widget.baby.id = onValue;
                  if(_image != null){
                    await uploadFile(context);
                  } else {
                    Navigator.pop(context);
                  }
                });
              } else {
                if(_image != null){
                  await uploadFile(context);
                } else {
                  await babyProvider.updateBaby(widget.baby, widget.baby.id);
                  Navigator.pop(context);
                }
              }
            }
          },
          child:Icon(Icons.check, size: 24.0,),
        )
      ],
    ),
      backgroundColor: Colors.white,
      body: Scaffold(
          body: Container(
          child: Form(
            key: _formKey,
            child: ListView(
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: getImage()
                          )
                        )
                      )
                    ]
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(children: <Widget>[
                  Expanded(
                    flex: 5,
                    child:Padding(
                    padding: EdgeInsets.only(left:14.0, top:30.0, right: 14.0),
                    child: GestureDetector(
                      onTap: setImageFromGalery,
                      child:Icon(
                          Icons.photo,
                          size: 42.0,
                          color: Colors.grey[300],
                        ),
                      )
                    )
                  ),
                  Expanded(
                    flex: 5,
                    child:Padding(
                      padding: EdgeInsets.only(left:14.0, top:30.0, right: 14.0),
                      child: GestureDetector(
                        onTap: setImage,
                        child: Icon(
                          Icons.photo_camera,
                          size: 42.0,
                          color: Colors.grey[300],
                        ),
                      )
                    )
                  ),
                ],)
              ),
            ],),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextFormField(
                initialValue: widget.baby.name,
              decoration: InputDecoration(
                hintText: 'Baby Name'
              ),
              onSaved: (value) => widget.baby.name = value,
            )
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('Birth Date'),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child:  FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true,
                    minTime: DateTime(2000, 1, 1),
                    maxTime: DateTime.now(), 
                    onConfirm: (date) {                    
                      setState(() {
                        _date = date;
                        widget.baby.birthDate = date;
                      });
                    },
                    currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${_date.day}.${_date.month}.${_date.year}',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ),
            
            Row(children: <Widget>[
              Expanded(
                flex: 5,
                child:Padding(
                  padding: EdgeInsets.only(left:14.0, top:30.0, right: 14.0),
                  child: GestureDetector(
                    onTap: (){
                      _onChange(true);
                    },
                    child: Transform.rotate(
                      angle: 0 * pi / 180,
                      child: Icon(
                        CustomIcons.man,
                        size: 42.0,
                        color: !widget.baby.isWomen ? Colors.grey[300] : Colors.blue[300],
                      ),
                    )
                  )
                )
              ),
              Expanded(
                flex: 5,
                child:Padding(
                  padding: EdgeInsets.only(left:14.0, top:30.0, right: 14.0),
                  child: GestureDetector(
                    onTap: (){
                      _onChange(false);
                    },
                    child:Transform.rotate(
                      angle: 0 * pi / 180,
                      child: Icon(
                        CustomIcons.woman,
                        size: 42.0,
                        color: widget.baby.isWomen ? Colors.grey[300] : Colors.blue[300],
                      ),
                    )
                  )
                )
              ),
            ],),
          ]
        ),
          )
      ),
    )
  );
}
}
