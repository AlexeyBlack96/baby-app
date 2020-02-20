class TemperatureModel{
  String babyId;
  String id;
  String note;
  DateTime time;
  String temperature;
  String alarmId;
  
  TemperatureModel(this.id, this.babyId,this.note, this.time, this.temperature, this.alarmId);

  TemperatureModel.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    temperature = snapshot['Temperature']  ?? '',
    alarmId = snapshot['AlarmId'] ?? '';
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "Temperature":temperature,
        "AlarmId":alarmId
      };
    }

}
