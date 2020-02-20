import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/others.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDOtherModel  extends ChangeNotifier{
  //
  List<OtherModel> otherModels;
  Api _api = locatorOtherModel<Api>();

  Future<List<OtherModel>> fetchOtherModel() async {
    var result = await _api.getDataCollection();
    otherModels = result.documents
        .map((doc) => OtherModel.fromMap(doc.data, doc.documentID))
        .toList();
    return otherModels;
  }

  Stream<QuerySnapshot> fetchOtherModelsAsStream() {
    return _api.streamDataCollection();
  }

  Future<OtherModel> getOtherModelById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  OtherModel.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<OtherModel>> getOtherModelByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => OtherModel.fromMap(doc.data, doc.documentID))
        .toList();
    otherModels = productsData.where((b) => b.babyId == id).toList();
    return otherModels;
  }


  Future removeOtherModel(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateOtherModel(OtherModel data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addOtherModel(OtherModel data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
