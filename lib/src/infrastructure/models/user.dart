class User {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final DateTime emailVerifiedAt;
  final String phone;
  final dynamic codeConfirm;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.codeConfirm,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        phone: json["phone"],
        codeConfirm: json["code_confirm"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "phone": phone,
        "code_confirm": codeConfirm,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "token": token,
      };
}
