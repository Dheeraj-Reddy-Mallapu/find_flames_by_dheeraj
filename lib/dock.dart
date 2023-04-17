import 'package:flutter/material.dart';

int selectedPage = 3;

class Dock extends StatefulWidget {
  const Dock({super.key});

  @override
  State<Dock> createState() => _DockState();
}

class _DockState extends State<Dock> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(offset: Offset(2, 0), blurRadius: 4, color: Color(0xFFD7D7D7))],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (selectedPage == 0)
              dockContainer(
                IconButton(
                  onPressed: () => setState(() {
                    selectedPage = 0;
                  }),
                  icon: Image.asset('assets/home_btn.png', fit: BoxFit.contain, color: const Color(0xFFFF5F8F)),
                ),
              ),
            if (selectedPage != 0)
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  onPressed: () => setState(() {
                    selectedPage = 0;
                  }),
                  icon: Image.asset('assets/home_btn.png', fit: BoxFit.contain, color: const Color(0xFF505050)),
                ),
              ),
            if (selectedPage == 1)
              dockContainer(
                IconButton(
                  onPressed: () => setState(() {
                    selectedPage = 1;
                  }),
                  icon:
                      Image.asset('assets/global_search_btn.png', fit: BoxFit.contain, color: const Color(0xFFFF5F8F)),
                ),
              ),
            if (selectedPage != 1)
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  onPressed: () => setState(() {
                    selectedPage = 1;
                  }),
                  icon:
                      Image.asset('assets/global_search_btn.png', fit: BoxFit.contain, color: const Color(0xFF505050)),
                ),
              ),
            if (selectedPage == 2)
              dockContainer(
                IconButton(
                  onPressed: () => setState(() {
                    selectedPage = 2;
                  }),
                  icon: Image.asset('assets/calendar_btn.png', fit: BoxFit.contain, color: const Color(0xFFFF5F8F)),
                ),
              ),
            if (selectedPage != 2)
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  onPressed: () => setState(() {
                    selectedPage = 2;
                  }),
                  icon: Image.asset('assets/calendar_btn.png', fit: BoxFit.contain, color: const Color(0xFF505050)),
                ),
              ),
            if (selectedPage == 3)
              dockContainer(
                IconButton(
                  onPressed: () => setState(() {
                    selectedPage = 3;
                  }),
                  icon: Image.asset('assets/chat_btn.png', fit: BoxFit.contain, color: const Color(0xFFFF5F8F)),
                ),
              ),
            if (selectedPage != 3)
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  onPressed: () => setState(() {
                    selectedPage = 3;
                  }),
                  icon: Image.asset('assets/chat_btn.png', fit: BoxFit.contain, color: const Color(0xFF505050)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget dockContainer(Widget widget) {
    final color = Theme.of(context).colorScheme;
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 1,
            color: Colors.grey.shade200,
          )
        ],
        color: color.background,
      ),
      child: widget,
    );
  }
}
