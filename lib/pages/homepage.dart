import 'package:flutter/material.dart';
import 'package:news_app/pages/news_tabs_page.dart';
import 'package:news_app/pages/sub_pages/newsstand_page.dart';
import 'package:news_app/pages/sub_pages/search_page.dart';
import 'package:news_app/pages/widgets/bottom_nav_bar_item.dart';
import 'package:news_app/themes/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int activeItem = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const NewsTabsPage(),
      const SearchPage(),
      const NewsstandPage(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : colorWhite,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            screens[activeItem],
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: BottomNavigationBar(
                  onTap: (index) {
                    if (index == 3) return;
                    setState(() => activeItem = index);
                  },
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
                  selectedItemColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                  currentIndex: activeItem,
                  items: [
                    BottomNavBarItem(
                        context: context,
                        icon_: Icons.newspaper,
                        label: 'News',
                        active: activeItem == 0 ? true : false),
                    BottomNavBarItem(
                        context: context,
                        icon_: Icons.search,
                        label: 'Search',
                        active: activeItem == 1 ? true : false),
                    BottomNavBarItem(
                        context: context,
                        icon_: Icons.mode_standby,
                        label: 'Newsstand',
                        active: activeItem == 2 ? true : false),
                    BottomNavBarItem(
                        context: context,
                        icon_: Icons.menu,
                        label: 'Menu',
                        active: activeItem == 3 ? true : false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
