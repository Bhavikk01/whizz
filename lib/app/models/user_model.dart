class UserModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? mobile;
  final String? password;
  final int? age;
  final String? dOB;
  final UserAddress? userAddress;
  final String? userProfile;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.mobile,
    this.password,
    this.age,
    this.dOB,
    this.userAddress,
    this.userProfile,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? mobile,
    String? password,
    int? age,
    String? dOB,
    UserAddress? userAddress,
    String? userProfile,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      age: age ?? this.age,
      dOB: dOB ?? this.dOB,
      userAddress: userAddress ?? this.userAddress,
      userProfile: userProfile ?? this.userProfile,
    );
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        fullName = json['full_name'] as String?,
        email = json['email'] as String?,
        mobile = json['mobile'] as String?,
        password = json['password'] as String?,
        age = json['age'] as int?,
        dOB = json['DOB'] as String?,
        userAddress = (json['userAddress'] as Map<String,dynamic>?) != null ? UserAddress.fromJson(json['userAddress'] as Map<String,dynamic>) : null,
        userProfile = json['userProfile'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'full_name' : fullName,
    'email' : email,
    'mobile' : mobile,
    'password' : password,
    'age' : age,
    'DOB' : dOB,
    'userAddress' : userAddress?.toJson(),
    'userProfile' : userProfile
  };
}

class UserAddress {
  final String? country;
  final String? state;
  final String? city;
  final double? longitude;
  final double? latitude;

  UserAddress({
    this.country,
    this.state,
    this.city,
    this.longitude,
    this.latitude,
  });

  UserAddress copyWith({
    String? country,
    String? state,
    String? city,
    double? longitude,
    double? latitude,
  }) {
    return UserAddress(
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  UserAddress.fromJson(Map<String, dynamic> json)
      : country = json['country'] as String?,
        state = json['state'] as String?,
        city = json['city'] as String?,
        longitude = json['longitude'] as double?,
        latitude = json['latitude'] as double?;

  Map<String, dynamic> toJson() => {
    'country' : country,
    'state' : state,
    'city' : city,
    'longitude' : longitude,
    'latitude' : latitude
  };
}