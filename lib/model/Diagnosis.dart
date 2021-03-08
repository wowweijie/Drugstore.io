class Diagnosis {
  final String condition;
  final String date;
  final String user;
  final bool approved;
  final double probability;
  final List<dynamic> symptoms;

  Diagnosis(
      {this.condition,
      this.date,
      this.user,
      this.approved,
      this.probability,
      this.symptoms});

  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return Diagnosis(
        condition: json['condition'],
        date: json['date'],
        user: json['user'],
        approved: json['approved'],
        probability: json['probability'],
        symptoms: json['symptoms']);
  }
}
