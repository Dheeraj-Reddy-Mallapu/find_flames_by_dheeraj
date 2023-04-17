class User {
  final String userName;
  final String userRoundProfilePic; //In real scenario, it can be an URL of the picture from the database.
  final bool isUserAccountVerified;

  User(this.isUserAccountVerified, this.userName, this.userRoundProfilePic);

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userProfilePic': userRoundProfilePic,
      'isUserAccountVerified': isUserAccountVerified,
    };
  }
}
