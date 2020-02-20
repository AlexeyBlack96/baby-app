import 'package:insta_clone/src/models/nappy-change.dart';

class Baby{
  String name;
  String id;
  String userId;
  String imagePath;
  DateTime birthDate;
  bool isWomen;
  String babyProfileImage;
  NappyChange nappyChange;
  Baby(this.id, this.userId,this.imagePath, this.name, this.birthDate, this.isWomen);


  Baby.fromMap(Map snapshot, String id) :
    id = id ?? '',
    userId = snapshot['UserId'] ?? '',
    imagePath = snapshot['ImagePath'] ?? '',
    name = snapshot['Name'] ?? '',
    birthDate = snapshot['birthDate'] != null ? snapshot['birthDate'].toDate() : DateTime.now(),
    babyProfileImage = snapshot['babyProfileImage'] ?? '',
    isWomen = snapshot['IsWomen'];

    toJson(){
      return{
        "Name": name,
        "UserId": userId,
        "ImagePath": imagePath,
        "birthDate":birthDate,
        "babyProfileImage":babyProfileImage,
        "IsWomen":isWomen
      };
    }

}
