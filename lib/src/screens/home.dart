import 'package:flutter/material.dart';
import 'package:insta_clone/src/CRUDs/CRUDBabyModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSettingModel.dart';
import 'package:insta_clone/src/models/baseAuth.dart';
import 'package:insta_clone/src/models/setting.dart';
import 'package:insta_clone/src/screens/select-baby.dart';
import 'package:insta_clone/src/screens/settings.dart';
import 'package:insta_clone/src/screens/main_page.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/screens/signIn.dart';

import 'package:splashscreen/splashscreen.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class Home extends StatefulWidget {
  Home({this.auth, this.baby});
  final BaseAuth auth;
  final Baby baby;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
  Setting mainSetting;
  Baby sellectedBaby; 

  List<Baby> babys = new List<Baby>();
  CRUDBabyModel babyCRUD = new CRUDBabyModel();
  CRUDSettingModel settingService = new CRUDSettingModel();

  @override
  void initState() {
    sellectedBaby = widget.baby;
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
          settingService.getSettingsById(_userId).then((data){
            mainSetting = data;
          });
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
        
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  // Current active index of bottom navigation bar
  int currentIndex = 0;
  String title = "Baby name";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
            SizedBox(height: 16.0),
              Text(
                '${widget.baby.name}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
        ]
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[50],
          onPressed: (){
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings(auth: widget.auth, setting: mainSetting,)),
                );
          },
          child:Icon(currentIndex == 0 ? Icons.menu : Icons.close, size: 24.0,),
        )
      ],
    ),
      backgroundColor: Colors.white,
      body: Profile(baby: sellectedBaby, auth: widget.auth,),
      
      //bottomNavigationBar: bottomNavBar(),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<MySplashScreen> {
  
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
  Setting mainSetting;
  Baby sellectedBaby; 
  dynamic page;
  List<Baby> babys = new List<Baby>();
  CRUDBabyModel babyCRUD = new CRUDBabyModel();
  CRUDSettingModel settingCRUD = new CRUDSettingModel();

  @override
  void initState() {
    super.initState();
    new Auth().getCurrentUser().then((user) {
      setState(() {
        if (user?.uid != null) {
          print(user?.uid);
          _userId = user?.uid;
          page = new SelectBaby(auth: new Auth(), userId: _userId,); 
        }
        else{
          page = new SignIn(auth: new Auth()); 
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
    settingCRUD.getSettingsById(_userId).then((setting){
      setState(() {
        mainSetting = setting;
        });
    });
  }
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: page,
      title: new Text('Welcome in BabyTracker',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Color(0xffffffff)
      ),),
      image:  Image.asset(
            'assets/images/logo.png'),
      backgroundColor: Color(0xffca709d),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.white
    );
  }
}

