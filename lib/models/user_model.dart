class UserModel {
  final String uid;
  final String name;
  final String email;
  final String role;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.role = 'Student',
  });

  // First letter of name for avatar
  String get initial => name.isNotEmpty ? name[0].toUpperCase() : '?';

  // First name only for greeting
  String get firstName {
    final parts = name.trim().split(' ');
    return parts.isNotEmpty ? parts[0] : name;
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      uid: uid,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? 'Student',
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'role': role,
      };
}
