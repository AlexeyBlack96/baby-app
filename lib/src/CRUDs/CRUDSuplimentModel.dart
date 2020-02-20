import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/locator.dart';
import 'package:insta_clone/src/models/supliment.dart';

class CRUDSuplimentModel  extends ChangeNotifier{
  //
  List<Supliment> supliments;
  Api _api = locatorSupliment<Api>();

  Future<List<Supliment>> fetchSupliment() async {
    var result = await _api.getDataCollection();
    supliments = result.documents
        .map((doc) => Supliment.fromMap(doc.data, doc.documentID))
        .toList();
    return supliments;
  }

  Stream<QuerySnapshot> fetchBabiesAsStream() {
    return _api.streamDataCollection();
  }

  Future<Supliment> getSuplimentById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Supliment.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<Supliment>> getSuplimentByUserId(String id) async {
    var result = await _api.getDataCollection();
    var suplimentsData = result.documents.
        map((doc) => Supliment.fromMap(doc.data, doc.documentID))
        .toList();
    supliments = suplimentsData.where((b) => b.babyId == id).toList();
    return supliments;
  }


  Future removeSupliment(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateSupliment(Supliment data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addSupliment(Supliment data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
