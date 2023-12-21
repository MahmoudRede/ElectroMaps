class UserModel {
  static const String collectionName = 'Users';

  String? userName;
  String? phoneNumber;
  String? uId;
  String? pic;


  UserModel({
    required this.userName,
    required this.phoneNumber,
    this.uId,
    required this.pic,

  });

  UserModel.fromJson(Map<String, dynamic> json) : this(
    userName : json['userName'],
    phoneNumber : json['phoneNumber'],
    uId : json['uId'],
    pic: json["pic"],


  );

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'phoneNumber': phoneNumber,
      'uId': uId,
      "pic": pic,
    };
  }
}
