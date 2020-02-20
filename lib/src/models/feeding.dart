class Feeding{
  String babyId;
  String id;
  String note;
  DateTime time;
  String timeLeft;
  String timeRight;
  
  Feeding(this.id, this.babyId,this.note, this.time, this.timeLeft, this.timeRight);

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Feeding.fromMap(Map snapshot, String id) :
    id = id ?? '',
    babyId = snapshot['BabyId'] ?? '',
    note = snapshot['Note'] ?? '',
    time = snapshot['Time'] != null ? snapshot['Time'].toDate() : DateTime.now(),
    timeLeft = snapshot['TimeLeft'] != null ? snapshot['TimeLeft'] : DateTime.now(),
    timeRight = snapshot['TimeRight'] != null ? snapshot['TimeRight'] : DateTime.now();
    toJson(){
      return{
        "BabyId": babyId,
        "Note": note,
        "Time": time,
        "TimeLeft":timeLeft,
        "TimeRight":timeRight
      };
    }

}
