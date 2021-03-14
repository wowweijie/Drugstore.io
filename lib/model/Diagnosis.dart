class Diagnosis {
  final String condition;
  final String date;
  final String user;
  final String id;
  final bool approved;
  final double probability;
  final List<dynamic> symptoms;

  Diagnosis(
      {this.condition,
      this.date,
      this.user,
      this.id,
      this.approved,
      this.probability,
      this.symptoms});

  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return Diagnosis(
        condition: json['condition'],
        date: json['date'],
        user: json['user'],
        id: json['id'],
        approved: json['approved'],
        probability: json['probability'],
        symptoms: json['symptoms']);
  }
}
