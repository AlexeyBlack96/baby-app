import 'package:get_it/get_it.dart';
import 'package:insta_clone/src/CRUDs/CRUDAlarmModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDBabyModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDExpressedModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDFeedingModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDFormulaModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDGrowModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDJoyModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDMedicationModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDNappyChangeModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDOtherModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDPumpingModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSettingModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSleepModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDSuplimentModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDTemperatureModel.dart';
import 'package:insta_clone/src/CRUDs/CRUDVaccinationModel.dart';
import 'package:insta_clone/src/models/api.dart';

GetIt locatorBaby = GetIt();
GetIt locatorSetting = GetIt();
GetIt locatorFeeding = GetIt();
GetIt locatorExpressed = GetIt();
GetIt locatorFormula = GetIt();
GetIt locatorSupliment = GetIt();
GetIt locatorNappyChange = GetIt();
GetIt locatorSleepModel = GetIt();
GetIt locatorPumpingModel = GetIt();
GetIt locatorJoyModel = GetIt();
GetIt locatorOtherModel = GetIt();
GetIt locatorGrowthModel = GetIt();
GetIt locatorTemperatureModel = GetIt();
GetIt locatorAlarmModel = GetIt();

GetIt locatorMedicationModel = GetIt();
GetIt locatorVaccinationModel = GetIt();





void setupLocator() {
  locatorBaby.registerLazySingleton(() => Api('babies'));
  locatorBaby.registerLazySingleton(() => CRUDBabyModel());

  locatorSetting.registerLazySingleton(() => CRUDSettingModel());
  locatorSetting.registerLazySingleton(() => Api('settings'));

    locatorFeeding.registerLazySingleton(() => CRUDFeedingModel());
  locatorFeeding.registerLazySingleton(() => Api('feedings'));

    locatorExpressed.registerLazySingleton(() => CRUDExpressedModel());
  locatorExpressed.registerLazySingleton(() => Api('expresseds'));

    locatorFormula.registerLazySingleton(() => CRUDFormulaModel());
  locatorFormula.registerLazySingleton(() => Api('formulas'));

    locatorSupliment.registerLazySingleton(() => CRUDSuplimentModel());
  locatorSupliment.registerLazySingleton(() => Api('Supliments'));

  locatorNappyChange.registerLazySingleton(() => CRUDNappyChangeModel());
  locatorNappyChange.registerLazySingleton(() => Api('NappyChanges'));

  locatorSleepModel.registerLazySingleton(() => CRUDSleepModel());
  locatorSleepModel.registerLazySingleton(() => Api('Sleeps'));

  locatorPumpingModel.registerLazySingleton(() => CRUDPumpingModel());
  locatorPumpingModel.registerLazySingleton(() => Api('Pumpings'));

    locatorJoyModel.registerLazySingleton(() => CRUDJoyModel());
  locatorJoyModel.registerLazySingleton(() => Api('Joys'));

    locatorOtherModel.registerLazySingleton(() => CRUDOtherModel());
  locatorOtherModel.registerLazySingleton(() => Api('Others'));

      locatorGrowthModel.registerLazySingleton(() => CRUDGrowthModel());
  locatorGrowthModel.registerLazySingleton(() => Api('Growths'));

    locatorTemperatureModel.registerLazySingleton(() => CRUDTemperatureModel());
  locatorTemperatureModel.registerLazySingleton(() => Api('Temperatures'));

      locatorMedicationModel.registerLazySingleton(() => CRUDMedicationModel());
  locatorMedicationModel.registerLazySingleton(() => Api('Medications'));

    locatorVaccinationModel.registerLazySingleton(() => CRUDVaccinationModel());
  locatorVaccinationModel.registerLazySingleton(() => Api('Vaccinations'));

      locatorAlarmModel.registerLazySingleton(() => CRUDAlarmModel());
  locatorAlarmModel.registerLazySingleton(() => Api('Alarms'));
}