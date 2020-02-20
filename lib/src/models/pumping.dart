class PumpingModel{
  String babyId;
  String id;
  String note;
  DateTime time;
  String timeLeft;
  String timeRight;
  String countLeft;
  String countRight;
    String totalCount;

  
  PumpingModel(this.id, this.babyId,this.note, this.time, this.timeLeft, this.timeRight,this.countLeft, this.countRight, this.totalCount);

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  PumpingModel.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    timeLeft = snapshot['TimeLeft'] != null ? snapshot['TimeLeft'] : "",
    timeRight = snapshot['TimeRight'] != null ? snapshot['TimeRight'] : "",
    totalCount = snapshot['TotalCount'] ?? "",
    countLeft = snapshot['CountLeft'] ?? "",
    countRight = snapshot['CountRight'] ?? "";
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "TimeLeft":timeLeft,
        "TimeRight":timeRight,
        "TotalCount": totalCount,
        "CountLeft":countLeft,
        "CountRight":countRight
      };
    }

}
