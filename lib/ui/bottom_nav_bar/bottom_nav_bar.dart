import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Localizations(
      locale: const Locale("en", "EN"),
      delegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              activeIndex = value;
            });
          },
          backgroundColor: Colors.white,
          currentIndex: activeIndex,
          unselectedLabelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          selectedLabelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          elevation: 0.0,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          items: getBottonNavBar()),
    );
  }

  List<BottomNavigationBarItem> getBottonNavBar() {
    return [
      BottomNavigationBarItem(
          label: "Home",
          activeIcon: ImageIcon(AssetImage(getImageName("ic_home"))),
          icon: ImageIcon(AssetImage(getImageName("ic_home_inactive")))),
      BottomNavigationBarItem(
          label: "Shorts",
          activeIcon: ImageIcon(AssetImage(getImageName("ic_shorts_inactive"))),
          icon: ImageIcon(AssetImage(getImageName("ic_shorts_inactive")))),
      BottomNavigationBarItem(
          label: "",
          activeIcon: ImageIcon(AssetImage(getImageName("ic_upload"))),
          icon: ImageIcon(AssetImage(getImageName("ic_upload")))),
      BottomNavigationBarItem(
          label: "Subscription",
          activeIcon: ImageIcon(AssetImage(getImageName("ic_subscriptions"))),
          icon:
              ImageIcon(AssetImage(getImageName("ic_subscriptions_inactive")))),
      BottomNavigationBarItem(
          label: "Library",
          activeIcon: ImageIcon(AssetImage(getImageName("ic_library"))),
          icon: ImageIcon(AssetImage(getImageName("ic_library_inactive"))))
    ];
  }
}
