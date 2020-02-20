class SleepModel{
  String babyId;
  String id;
  String note;
  DateTime time;
  DateTime awoke;
  
  SleepModel(this.id, this.babyId,this.note, this.time, this.awoke);

  SleepModel.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    awoke = snapshot['Awoke'] != null ? snapshot['Awoke'].toDate() : DateTime.now();
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "Awoke":awoke,
      };
    }

}
