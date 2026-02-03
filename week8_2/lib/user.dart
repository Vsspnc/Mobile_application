class User {
  int? id;
  String username;
  String email;


  User({
    this.id,
    required this.username,
    required this.email,
  });

  // แปลง object → map (ใช้กับ SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }

  // แปลง map → object
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
    );
  }
}
