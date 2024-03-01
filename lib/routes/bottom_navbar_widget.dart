import 'package:flutter/material.dart';
import 'package:sekawan_media_test/core/app_color.dart';
import 'package:sekawan_media_test/core/typography.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget(
      {required this.currentIndex, required this.changeNavbar, super.key});
  final int currentIndex;
  final Function changeNavbar;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.warmWhite,
      elevation: 4,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_post_office_outlined,
            color: AppColor.dark,
          ),
          activeIcon: Icon(
            Icons.local_post_office_rounded,
            color: AppColor.darkBlue,
          ),
          label: 'Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
            color: AppColor.dark,
          ),
          activeIcon: Icon(
            Icons.account_circle,
            color: AppColor.darkBlue,
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: AppColor.darkBlue,
      unselectedItemColor: AppColor.dark,
      showUnselectedLabels: true,
      selectedLabelStyle: heading6,
      unselectedLabelStyle: heading6,
      currentIndex: currentIndex,
      onTap: (int index) async {
        debugPrint("index => $index");
        debugPrint("index.runtimeType => ${index.runtimeType}");
        changeNavbar(index: index);
      },
    );
  }
}
