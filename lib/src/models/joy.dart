class JoyModel{
  String babyId;
  String id;
  String note;
  DateTime time;
  String imagePath;
  
  JoyModel(this.id, this.babyId,this.note, this.time, this.imagePath);

  JoyModel.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    imagePath = snapshot['ImagePath'] ?? '';
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "ImagePath":imagePath,
      };
    }

}
