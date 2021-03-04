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
  final String heightString;
  final String weightString;
  final String ethnicity;
  final String bloodType;

  UserProfile(
      {this.name,
      this.username,
      this.gender,
      this.birthday,
      this.heightString,
      this.weightString,
      this.ethnicity,
      this.bloodType});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      username: json['username'],
      gender: json['gender'],
      birthday: json['birthday'],
      heightString: json['heightString'],
      weightString: json['weightString'],
      ethnicity: json['ethnicity'],
      bloodType: json['bloodType'],
    );
  }
}
