class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final UserRole role;
  final String? address;
  final String? profileImage;
  final DateTime registeredDate;
  bool isVerified;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    this.address,
    this.profileImage,
    required this.registeredDate,
    this.isVerified = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role.toString(),
      'address': address,
      'profileImage': profileImage,
      'registeredDate': registeredDate.toIso8601String(),
      'isVerified': isVerified,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: UserRole.values.firstWhere(
        (e) => e.toString() == json['role'],
        orElse: () => UserRole.buyer,
      ),
      address: json['address'],
      profileImage: json['profileImage'],
      registeredDate: DateTime.parse(json['registeredDate']),
      isVerified: json['isVerified'] ?? false,
    );
  }
}

enum UserRole {
  buyer,
  seller,
  admin,
}
