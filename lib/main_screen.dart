import 'package:find_flames_by_dheeraj/chat_screen.dart';
import 'package:find_flames_by_dheeraj/dock.dart';
import 'package:flutter/material.dart';

import 'demo_database.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.db});
  final DB db;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    if (selectedPage == 3) {
      return ChatScreen(db: widget.db);
    } else {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [Dock()],
        ),
      );
    }
  }
}
