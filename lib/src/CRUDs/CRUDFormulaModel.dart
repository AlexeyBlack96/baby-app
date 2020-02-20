import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/formula.dart';
import 'package:insta_clone/src/models/locator.dart';

class CRUDFormulaModel  extends ChangeNotifier{
  //
  List<Formula> formula;
  Api _api = locatorFormula<Api>();

  Future<List<Formula>> fetchFormula() async {
    var result = await _api.getDataCollection();
    formula = result.documents
        .map((doc) => Formula.fromMap(doc.data, doc.documentID))
        .toList();
    return formula;
  }

  Stream<QuerySnapshot> fetchBabiesAsStream() {
    return _api.streamDataCollection();
  }

  Future<Formula> getFormulaById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Formula.fromMap(doc.data, doc.documentID) ;
  }
  Future<List<Formula>> getFormulaByUserId(String id) async {
    var result = await _api.getDataCollection();
    var formulaData = result.documents.
        map((doc) => Formula.fromMap(doc.data, doc.documentID))
        .toList();
    formula = formulaData.where((b) => b.babyId == id).toList();
    return formula;
  }


  Future removeFormula(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateFormula(Formula data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addFormula(Formula data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }
   
}
