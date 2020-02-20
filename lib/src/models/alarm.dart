class AlarmModel{
  String babyId;
  String id;
  String note;
  DateTime time;
  String eventType;
  bool mon;
  bool tue;
  bool wed;
  bool thu;
  bool fri;
  bool sat;
  bool sun;
  bool isActive;

  
  AlarmModel(
    this.id,
    this.babyId,
    this.note,
    this.time, 
    this.eventType, 
    this.mon, 
    this.tue, 
    this.wed,
    this.thu,
    this.fri,
    this.sat,
    this.sun,
    this.isActive
  );

  AlarmModel.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    eventType = snapshot['EventType'] ?? '',
    mon = snapshot['Mon'],
    tue = snapshot['Tue'],
    wed = snapshot['Wed'],
    thu = snapshot['Thu'],
    fri = snapshot['Fri'],
    sat = snapshot['Sat'],
    sun = snapshot['Sun'],
    isActive = snapshot['IsActive'];

    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "EventType": eventType,
        "Mon": mon,
        "Tue": tue,
        "Wed": wed,
        "Thu": thu,
        "Fri": fri,
        "Sat": sat,
        "Sun": sun,
        "IsActive": isActive,
      };
    }
}
