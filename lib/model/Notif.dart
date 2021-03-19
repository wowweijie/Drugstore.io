class Notif {
  final String content;
  final String type;
  final String user;

  Notif({this.content, this.type, this.user});

  factory Notif.fromJson(Map<String, dynamic> json) {
    return Notif(
        content: json['content'], type: json['type'], user: json['user']);
  }
}
