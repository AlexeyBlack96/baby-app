import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:insta_clone/src/CRUDs/CRUDExpressedModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDFeedingModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDFormulaModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDGrowModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDJoyModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDMedicationModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDNappyChangeModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDOtherModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDPumpingModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSleepModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSuplimentModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDTemperatureModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDVaccinationModel.dart';
import 'package:insta_clone/src/models/expressed.dart';
import 'package:insta_clone/src/models/feeding.dart';
import 'package:insta_clone/src/models/formula.dart';
import 'package:insta_clone/src/models/growth.dart';
import 'package:insta_clone/src/models/joy.dart';
import 'package:insta_clone/src/models/medication.dart';
import 'package:insta_clone/src/models/nappy-change.dart';
import 'package:insta_clone/src/models/others.dart';
import 'package:insta_clone/src/models/pumping.dart';
import 'package:insta_clone/src/models/sleep.dart';
import 'package:insta_clone/src/models/supliment.dart';
import 'package:insta_clone/src/models/temperature.dart';
import 'package:insta_clone/src/models/vaccination.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:intl/intl.dart';


class EventTab extends StatefulWidget {
  @override
  final Baby baby;
  List<NappyChange> nappyChangeList;
  List<Feeding> feedingList;
  List<Expressed> expressedList;
  List<Formula> formulaList;
  List<Supliment> suplimentList;
  List<SleepModel> sleepList;
  List<PumpingModel> pumpingList;
  List<TemperatureModel> temperatureList;
  List<VaccinationModel> vaccinationList;
  List<MedicationModel> medicationList;
  List<JoyModel> joyList;
  List<GrowthModel> growthList;
  List<OtherModel> otherList;

  EventTab({
    Key key, 
    @required this.baby,
    this.nappyChangeList,
    this.feedingList,
    this.expressedList, 
    this.formulaList, 
    this.suplimentList, 
    this.sleepList,
    this.pumpingList,
    this.temperatureList,
    this.vaccinationList,
    this.medicationList,
    this.joyList,
    this.growthList,
    this.otherList
     }) : super(key: key);
  _EventTab createState() => _EventTab();
}
class Event{
  String eventTypeId;
  String eventId;
  DateTime date;
  Object data;
  Event(this.eventTypeId, this.eventId,this.date);

  Event.fromMap(String id, String typeId, DateTime time) : 
    eventTypeId = typeId,
    eventId = id,
    date = time;
}

class _EventTab extends State<EventTab> with SingleTickerProviderStateMixin {
  CRUDNappyChangeModel nappyChange = new CRUDNappyChangeModel();
  CRUDFeedingModel feeding = new CRUDFeedingModel();
  CRUDExpressedModel expressed = new CRUDExpressedModel();
  CRUDFormulaModel formula = new CRUDFormulaModel();
  CRUDSuplimentModel supliment = new CRUDSuplimentModel();
  CRUDSleepModel sleep = new CRUDSleepModel();
  CRUDPumpingModel pumping = new CRUDPumpingModel();
  CRUDTemperatureModel temperature = new CRUDTemperatureModel();
  CRUDVaccinationModel vaccination = new CRUDVaccinationModel();
  CRUDMedicationModel medication = new CRUDMedicationModel();
  CRUDJoyModel joy = new CRUDJoyModel();
  CRUDGrowthModel growth = new CRUDGrowthModel();
  CRUDOtherModel other = new CRUDOtherModel();

  List<List<Event>> eventsList = new List<List<Event>>();
  @override
  void initState() {
    super.initState();
    getDate();
  }
  
  List<List<Event>> getDate(){
    List<Event> events = new List<Event>();

    events.addAll(widget.nappyChangeList.map((doc) => Event.fromMap(doc.id, "nappyChange", doc.time)));
    events.addAll(widget.feedingList.map((doc) => Event.fromMap(doc.id, "feeding", doc.time)));
    events.addAll(widget.expressedList.map((doc) => Event.fromMap(doc.id, "expressed", doc.time)));
    events.addAll(widget.formulaList.map((doc) => Event.fromMap(doc.id, "formula", doc.time)));
    events.addAll(widget.suplimentList.map((doc) => Event.fromMap(doc.id, "supliment", doc.time)));
    events.addAll(widget.sleepList.map((doc) => Event.fromMap(doc.id, "sleep", doc.time)));
    events.addAll(widget.pumpingList.map((doc) => Event.fromMap(doc.id, "pumping", doc.time)));
    events.addAll(widget.temperatureList.map((doc) => Event.fromMap(doc.id, "temperature", doc.time)));
    events.addAll(widget.vaccinationList.map((doc) => Event.fromMap(doc.id, "vaccination", doc.time)));
    events.addAll(widget.medicationList.map((doc) => Event.fromMap(doc.id, "medication", doc.time)));
    events.addAll(widget.joyList.map((doc) => Event.fromMap(doc.id, "joy", doc.time)));
    events.addAll(widget.growthList.map((doc) => Event.fromMap(doc.id, "growth", doc.time)));
    events.addAll(widget.otherList.map((doc) => Event.fromMap(doc.id, "other", doc.time)));
    events.sort((a,b) => a.date.compareTo(b.date));
    
    events.forEach((d){
      if(!(eventsList.length > 0) || eventsList.last.last.date.day != d.date.day){
        List<Event> newList = List<Event>();
        newList.add(d);
        eventsList.add(newList);
      }
      else{
        eventsList.last.add(d.data);
      }
    });
    return eventsList;
  }

  // Widget getEvent(List<List<Event>> ev){
  //   return
  // }

  Widget getByDay(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(14.0),
          child: Text(
            'text',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget getContent(List<Event> ev){
    print(ev.length);
    return Card(
          child:Padding(
            padding: EdgeInsets.all(14.0),
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  children: <Widget>[
                    Text("${DateFormat('EEEE').format(ev.last.date)}", style: TextStyle(
                          color: Color(0xff3879c1),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        )),
                    Text("${ev.last.date.day}", style: TextStyle(
                          color: Color(0xff3879c1),
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        )),
                    Text("${ev.last.date.month}", style: TextStyle(
                          color: Color(0xff3879c1),
                          fontSize: 14.0,
                        )),
                    Text("${ev.last.date.year}", style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ))
                  ]
                ),
              ),
              Expanded(
                child: getByDay()
              ),
            ],
          ),
        )
      );
    }






  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: eventsList.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(14.0),
              child: getContent(eventsList[index]),
            );
          }
        );
  }
}
