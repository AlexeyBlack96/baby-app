import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/api.dart';
import 'package:insta_clone/src/models/baby.dart';
import 'package:insta_clone/src/models/locator.dart';
import 'package:insta_clone/src/models/setting.dart';

class CRUDSettingModel  extends ChangeNotifier{
  //
  Setting setting;
  Api _api = locatorSetting<Api>();


  Future<Setting> getSettingsById(String id) async {
    var result = await _api.getDataCollection();
    var settingData = result.documents.
        map((doc) => Setting.fromMap(doc.data, doc.documentID))
        .toList();
        var ret = settingData.where((b) => b.userId == id).toList();
    if(ret.length > 0){
      return ret[0];
    }
    else{
      return await addSettings(id);
    }
  }

  Future updateSettings(Setting data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }
  Future addSettings(String id) async{
    var data = Setting("","1.0.0",id,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,"","14",true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true);
    await _api.addDocument(data.toJson()) ;
    return data;

  }
}
