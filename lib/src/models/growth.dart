class GrowthModel{
  String babyId;
  String id;
  String note;
  DateTime time;
  String long;
  String weight;
    String head;
  String bmi;
  
  GrowthModel(this.id, this.babyId,this.note, this.time, this.long, this.weight, this.head, this.bmi);

  GrowthModel.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    long = snapshot['TimeLeft'] ?? '',
    weight = snapshot['TimeLeft'] ?? '',
    head = snapshot['TimeLeft'] ?? '',
    bmi = snapshot['TimeLeft'] ?? '';
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "Long":long,
        "Weight":weight,
        "Head":head,
        "BMI":bmi
      };
    }

}
