import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/locator.dart';
import 'package:insta_clone/src/models/nappy-change.dart';

class CRUDNappyChangeModel  extends ChangeNotifier{
  //
  List<NappyChange> nappyChange;
  Api _api = locatorNappyChange<Api>();

  Future<List<NappyChange>> fetchNappyChange() async {
    var result = await _api.getDataCollection();
    nappyChange = result.documents
        .map((doc) => NappyChange.fromMap(doc.data, doc.documentID))
        .toList();
    return nappyChange;
  }

  Stream<QuerySnapshot> fetchnappyChangeAsStream() {
    return _api.streamDataCollection();
  }

  Future<NappyChange> getNappyChangeById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  NappyChange.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<NappyChange>> getNappyChangeByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => NappyChange.fromMap(doc.data, doc.documentID))
        .toList();
    nappyChange = productsData.where((b) => b.babyId == id).toList();
    return nappyChange;
  }


  Future removeNappyChange(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateNappyChange(NappyChange data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addNappyChange(NappyChange data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
