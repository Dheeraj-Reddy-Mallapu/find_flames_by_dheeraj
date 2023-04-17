import 'package:find_flames_by_dheeraj/demo_database.dart';
import 'package:flutter/material.dart';

import 'dock.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.db});
  final DB db;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final List<Map<String, dynamic>> allUsers = [widget.db.jordan, widget.db.tim, widget.db.james];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height / 8,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                maxRadius: 28,
                child: Image.asset('assets/profile_pic.png'),
              ),
              const Text(
                'Find Flames',
                style: TextStyle(color: Color(0xFFFF5F8F)),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/settings_btn.png',
                    height: 25,
                  )),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, right: 6.0, top: 6.0, bottom: 6.0),
                            child: Container(
                              width: 85,
                              height: 98.3,
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(12), color: color.primaryContainer),
                              child: Image.asset(widget.db.likesBackgroundPic),
                            ),
                          ),
                          Positioned(
                            bottom: 45,
                            left: 46,
                            child: Container(
                              width: 50,
                              height: 16,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
                              child: const Center(
                                  child: Text(
                                'Likes',
                                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                              )),
                            ),
                          ),
                          Positioned(
                            top: 23,
                            left: 58,
                            child: Image.asset(
                              'assets/heart_icon.png',
                              width: 25,
                            ),
                          ),
                          Positioned(
                            top: 53,
                            left: 58,
                            child: Text(
                              widget.db.noOfLikes.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3, //itemCount can be taken dynamically from a stream in real scenario.
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    width: 85,
                                    height: 98.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12), color: color.primaryContainer),
                                    child: Image.asset(widget.db.recentUserProfilePics[index]),
                                  ),
                                ),
                                Positioned(
                                  bottom: 45,
                                  left: 22,
                                  child: Container(
                                    width: 50,
                                    height: 16,
                                    decoration:
                                        BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.db.recentUserNames[index],
                                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                                        ),
                                        if (widget.db.isRecentUserAccountVerified[index] == true)
                                          Padding(
                                            padding: const EdgeInsets.only(left: 2.0),
                                            child: Image.asset(
                                              widget.db.userAccountVerificationBadge,
                                              height: 10,
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
                      child: InkWell(
                        child: ListView.builder(
                          itemCount:
                              allUsers.length, //itemCount can be taken dynamically from a stream in real scenario.
                          itemBuilder: (context, index) {
                            Color unreadCountColor = const Color(0xFFFF5F8F);
                            if (widget.db.unreadCount[index] == 0) {
                              unreadCountColor = Colors.transparent;
                            }

                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        child: CircleAvatar(
                                          maxRadius: 30,
                                          child: Image.asset(allUsers[index]['userProfilePic']),
                                        ),
                                        onTap: () {},
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(left: 18.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  allUsers[index]['userName'],
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16,
                                                      color: Color(0xFF505050)),
                                                ),
                                                if (allUsers[index]['isUserAccountVerified'] == true)
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 6.0),
                                                    child: Image.asset(
                                                      widget.db.userAccountVerificationBadge,
                                                      height: 14,
                                                    ),
                                                  )
                                              ],
                                            ),
                                            if (widget.db.isTyping[index] == false)
                                              Text(
                                                widget.db.latestUserMessage[index],
                                                style: const TextStyle(fontSize: 13, color: Color(0xFF505050)),
                                              ),
                                            if (widget.db.isTyping[index] == true)
                                              const Text(
                                                'Typing...',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xFFFF5F8F),
                                                    fontStyle: FontStyle.italic),
                                              )
                                          ],
                                        ),
                                      )),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(widget.db.userLatestMessageTime[index],
                                              style: const TextStyle(color: Color(0xFF505050))),
                                          if (widget.db.unreadCount[index] < 10)
                                            CircleAvatar(
                                              radius: 7,
                                              backgroundColor: unreadCountColor,
                                              child: Text(
                                                widget.db.unreadCount[index].toString(),
                                                style: TextStyle(
                                                    color: color.background, fontSize: 10, fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                          if (widget.db.unreadCount[index] >= 10)
                                            CircleAvatar(
                                              radius: 7,
                                              backgroundColor: const Color(0xFFFF5F8F),
                                              child: Text(
                                                '9+',
                                                style: TextStyle(
                                                    color: color.background, fontSize: 9, fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(thickness: 1, color: Color(0xFFFFF6FA), indent: 20, endIndent: 20),
                              ],
                            );
                          },
                        ),
                        onTap: () {},
                      ),
                    ),
                  )),
              const Dock(),
            ],
          ),
          Align(
            alignment: const Alignment(0, -0.575),
            child: Container(
              width: size.width / 1.2,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [BoxShadow(offset: Offset(0, 0.5), blurRadius: 1.5, color: Color(0xFF999999))]),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Color(0xFF999999)),
                  prefixIcon: Image.asset('assets/search_icon.png', color: const Color(0xFF999999)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
