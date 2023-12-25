class UserModel {
  static const String collectionName = 'Users';

  String? userName;
  String? phoneNumber;
  String? countryCode;
  String? uId;
  String? pic;


  UserModel({
    required this.userName,
    required this.phoneNumber,
    required this.countryCode,
    this.uId,
    required this.pic,

  });

  UserModel.fromJson(Map<String, dynamic> json) : this(
    userName : json['userName'],
    countryCode : json['countryCode'],
    phoneNumber : json['phoneNumber'],
    uId : json['uId'],
    pic: json["pic"],


  );

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'uId': uId,
      "pic": pic,
    };
  }
}
