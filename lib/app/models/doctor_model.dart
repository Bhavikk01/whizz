class DoctorModel {
  String? doctorName;
  bool? available;
  String? id;
  String? specialty;
  String? healthCareId;
  String? cost;
  String? timings;

  DoctorModel({
    this.doctorName,
    this.available,
    this.id,
    this.specialty,
    this.healthCareId,
    this.cost,
    this.timings,
  });

  DoctorModel copyWith({
    String? doctorName,
    bool? available,
    String? id,
    String? specialty,
    String? healthCareId,
    String? cost,
    String? timings,
  }) {
    return DoctorModel(
      doctorName: doctorName ?? this.doctorName,
      available: available ?? this.available,
      id: id ?? this.id,
      specialty: specialty ?? this.specialty,
      healthCareId: healthCareId ?? this.healthCareId,
      cost: cost ?? this.cost,
      timings: timings ?? this.timings,
    );
  }

  DoctorModel.fromJson(Map<String, dynamic> json)
      : doctorName = json['doctor_name'] as String?,
        available = json['available'] as bool?,
        id = json['id'] as String?,
        specialty = json['specialty'] as String?,
        healthCareId = json['health_care_id'] as String?,
        cost = json['cost'] as String?,
        timings = json['timings'] as String?;

  Map<String, dynamic> toJson() => {
    'doctor_name' : doctorName,
    'available' : available,
    'id' : id,
    'specialty' : specialty,
    'health_care_id' : healthCareId,
    'cost' : cost,
    'timings' : timings
  };
}