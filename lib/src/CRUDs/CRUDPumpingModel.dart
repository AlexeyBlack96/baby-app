import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/feeding.dart';
import 'package:insta_clone/src/models/locator.dart';
import 'package:insta_clone/src/models/pumping.dart';

class CRUDPumpingModel  extends ChangeNotifier{
  //
  List<PumpingModel> pumpings;
  Api _api = locatorPumpingModel<Api>();

  Future<List<PumpingModel>> fetchPumpingModel() async {
    var result = await _api.getDataCollection();
    pumpings = result.documents
        .map((doc) => PumpingModel.fromMap(doc.data, doc.documentID))
        .toList();
    return pumpings;
  }

  Stream<QuerySnapshot> fetchpumpingsAsStream() {
    return _api.streamDataCollection();
  }

  Future<PumpingModel> getPumpingModelById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  PumpingModel.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<PumpingModel>> getPumpingModelByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => PumpingModel.fromMap(doc.data, doc.documentID))
        .toList();
    pumpings = productsData.where((b) => b.babyId == id).toList();
    return pumpings;
  }


  Future removePumpingModel(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updatePumpingModel(PumpingModel data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addPumpingModel(PumpingModel data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
