import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/vaccination.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDVaccinationModel  extends ChangeNotifier{
  //
  List<VaccinationModel> vaccinationModels;
  Api _api = locatorVaccinationModel<Api>();

  Future<List<VaccinationModel>> fetchVaccinationModel() async {
    var result = await _api.getDataCollection();
    vaccinationModels = result.documents
        .map((doc) => VaccinationModel.fromMap(doc.data, doc.documentID))
        .toList();
    return vaccinationModels;
  }

  Stream<QuerySnapshot> fetchVaccinationModelsAsStream() {
    return _api.streamDataCollection();
  }

  Future<VaccinationModel> getVaccinationModelById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  VaccinationModel.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<VaccinationModel>> getVaccinationModelByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => VaccinationModel.fromMap(doc.data, doc.documentID))
        .toList();
    vaccinationModels = productsData.where((b) => b.babyId == id).toList();
    return vaccinationModels;
  }


  Future removeVaccinationModel(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateVaccinationModel(VaccinationModel data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addVaccinationModel(VaccinationModel data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return ;
  }
   
}
