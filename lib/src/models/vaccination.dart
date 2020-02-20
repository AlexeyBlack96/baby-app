class VaccinationModel{
  String babyId;
  String id;
  String note;
  DateTime time;
  String vaccine;

  
  VaccinationModel(this.id, this.babyId,this.note, this.time, this.vaccine);


  VaccinationModel.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    vaccine = snapshot['Vaccine'] ?? '';
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "Vaccine":vaccine
      };
    }

}
