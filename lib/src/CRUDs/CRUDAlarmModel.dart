import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/alarm.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDAlarmModel  extends ChangeNotifier{
  //
  List<AlarmModel> alarmModels;
  Api _api = locatorAlarmModel<Api>();

  Future<List<AlarmModel>> fetchAlarmModel() async {
    var result = await _api.getDataCollection();
    alarmModels = result.documents
        .map((doc) => AlarmModel.fromMap(doc.data, doc.documentID))
        .toList();
    return alarmModels;
  }

  Stream<QuerySnapshot> fetchalarmModelsAsStream() {
    return _api.streamDataCollection();
  }

  Future<AlarmModel> getAlarmModelById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  AlarmModel.fromMap(doc.data, doc.documentID) ;
  }

  Future<List<AlarmModel>> getAlarmModelByBabyId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => AlarmModel.fromMap(doc.data, doc.documentID))
        .toList();
    alarmModels = productsData.where((b) => b.babyId == id).toList();
    return alarmModels;
  }


  Future removeAlarmModel(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateAlarmModel(AlarmModel data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addAlarmModel(AlarmModel data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return ;
  }
   
}
