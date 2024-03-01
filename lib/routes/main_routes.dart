import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sekawan_media_test/modules/post/feature/post_screen.dart';
import 'package:sekawan_media_test/modules/profile/feature/profile_screen.dart';
import 'package:sekawan_media_test/routes/bottom_navbar_widget.dart';
import 'package:sekawan_media_test/shared/snackbar_alert.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static List<Widget> bottomNavPages = [
    const PostScreen(),
    ProfileScreen(),
  ];

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  bool isBackPressed = false;
  Timer? backPressTimer;

  @override
  void dispose() {
    backPressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _onWillPop();
      },
      child: Scaffold(
        body: MainScreen.bottomNavPages[currentIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 4,
                color: Colors.black26,
                blurStyle: BlurStyle.normal,
              )
            ],
          ),
          child: BottomNavbarWidget(
            currentIndex: currentIndex,
            changeNavbar: changeNavbar,
          ),
        ),
      ),
    );
  }

  changeNavbar({required int index}) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    if (isBackPressed) {
      SystemNavigator.pop();
      return true; // Allow the app to close
    } else {
      isBackPressed = true;
      snackbarAlert(
        "Tekan 2x untuk keluar aplikasi",
        currentContext: context,
        type: SnackbarType.dark,
      );

      setState(() {
        backPressTimer = Timer(const Duration(seconds: 2), () {
          isBackPressed = false;
        });
      });

      return false; // Prevent the app from closing
    }
  }
}
