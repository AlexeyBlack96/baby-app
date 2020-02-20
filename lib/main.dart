import 'package:flutter/material.dart';
import 'package:insta_clone/src/app.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/models/locator.dart';
import 'package:insta_clone/src/screens/feeding.dart';
import 'package:insta_clone/src/services/services.dart';
import 'package:provider/provider.dart';
import 'package:insta_clone/src/CRUDs/CRUDBabyModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSettingModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDFormulaModel.dart';

import 'package:insta_clone/src/CRUDs/CRUDFeedingModel.dart';

import 'package:insta_clone/src/CRUDs/CRUDSuplimentModel.dart';

import 'package:insta_clone/src/CRUDs/CRUDExpressedModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDNappyChangeModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSleepModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDPumpingModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDTemperatureModel.dart';

import 'package:insta_clone/src/CRUDs/CRUDVaccinationModel.dart';

import 'package:insta_clone/src/CRUDs/CRUDOtherModel.dart';

import 'package:insta_clone/src/CRUDs/CRUDMedicationModel.dart';

import 'package:insta_clone/src/CRUDs/CRUDJoyModel.dart';

import 'package:insta_clone/src/CRUDs/CRUDGrowModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDAlarmModel.dart';



void main() {
  final timerService = TimerService();
  setupLocator();
  runApp(TimerServiceProvider( // provide timer service to all widgets of your app
      service: timerService,
      child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => locatorBaby<CRUDBabyModel>()),
        ChangeNotifierProvider(builder: (_) => locatorSetting<CRUDSettingModel>()),
        ChangeNotifierProvider(builder: (_) => locatorFormula<CRUDFormulaModel>()),
        ChangeNotifierProvider(builder: (_) => locatorFeeding<CRUDFeedingModel>()),
        ChangeNotifierProvider(builder: (_) => locatorSupliment<CRUDSuplimentModel>()),
        ChangeNotifierProvider(builder: (_) => locatorExpressed<CRUDExpressedModel>()),
        ChangeNotifierProvider(builder: (_) => locatorNappyChange<CRUDNappyChangeModel>()),
        ChangeNotifierProvider(builder: (_) => locatorSleepModel<CRUDSleepModel>()),
        ChangeNotifierProvider(builder: (_) => locatorAlarmModel<CRUDAlarmModel>()),
        ChangeNotifierProvider(builder: (_) => locatorPumpingModel<CRUDPumpingModel>()),
        ChangeNotifierProvider(builder: (_) => locatorTemperatureModel<CRUDTemperatureModel>()),
        ChangeNotifierProvider(builder: (_) => locatorVaccinationModel<CRUDVaccinationModel>()),
        ChangeNotifierProvider(builder: (_) => locatorOtherModel<CRUDOtherModel>()),
        ChangeNotifierProvider(builder: (_) => locatorMedicationModel<CRUDMedicationModel>()),
        ChangeNotifierProvider(builder: (_) => locatorJoyModel<CRUDJoyModel>()),
        ChangeNotifierProvider(builder: (_) => locatorGrowthModel<CRUDGrowthModel>()),
      ],
      child: App(),
    );
  }
}