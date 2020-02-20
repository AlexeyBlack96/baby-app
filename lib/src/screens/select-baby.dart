import 'package:flutter/material.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/CRUDs/CRUDBabyModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSettingModel.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/baseAuth.dart';
import 'package:insta_clone/src/models/setting.dart';
import 'package:insta_clone/src/screens/create_or_edit_baby.dart' as prefix0;
import 'package:insta_clone/src/screens/home.dart';
import 'package:insta_clone/src/screens/signIn.dart';
import 'package:insta_clone/src/widgets/user_image_with_plus_icon.dart';

class SelectBaby extends StatefulWidget {
  
  SelectBaby({this.auth, this.setting, this.userId});
  final BaseAuth auth;
  final Setting setting;
  final String userId;

  @override
  _SelectBaby createState() => _SelectBaby();
}

class _SelectBaby extends State<SelectBaby> with SingleTickerProviderStateMixin {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
  Setting mainSetting;
  Baby sellectedBaby; 

  List<Baby> babys = new List<Baby>();
  CRUDBabyModel babyCRUD = new CRUDBabyModel();
  CRUDSettingModel settingCRUD = new CRUDSettingModel();

  getBabies(){
    babyCRUD.getBabyByUserId(_userId).then((data){
      setState(() {
      babys = data;
        if(babys.length == 0){
          Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => prefix0.Babys(baby: Baby("",_userId,"","",DateTime.now(),false), auth: widget.auth,)))
          .then((onValue){
            initState();
          });
        }else{
          sellectedBaby = babys[0];
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _userId = widget.userId;
    if(_userId == ""){
    Navigator.push(
          context,
      MaterialPageRoute(builder: (context) => SignIn(auth: widget.auth,
      loginCallback: (){
        Navigator.push(
          context,
        MaterialPageRoute(builder: (context) => SelectBaby(auth: widget.auth)));
      })));
    }
    getBabies();
    settingCRUD.getSettingsById(_userId).then((setting){
      setState(() {
      mainSetting = setting;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Scaffold(
          body: Container(
          child: 
            ListView.builder(
            itemCount: babys.length,
            itemBuilder: (context, index){
              return Padding(
              padding: EdgeInsets.all(14.0),
              child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(14.0),
                  child: UserImageWithPlusIcon(baby: babys[index], auth: widget.auth, callback: (){
                    getBabies();
                  }),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      Text(
                        '${babys[index].name}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '${babys[index].birthDate.day}/${babys[index].birthDate.month}/${babys[index].birthDate.year}',
                        style: TextStyle(),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home(baby:babys[index], auth: widget.auth,)),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 24.0),
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
                            'Select Baby',
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
              ],

            ),
            );
            },
            
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
            "Select Baby",
            style: TextStyle(),
          ),
          SizedBox(width: 4.0),
          
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[50],
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => prefix0.Babys(baby: new Baby("", _userId, "","", DateTime.now(), false), auth: widget.auth,)),
              ).then((onValue){
            getBabies();
          });
          },
          child:Icon(CustomIcons.add, size: 24.0,),
        )
      ],
    );
  }
}

