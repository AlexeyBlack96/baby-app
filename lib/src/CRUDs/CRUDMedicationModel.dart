import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/medication.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDMedicationModel  extends ChangeNotifier{
  //
  List<MedicationModel> medicationModels;
  Api _api = locatorMedicationModel<Api>();

  Future<List<MedicationModel>> fetchMedicationModel() async {
    var result = await _api.getDataCollection();
    medicationModels = result.documents
        .map((doc) => MedicationModel.fromMap(doc.data, doc.documentID))
        .toList();
    return medicationModels;
  }

  Stream<QuerySnapshot> fetchmedicationModelsAsStream() {
    return _api.streamDataCollection();
  }

  Future<MedicationModel> getMedicationModelById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  MedicationModel.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<MedicationModel>> getMedicationModelByUserId(String id) async {
    var result = await _api.getDataCollection();
    var productsData = result.documents.
        map((doc) => MedicationModel.fromMap(doc.data, doc.documentID))
        .toList();
    medicationModels = productsData.where((b) => b.babyId == id).toList();
    return medicationModels;
  }


  Future removeMedicationModel(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateMedicationModel(MedicationModel data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addMedicationModel(MedicationModel data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
