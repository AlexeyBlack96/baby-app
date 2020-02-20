import 'package:flutter/material.dart';
import 'package:insta_clone/src/CRUDs/CRUDSettingModel.dart';
import 'package:insta_clone/src/models/baseAuth.dart';
import 'package:insta_clone/src/screens/select-baby.dart';

class SignIn extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback loginCallback;

  SignIn({this.auth, this.loginCallback});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;
  bool _isLoginForm;
  bool _isLoading;
  String userId = "";


  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectBaby(auth: widget.auth, userId: userId,)));
        } else {
          userId = await widget.auth.signUp(_email, _password);
          CRUDSettingModel settingCRUD =  new CRUDSettingModel();
          settingCRUD.addSettings(userId);
        }
        setState(() {
          _isLoading = false;
        });
        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

@override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
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
            child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                    hintText: 'Email',
                    icon: new Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )),
                validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                onSaved: (value) => _email = value.trim(),
            )
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: TextFormField(
                maxLines: 1,
                obscureText: true,
                decoration: new InputDecoration(
                    hintText: 'Password',
                    icon: new Icon(
                      Icons.lock,
                      color: Colors.grey,
                    )),
                validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                onSaved: (value) => _password = value.trim(),
              ),
            ),
            GestureDetector(
              onTap: toggleFormMode,
              child: Card(
                child: ListTile(
                  title: Text(_isLoginForm ? "Sign Up" : "Sign In", textAlign: TextAlign.center,),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Text('If the sync is disabled with a merge error message, please disconnect all devices first. Then on the device that has all data, login with the "Reset group" option on. After doing this, you can try to login to this group on all devices again.'),
            ),

            GestureDetector(
              onTap: (){

              },
              child: Card(
                child: ListTile(
                  title: Text('Reset group'),
                  trailing: Switch(
                    value: true,
                    onChanged: (bool value){

                    },
                  ),
                ),
              ),
            ),
          
          showErrorMessage()]
        ),
          )
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
            _isLoginForm ? "Sign In" : "Sign Up",
            style: TextStyle(),
          ),
          SizedBox(width: 4.0),
          
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.grey[50],
          onPressed: validateAndSubmit,
          child:Icon(Icons.check, size: 24.0,),
        )
      ],
    );
  }


  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
}
