class User {
  final int? id;
  final String username;
  final String email;
  final String pwd;
  final double weight;        // kg
  final double height;        // cm
  final double bmi;
  final String bmiType;
  final double targetWeight;  // น้ำหนักที่ควรอยู่ในช่วง Normal

  User({
    this.id,
    required this.username,
    required this.email,
    required this.pwd,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.bmiType,
    required this.targetWeight,
  });

  // ================= BMI LOGIC =================

  static double calculateBMI(double weight, double heightCm) {
    final h = heightCm / 100;
    return weight / (h * h);
  }

  static String determineBmiType(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi <= 24.9) return "Normal";
    if (bmi <= 29.9) return "Overweight";
    return "Obese";
  }

  static double calculateTargetWeight(double heightCm, double targetBmi) {
    final h = heightCm / 100;
    return targetBmi * h * h;
  }

  // ================= SQLITE =================

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'pwd': pwd,
      'weight': weight,
      'height': height,
      'bmi': bmi,
      'bmiType': bmiType,
      'targetWeight': targetWeight,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
  return User(
    id: map['id'],
    username: map['username'] ?? '',
    email: map['email'] ?? '',
    pwd: map['pwd'] ?? '',
    weight: (map['weight'] ?? 0).toDouble(),
    height: (map['height'] ?? 0).toDouble(),
    bmi: (map['bmi'] ?? 0).toDouble(),
    bmiType: map['bmiType'] ?? 'Unknown',
    targetWeight: (map['targetWeight'] ?? 0).toDouble(),
  );
}
}
