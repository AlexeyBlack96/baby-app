import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/temperature.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDTemperatureModel  extends ChangeNotifier{
  //
  List<TemperatureModel> temperatureModels;
  Api _api = locatorTemperatureModel<Api>();

  Future<List<TemperatureModel>> fetchTemperatureModel() async {
    var result = await _api.getDataCollection();
    temperatureModels = result.documents
        .map((doc) => TemperatureModel.fromMap(doc.data, doc.documentID))
        .toList();
    return temperatureModels;
  }

  Stream<QuerySnapshot> fetchTemperatureModelsAsStream() {
    return _api.streamDataCollection();
  }

  Future<TemperatureModel> getTemperatureModelById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  TemperatureModel.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<TemperatureModel>> getTemperatureModelByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => TemperatureModel.fromMap(doc.data, doc.documentID))
        .toList();
    temperatureModels = productsData.where((b) => b.babyId == id).toList();
    return temperatureModels;
  }


  Future removeTemperatureModel(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateTemperatureModel(TemperatureModel data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addTemperatureModel(TemperatureModel data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
