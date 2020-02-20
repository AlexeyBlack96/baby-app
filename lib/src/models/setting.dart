class Setting{
  String version;
    String id;
    String userId;
    bool nightMode;
    bool tapToSwitch;
    bool reverseReviewOrder;
    bool patternOnTop;
    bool filipPattern;
    bool linePattern;
    bool lineChart;
    bool useAdjusted;
    bool showAge;
    bool splitSleep;
    bool isNap;
    bool showNursing;
    bool showLastSupplementation;
    bool useIconBadge;
    bool photoSize;
    bool exportBlackAndWhite;
    bool alarmSound;
    bool adsOnBottom;
    String color;
    String fontSize;
    bool icon1;
    bool icon2;
    bool icon3;
    bool icon4;
    bool icon5;
    bool icon6;
    bool icon7;
    bool icon8;
    bool lactation;
    bool expressing;
    bool other;
    bool turnAutoLock;
    bool quantity;
    bool length;
    bool weight;
    bool temperature;



  
  Setting(
    this.id, 
    this.version, 
    this.userId,
    this.nightMode,
    this.tapToSwitch,
    this.reverseReviewOrder,
    this.patternOnTop,
    this.filipPattern,
    this.linePattern,
    this.lineChart,
    this.useAdjusted,
    this.showAge,
    this.exportBlackAndWhite,
    this.splitSleep,
    this.isNap,
    this.showNursing,
    this.showLastSupplementation,
    this.useIconBadge,
    this.photoSize,
    this.alarmSound,
    this.adsOnBottom,
    this.color,
    this.fontSize,
    this.icon1,
    this.icon2,
    this.icon3,
    this.icon4,
    this.icon5,
    this.icon6,
    this.icon7,
    this.icon8,
    this.lactation,
    this.expressing,
    this.other,
    this.turnAutoLock,
    this.quantity,
    this.length,
    this.weight,
    this.temperature,
    );


  Setting.fromMap(Map snapshot, String id) :
    id = id ?? '',
    userId = snapshot['UserId'] ?? '',
    version = snapshot['Version'] ?? '',
    exportBlackAndWhite = snapshot['exportBlackAndWhite'] == null ? false : snapshot['exportBlackAndWhite'],
    nightMode = snapshot['nightMode'] == null ? false : snapshot['nightMode'],
    tapToSwitch = snapshot['tapToSwitch'] == null ? false : snapshot['tapToSwitch'],
    reverseReviewOrder = snapshot['reverseReviewOrder'] == null ? false : snapshot['reverseReviewOrder'],
    patternOnTop = snapshot['patternOnTop'] == null ? false : snapshot['patternOnTop'],
    filipPattern = snapshot['filipPattern'] == null ? false : snapshot['filipPattern'],
    linePattern = snapshot['linePattern'] == null ? false : snapshot['linePattern'],
    lineChart = snapshot['lineChart'] == null ? false : snapshot['lineChart'],
    useAdjusted = snapshot['useAdjusted'] == null ? false : snapshot['useAdjusted'],
    showAge = snapshot['showAge'] == null ? false : snapshot['showAge'],
    splitSleep = snapshot['splitSleep'] == null ? false : snapshot['splitSleep'],
    isNap = snapshot['isNap'] == null ? false : snapshot['isNap'],
    showNursing = snapshot['showNursing'] == null ? false : snapshot['showNursing'],
    showLastSupplementation = snapshot['showLastSupplementation'] == null ? false : snapshot['showLastSupplementation'],
    useIconBadge = snapshot['useIconBadge'] == null ? false : snapshot['useIconBadge'],
    photoSize = snapshot['photoSize'] == null ? false : snapshot['photoSize'],
    alarmSound = snapshot['alarmSound'] == null ? false : snapshot['alarmSound'],
    adsOnBottom = snapshot['adsOnBottom'] == null ? false : snapshot['adsOnBottom'],
    color = snapshot['color'] ?? '',
    fontSize = snapshot['fontSize'] == "" ? '14' : snapshot['fontSize'],
    icon1 = snapshot['icon1'] == null ? false : snapshot['icon1'],
    icon2 = snapshot['icon2'] == null ? false : snapshot['icon2'],
    icon3 = snapshot['icon3'] == null ? false : snapshot['icon3'],
    icon4 = snapshot['icon4'] == null ? false : snapshot['icon4'],
    icon5 = snapshot['icon5'] == null ? false : snapshot['icon5'],
    icon6 = snapshot['icon6'] == null ? false : snapshot['icon6'],
    icon7 = snapshot['icon7'] == null ? false : snapshot['icon7'],
    icon8 = snapshot['icon8'] == null ? false : snapshot['icon8'],
    lactation = snapshot['lactation'] == null ? false : snapshot['lactation'],
    expressing = snapshot['expressing'] == null ? false : snapshot['expressing'],
    other = snapshot['other'] == null ? false : snapshot['other'],
    turnAutoLock = snapshot['turnAutoLock'] == null ? false : snapshot['turnAutoLock'],
    quantity = snapshot['quantity'] == null ? false : snapshot['quantity'],
    length = snapshot['length'] == null ? false : snapshot['length'],
    weight = snapshot['weight'] == null ? false : snapshot['weight'],
    temperature = snapshot['temperature'] == null ? false : snapshot['temperature'];

    toJson(){
      return{
        "Version": version,
        "UserId": userId,
        "nightMode": nightMode,
        "exportBlackAndWhite" : exportBlackAndWhite,
        "tapToSwitch": tapToSwitch,
        "reverseReviewOrder": reverseReviewOrder,
        "patternOnTop": patternOnTop,
        "filipPattern": filipPattern,
        "linePattern": linePattern,
        "lineChart": lineChart,
        "useAdjusted": useAdjusted,
        "showAge": showAge,
        "splitSleep": splitSleep,
        "isNap": isNap,
        "showNursing": showNursing,
        "showLastSupplementation": showLastSupplementation,
        "useIconBadge": useIconBadge,
        "photoSize": photoSize,
        "alarmSound": alarmSound,
        "adsOnBottom": adsOnBottom,
        "color": color,
        "fontSize": fontSize,
        "icon1": icon1,
        "icon2": icon2,
        "icon3": icon3,
        "icon4": icon4,
        "icon5": icon5,
        "icon6": icon6,
        "icon7": icon7,
        "icon8": icon8,
        "lactation": lactation,
        "expressing": expressing,
        "other": other,
        "turnAutoLock": turnAutoLock,
        "quantity": quantity,
        "length": length,
        "weight": weight,
        "temperature": temperature,
      };
    }

}
