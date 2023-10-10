class ReportsModel {
  final String? id;
  final String? url;
  final String? reportLocation;
  final String? reportType;
  final String? fileName;
  final DateTime? time;

  ReportsModel({
    this.id,
    this.url,
    this.reportLocation,
    this.reportType,
    this.fileName,
    this.time,
  });

  ReportsModel copyWith({
    String? id,
    String? url,
    String? reportLocation,
    String? reportType,
    DateTime? time,
    String? fileName,
  }) {
    return ReportsModel(
      id: id ?? this.id,
      url: url ?? this.url,
      reportLocation: reportLocation ?? this.reportLocation,
      reportType: reportType ?? this.reportType,
      time: time ?? this.time,
      fileName: fileName ?? this.fileName,
    );
  }

  ReportsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        url = json['url'] as String?,
        reportLocation = json['reportLocation'] as String?,
        reportType = json['reportType'] as String?,
        fileName = json['fileName'] as String?,
        time = json['time'] != null ? DateTime.parse(json['time']) : DateTime.now();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'url' : url,
    'fileName' : fileName,
    'reportLocation' : reportLocation,
    'reportType' : reportType,
    'time' : time!.toIso8601String()
  };
}