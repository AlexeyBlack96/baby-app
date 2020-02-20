import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/feeding.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDFeedingModel  extends ChangeNotifier{
  //
  List<Feeding> feedings;
  Api _api = locatorFeeding<Api>();

  Future<List<Feeding>> fetchFeeding() async {
    var result = await _api.getDataCollection();
    feedings = result.documents
        .map((doc) => Feeding.fromMap(doc.data, doc.documentID))
        .toList();
    return feedings;
  }

  Stream<QuerySnapshot> fetchFeedingsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Feeding> getFeedingById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Feeding.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<Feeding>> getFeedingByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => Feeding.fromMap(doc.data, doc.documentID))
        .toList();
    feedings = productsData.where((b) => b.babyId == id).toList();
    return feedings;
  }


  Future removeFeeding(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateFeeding(Feeding data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addFeeding(Feeding data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
