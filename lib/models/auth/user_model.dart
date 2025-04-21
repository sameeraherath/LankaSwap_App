class UserModel {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;

  UserModel({required this.uid, this.email, this.displayName, this.photoUrl});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'],
      displayName: map['displayName'],
      photoUrl: map['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
    };
  }
}
