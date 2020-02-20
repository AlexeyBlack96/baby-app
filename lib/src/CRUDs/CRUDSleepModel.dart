import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/feeding.dart';
import 'package:insta_clone/src/models/locator.dart';
import 'package:insta_clone/src/models/sleep.dart';

class CRUDSleepModel  extends ChangeNotifier{
  //
  List<SleepModel> sleepModels;
  Api _api = locatorSleepModel<Api>();

  Future<List<SleepModel>> fetchSleepModel() async {
    var result = await _api.getDataCollection();
    sleepModels = result.documents
        .map((doc) => SleepModel.fromMap(doc.data, doc.documentID))
        .toList();
    return sleepModels;
  }

  Stream<QuerySnapshot> fetchsleepModelsAsStream() {
    return _api.streamDataCollection();
  }

  Future<SleepModel> getSleepModelById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  SleepModel.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<SleepModel>> getSleepModelByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => SleepModel.fromMap(doc.data, doc.documentID))
        .toList();
    sleepModels = productsData.where((b) => b.babyId == id).toList();
    return sleepModels;
  }


  Future removeSleepModel(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateSleepModel(SleepModel data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addSleepModel(SleepModel data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
