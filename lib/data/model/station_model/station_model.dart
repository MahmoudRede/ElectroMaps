class StationModel {
  static const String collectionName = 'Users';

  String? stationName;
  String? stationType;
  String? stationStatus;
  String? energySource;
  double? langitude;
  double? latitude;
  String? location;
  String? address;
  String? number;
  String? where;
  String? connectorType;
  String? power;
  String? intensity;
  String? voltage;
  String? format;
  String? typeCurrent;
  String? howWork;
  String? bookingOptions;
  String? schedule;
  String? limitTime;
  String? chargingSession;
  String? parkingPrice;
  String? proprietary;
  String? email;
  String? phoneNumber;



  StationModel({

    required this.stationName,
    required this.stationType,
    required this.stationStatus,
    required this.energySource,
    required this.langitude,
    required this.latitude,
    required this.location,
    required this.address,
    required this.number,
    required this.where,
    required this.connectorType,
    required this.power,
    required this.intensity,
    required this.voltage,
    required this.format,
    required this.typeCurrent,
    required this.howWork,
    required this.bookingOptions,
    required this.schedule,
    required this.limitTime,
    required this.chargingSession,
    required this.parkingPrice,
    required this.proprietary,
    required this.email,
    required this.phoneNumber,

  });

  StationModel.fromJson(Map<String, dynamic> json) : this(
    address: json['address'],
    stationName : json['stationName'],
    stationType : json['stationType'],
    stationStatus : json['stationStatus'],
    energySource : json['energySource'],
    langitude : json['langitude'],
    latitude : json['latitude'],
    location : json['location'],
    number : json['number'],
    where : json['where'],
    connectorType : json['connectorType'],
    power : json['power'],
    intensity : json['intensity'],
    voltage : json['voltage'],
    format : json['format'],
    typeCurrent : json['typeCurrent'],
    howWork : json['howWork'],
    bookingOptions : json['bookingOptions'],
    schedule : json['schedule'],
    limitTime : json['limitTime'],
    chargingSession : json['chargingSession'],
    parkingPrice : json['parkingPrice'],
    proprietary : json['proprietary'],
    email : json['email'],
    phoneNumber : json['phoneNumber'],

  );

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'stationName': stationName,
      'stationType': stationType,
      'stationStatus': stationStatus,
      'energySource': energySource,
      'langitude': langitude,
      'latitude': latitude,
      'location': location,
      'number': number,
      'where': where,
      'connectorType': connectorType,
      'power': power,
      'intensity': intensity,
      'voltage': voltage,
      'format': format,
      'typeCurrent': typeCurrent,
      'howWork': howWork,
      'bookingOptions': bookingOptions,
      'schedule': schedule,
      'limitTime': limitTime,
      'chargingSession': chargingSession,
      'parkingPrice': parkingPrice,
      'proprietary': proprietary,
      'email': email,
      'phoneNumber': phoneNumber,

    };
  }
}
