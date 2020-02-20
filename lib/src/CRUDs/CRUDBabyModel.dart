import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDBabyModel  extends ChangeNotifier{
  //
  List<Baby> products;
  Api _api = locatorBaby<Api>();

  Future<List<Baby>> fetchBaby() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Baby.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchBabiesAsStream() {
    return _api.streamDataCollection();
  }
  

  Future<Baby> getBabyById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Baby.fromMap(doc.data, doc.documentID) ;
  }

  Future<List<Baby>> getBabyByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => Baby.fromMap(doc.data, doc.documentID))
        .toList();
    
    products = productsData.where((b) => b.userId == id).toList();
    return products;
  }

  Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  Future removeBaby(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateBaby(Baby data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addBaby(Baby data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return result.documentID;
  }
}
