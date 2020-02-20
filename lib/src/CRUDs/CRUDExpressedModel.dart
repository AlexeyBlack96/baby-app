import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/expressed.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDExpressedModel  extends ChangeNotifier{
  //
  List<Expressed> expressed;
  Api _api = locatorExpressed<Api>();

  Future<List<Expressed>> fetchExpressed() async {
    var result = await _api.getDataCollection();
    expressed = result.documents
        .map((doc) => Expressed.fromMap(doc.data, doc.documentID))
        .toList();
    return expressed;
  }

  Stream<QuerySnapshot> fetchBabiesAsStream() {
    return _api.streamDataCollection();
  }

  Future<Expressed> getExpressedById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Expressed.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<Expressed>> getExpressedByUserId(String id) async {
    var result = await _api.getDataCollection();
    var expressedData = result.documents.
        map((doc) => Expressed.fromMap(doc.data, doc.documentID))
        .toList();
    expressed = expressedData.where((b) => b.babyId == id).toList();
    return expressed;
  }


  Future removeExpressed(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateExpressed(Expressed data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addExpressed(Expressed data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
