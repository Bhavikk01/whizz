class HealthcareCenter {
  final String? name;
  final String? id;
  final List<String>? photoUrl;
  final Address? address;
  final String? about;
  final String? timings;
  final List<ServicesAndReviews>? servicesAndReviews;

  HealthcareCenter({
    this.name,
    this.id,
    this.photoUrl,
    this.address,
    this.about,
    this.timings,
    this.servicesAndReviews,
  });

  HealthcareCenter copyWith({
    String? name,
    String? id,
    List<String>? photoUrl,
    Address? address,
    String? about,
    String? timings,
    List<ServicesAndReviews>? servicesAndReviews,
  }) {
    return HealthcareCenter(
      name: name ?? this.name,
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
      address: address ?? this.address,
      about: about ?? this.about,
      timings: timings ?? this.timings,
      servicesAndReviews: servicesAndReviews ?? this.servicesAndReviews,
    );
  }

  HealthcareCenter.fromJson(Map<String, dynamic> json)
      : name = json['name']?? '',
        id = json['id'] ?? '',
        photoUrl = (json['photoUrl'] as List?)?.map((dynamic e) => e as String).toList(),
        address = (json['address'] as Map<String,dynamic>?) != null ? Address.fromJson(json['address'] as Map<String,dynamic>) : null,
        about = json['about'] ?? '',
        timings = json['timings'] ?? '',
        servicesAndReviews = (json['services_and_reviews'] as List?)?.map((dynamic e) => ServicesAndReviews.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'name' : name,
    'id' : id,
    'photoUrl' : photoUrl,
    'address' : address?.toJson(),
    'about' : about,
    'timings' : timings,
    'services_and_reviews' : servicesAndReviews?.map((e) => e.toJson()).toList()
  };
}

class Address {
  final String? country;
  final String? city;
  final String? state;
  final String? street;
  final double? latitude;
  final double? longitude;

  Address({
    this.country,
    this.city,
    this.state,
    this.street,
    this.latitude,
    this.longitude,
  });

  Address copyWith({
    String? country,
    String? city,
    String? state,
    String? street,
    double? latitude,
    double? longitude,
  }) {
    return Address(
      country: country ?? this.country,
      city: city ?? this.city,
      state: state ?? this.state,
      street: street ?? this.street,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Address.fromJson(Map<String, dynamic> json)
      : country = json['country'] as String?,
        city = json['city'] as String?,
        state = json['state'] as String?,
        street = json['street'] as String?,
        latitude = json['latitude'] as double?,
        longitude = json['longitude'] as double?;

  Map<String, dynamic> toJson() => {
    'country' : country,
    'city' : city,
    'state' : state,
    'street' : street,
    'latitude' : latitude,
    'longitude' : longitude
  };
}

class ServicesAndReviews {
  final String? service;
  final List<Reviews>? reviews;

  ServicesAndReviews({
    this.service,
    this.reviews,
  });

  ServicesAndReviews copyWith({
    String? service,
    List<Reviews>? reviews,
  }) {
    return ServicesAndReviews(
      service: service ?? this.service,
      reviews: reviews ?? this.reviews,
    );
  }

  ServicesAndReviews.fromJson(Map<String, dynamic> json)
      : service = json['service'] as String?,
        reviews = (json['reviews'] as List?)?.map((dynamic e) => Reviews.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'service' : service,
    'reviews' : reviews?.map((e) => e.toJson()).toList()
  };
}

class Reviews {
  final String? userid;
  final String? name;
  final int? rating;
  final String? review;

  Reviews({
    this.userid,
    this.name,
    this.rating,
    this.review,
  });

  Reviews copyWith({
    String? userid,
    String? name,
    int? rating,
    String? review,
  }) {
    return Reviews(
      userid: userid ?? this.userid,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      review: review ?? this.review,
    );
  }

  Reviews.fromJson(Map<String, dynamic> json)
      : userid = json['userid'] as String?,
        name = json['name'] as String?,
        rating = json['rating'] as int?,
        review = json['review'] as String?;

  Map<String, dynamic> toJson() => {
    'userid' : userid,
    'name' : name,
    'rating' : rating,
    'review' : review
  };
}