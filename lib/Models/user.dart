class User {
  var passwordUpdatedAt;
  var lastLoginAt;
  var createdAt;
  var displayName;
  var email;
  var emailVerified;
  User({
    required this.passwordUpdatedAt,
    required this.lastLoginAt,
    required this.createdAt,
    required this.displayName,
    required this.email,
    required this.emailVerified,
  });

  factory User.fromJson(Map<String,dynamic> json) {
    return User(
      email: json['email'],
      displayName: json['displayName'],
      emailVerified: json['emailVerified'],
      createdAt: json['createdAt'],
      lastLoginAt: json['lastLoginAt'],
      passwordUpdatedAt: json['passwordUpdatedAt'],
    );
  }

}
