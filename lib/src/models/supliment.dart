class Supliment{
  String babyId;
  String id;
  String note;
  String count;
  String units;
  DateTime time;
  String supliment;
  
  Supliment(this.id, this.babyId,this.note, this.count, this.units, this.time, this.supliment);


  Supliment.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    count = snapshot['Count'] ?? '',
    units = snapshot['Units'] ?? '',
    supliment = snapshot['Supliment'] ?? '';
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "Count": count,
        "Units": units,
        "Supliment": supliment,
      };
    }

}
