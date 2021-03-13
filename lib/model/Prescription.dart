class Prescription {
  final String diagnosis;
  final String user;
  final String doctor;
  final String date;
  final List<dynamic> drug;

  Prescription({this.diagnosis, this.user, this.doctor, this.date, this.drug});

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
        diagnosis: json['diagnosis'],
        user: json['user'],
        doctor: json['doctor'],
        date: json['date'],
        drug: json['drug']);
  }
}
