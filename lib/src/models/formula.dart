class Formula{
  String babyId;
  String id;
  String note;
  DateTime time;
  String count;
  
  Formula(this.id, this.babyId,this.note, this.time, this.count);


  Formula.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    count = snapshot['Count'] != null ? snapshot['Count'] : "";
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "Count":count,
      };
    }

}
