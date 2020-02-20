import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/growth.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDGrowthModel  extends ChangeNotifier{
  //
  List<GrowthModel> GrowthModels;
  Api _api = locatorGrowthModel<Api>();

  Future<List<GrowthModel>> fetchGrowthModel() async {
    var result = await _api.getDataCollection();
    GrowthModels = result.documents
        .map((doc) => GrowthModel.fromMap(doc.data, doc.documentID))
        .toList();
    return GrowthModels;
  }

  Stream<QuerySnapshot> fetchGrowthModelsAsStream() {
    return _api.streamDataCollection();
  }

  Future<GrowthModel> getGrowthModelById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  GrowthModel.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<GrowthModel>> getGrowthModelByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => GrowthModel.fromMap(doc.data, doc.documentID))
        .toList();
    GrowthModels = productsData.where((b) => b.babyId == id).toList();
    return GrowthModels;
  }


  Future removeGrowthModel(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateGrowthModel(GrowthModel data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addGrowthModel(GrowthModel data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
