class MedicationModel{
  String babyId;
  String id;
  String note;
  DateTime time;
  String drug;
  String count;
    String alarmId;
  
  MedicationModel(this.id, this.babyId,this.note, this.time, this.drug, this.count);

  MedicationModel.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    drug = snapshot['Drug'] ?? '',
    alarmId = snapshot['AlarmId'] ?? '',
    count = snapshot['Count'] ?? '';
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "Drug":drug,
        "AlarmId":alarmId,
        "Count":count
      };
    }

}
