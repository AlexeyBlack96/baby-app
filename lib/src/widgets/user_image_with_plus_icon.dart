import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/baseAuth.dart';
import 'package:insta_clone/src/utils/ui_image_data.dart';
import 'package:insta_clone/src/screens/create_or_edit_baby.dart';


class UserImageWithPlusIcon extends StatelessWidget {
    final BaseAuth auth;
    final Baby baby;
  final VoidCallback callback;
  UserImageWithPlusIcon({Key key, @required this.baby, this.auth, this.callback}) : super(key: key);

  DecorationImage getImage(){
    if(baby.imagePath.length > 0){
      return DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(baby.imagePath.toString())
              );
    }
    else{
      return DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                UIImageData.child,
              ),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: getImage()
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child:GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Babys(baby: baby, auth: auth,)),
                ).then((onValue) {
                  callback();
                });
              },
              child: Container(
              height: 24.0,
              width: 24.0,
              margin: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            ),
          ),
        ),
      ],
    );
  }
}
