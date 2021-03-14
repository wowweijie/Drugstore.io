class Prescription {
  final String diagnosis;
  final String user;
  final String doctor;
  final String date;
  final String id;
  final bool complete;
  final List<dynamic> drug;

  Prescription(
      {this.diagnosis,
      this.user,
      this.doctor,
      this.date,
      this.id,
      this.complete,
      this.drug});

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
        diagnosis: json['diagnosis'],
        user: json['user'],
        doctor: json['doctor'],
        date: json['date'],
        id: json['id'],
        complete: json['complete'],
        drug: json['drug']);
  }
}
