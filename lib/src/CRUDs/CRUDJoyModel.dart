import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/joy.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDJoyModel  extends ChangeNotifier{
  //
  List<JoyModel> joyModels;
  Api _api = locatorJoyModel<Api>();

  Future<List<JoyModel>> fetchJoyModel() async {
    var result = await _api.getDataCollection();
    joyModels = result.documents
        .map((doc) => JoyModel.fromMap(doc.data, doc.documentID))
        .toList();
    return joyModels;
  }

  Stream<QuerySnapshot> fetchJoyModelsAsStream() {
    return _api.streamDataCollection();
  }

  Future<JoyModel> getJoyModelById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  JoyModel.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<JoyModel>> getJoyModelByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => JoyModel.fromMap(doc.data, doc.documentID))
        .toList();
    joyModels = productsData.where((b) => b.babyId == id).toList();
    return joyModels;
  }


  Future removeJoyModel(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateJoyModel(JoyModel data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addJoyModel(JoyModel data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return result.documentID;

  }
   
}
