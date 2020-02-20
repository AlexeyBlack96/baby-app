import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:insta_clone/src/customIcons/custom_icons.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/feeding.dart' as model;
import 'package:insta_clone/src/services/services.dart';
import 'package:provider/provider.dart';
import 'package:insta_clone/src/CRUDs/CRUDFeedingModel.dart';

class Feeding extends StatefulWidget {
  @override
  final Baby baby;
  Feeding({Key key, @required this.baby}) : super(key: key);
  _FeedingState createState() => _FeedingState();
}

class _FeedingState extends State<Feeding> with SingleTickerProviderStateMixin {

  Stopwatch stopwatch = new Stopwatch();
  DateTime _date = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  model.Feeding data = new model.Feeding("", "", "", DateTime.now(), null, null);
  Timer timer;

  @override
  void initState() {
    super.initState();
    data.babyId = widget.baby.id;
  }

  @override
  Widget build(BuildContext context) {
    var timerService = TimerService.of(context);
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
              Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: AnimatedBuilder(
                    animation: timerService, // listen to ChangeNotifier
                    builder: (context, child) {
                      // this part is rebuilt whenever notifyListeners() is called
                      return Column(
                        children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left:14.0, top:14.0, right: 14.0),
                              child: Text('Left'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
                              child: Card(
                                child:ListTile(
                                title:  Text('${timerService.currentDurationL.inMinutes}:${timerService.currentDurationL.inSeconds}'),
                                )
                              ),
                            ),
                            
                          ],
                        );
                      },
                    ),
                ),
                Expanded(
                  flex: 5,
                  child: AnimatedBuilder(
                      animation: timerService, // listen to ChangeNotifier
                      builder: (context, child) {
                        // this part is rebuilt whenever notifyListeners() is called
                        return Column(
                          children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left:14.0, top:14.0, right: 14.0),
                                child: Text('Right'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
                                child: Card(
                                  child: ListTile(
                                  title:Text('${timerService.currentDurationR.inMinutes}:${timerService.currentDurationR.inSeconds}'),
                                  )
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                )
              ],
            ),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(14.0),
                          child: ButtonTheme(
                          minWidth: 65.0,
                          height: 65.0,
                          buttonColor: Colors.transparent,
                          child: AnimatedBuilder(
                      animation: timerService, // listen to ChangeNotifier
                      builder: (context, child) {
                        return RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                              side: BorderSide(color: Colors.orange)
                            ),
                            textColor: Colors.orange,
                            color: Colors.white10, //specify background color for the button here
                            onPressed: !timerService.isRunningL ? timerService.startL : timerService.stopL,
                            child: Row(children: <Widget>[Text("L"),Icon(!timerService.isRunningL ? Icons.play_arrow : Icons.pause)],),
                          );
                        })
                        ),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.all(14.0),
                          child: ButtonTheme(
                          minWidth: 65.0,
                          height: 65.0,
                          buttonColor: Colors.transparent,
                          child: AnimatedBuilder(
                            animation: timerService, // listen to ChangeNotifier
                            builder: (context, child) {
                              return RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(50.0),
                                    side: BorderSide(color: Colors.orange)
                                  ),
                                  textColor: Colors.orange,
                                  color: Colors.white10, //specify background color for the button here
                                  onPressed: (){
                                    !timerService.isRunningR ? timerService.startR() : timerService.stopR();
                                  },
                                  child: Row(children: <Widget>[Text("R"),Icon(!timerService.isRunningR ? Icons.play_arrow : Icons.pause)],),
                                );
                            }
                        )
                      ),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.all(14.0),
                          child: ButtonTheme(
                          minWidth: 65.0,
                          height: 65.0,
                          buttonColor: Colors.transparent,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                              side: BorderSide(color: Colors.orange)
                            ),
                            textColor: Colors.orange,
                            color: Colors.white10, //specify background color for the button here
                            onPressed: (){
                            timerService.stopL();
                            timerService.stopR();
                            data.timeLeft = '${timerService.currentDurationL.inMinutes}:${timerService.currentDurationL.inSeconds}';
                            data.timeRight = '${timerService.currentDurationR.inMinutes}:${timerService.currentDurationR.inSeconds}';
                          },
                          child: Icon(Icons.stop),
                          ),
                        ),
                        ),
                      ]
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
              onSaved: (val) => data.note = val,
            )
            ),
            
          ]
        ),
      ),
    )
    )
  );


  

  }
Widget appBar() {
    final formulaProvider = Provider.of<CRUDFeedingModel>(context);
    var timerService = TimerService.of(context);

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Icon(
            CustomIcons.babyFood,
            size: 26.0,
            color: Colors.orange,
          ),
          Padding(
            padding: EdgeInsets.only(left:14.0, top:0.0, right: 14.0),
            child: Text(
            "Feeding", style: TextStyle(color: Colors.orange)
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
                await formulaProvider.addFeeding(data);
                Navigator.pop(context);
                timerService.resetL();
                timerService.resetR();
            }
          },
          child:Icon(Icons.check, size: 24.0,),
        )
      ],
    );
  }
}
