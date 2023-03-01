class UserData {
  var passwordUpdatedAt;
  var lastLoginAt;
  var createdAt;
  var displayName;
  var email;
  var emailVerified;
  var photoUrl;
  UserData({
    required this.passwordUpdatedAt,
    required this.lastLoginAt,
    required this.createdAt,
    required this.displayName,
    required this.email,
    required this.emailVerified,
    required this.photoUrl,
  });

  factory UserData.fromJson(Map<String,dynamic> json) {
    return UserData(
      email: json['email'],
      displayName: json['displayName'],
      emailVerified: json['emailVerified'],
      createdAt: json['createdAt'],
      lastLoginAt: json['lastLoginAt'],
      passwordUpdatedAt: json['passwordUpdatedAt'],
      photoUrl: json['photoUrl'],
    );
  }

}