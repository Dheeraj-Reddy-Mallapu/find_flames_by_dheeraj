// Demo Database. In real scenario, these lists are updated from stream.

import 'package:find_flames_by_dheeraj/data_model.dart';

class DB {
  Map<String, dynamic> jordan = User(true, 'Jordan', 'assets/first.png').toMap();
  Map<String, dynamic> tim = User(true, 'Tim', 'assets/second.png').toMap();
  Map<String, dynamic> james = User(false, 'James', 'assets/third.png').toMap();

  List<String> recentUserProfilePics = ['assets/first_large.png', 'assets/second_large.png', 'assets/third_large.png'];
  String likesBackgroundPic = 'assets/likes_background_pic.png';

  List<String> recentUserNames = ['Tony', 'James', 'Jordan'];

  List<String> latestUserMessage = ['Hii!', 'Hii!', 'Hii!'];

  List<bool> isTyping = [false, false, true];
  List<int> unreadCount = [1, 0, 10];

  List<bool> isRecentUserAccountVerified = [true, false, true];
  String userAccountVerificationBadge = 'assets/verified_tag.png';

  List<String> userLatestMessageTime = ['13:10', '13:10', '13:10'];

  int noOfLikes = 20;
}
