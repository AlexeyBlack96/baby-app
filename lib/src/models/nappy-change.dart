class NappyChange{
  String babyId;
  String id;
  String note;
  DateTime time;
  String status;
  
  NappyChange(this.id, this.babyId,this.note, this.time, this.status);

  NappyChange.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    status = snapshot['Status'] != null ? snapshot['Status'] : '';
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "TimeRight":status
      };
    }

}
