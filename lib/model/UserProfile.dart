// class UserProfile {
//   String email;
//   // String username;

//   UserProfile(String email){
//     this.email = email;
//     // this.username = username;
//   }
// }

class UserProfile {
  final String name;
  final String username;
  final String gender;
  final String birthday;
  final String height;
  final String weight;
  final String ethnicity;
  final String bloodType;
  final List<dynamic> allergies;
  final List<dynamic> existingMedCond;
  final List<dynamic> personalMedHist;
  final List<dynamic> famMedHist;

  UserProfile(
      {this.name,
      this.username,
      this.gender,
      this.birthday,
      this.height,
      this.weight,
      this.ethnicity,
      this.bloodType,
      this.allergies,
      this.existingMedCond,
      this.personalMedHist,
      this.famMedHist});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      username: json['username'],
      gender: json['gender'],
      birthday: json['birthday'],
      height: json['height'],
      weight: json['weight'],
      ethnicity: json['ethnicity'],
      bloodType: json['bloodType'],
      allergies: json['allergies'],
      existingMedCond: json['existingMedCond'],
      personalMedHist: json['personalMedHist'],
      famMedHist: json['famMedHist'],
    );
  }
}
