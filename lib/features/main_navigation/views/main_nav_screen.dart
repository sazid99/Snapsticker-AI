import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapsticker/features/ai/features/ai_main_navigation/views/pages/ai_main_nav_screen.dart';
import 'package:snapsticker/features/explore/views/explore_page.dart';
import 'package:snapsticker/features/profile/views/profile_page.dart';
import 'package:snapsticker/features/stickers/views/sticker_page.dart';
import 'package:snapsticker/features/templates/views/templates_page.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _portalController;
  int currentIndex = 0;

  List<Widget> widgetList = [
    TemplatesPage(),
    ExplorePage(),
    StickerPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _portalController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _portalController.dispose();
    super.dispose();
  }

  //note: =====================  build widget method =======================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widgetList[currentIndex]),
      floatingActionButton: _buildPortalFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildCustomNavBar(),
    );
  }

  //note: custom floating action button method
  Widget _buildPortalFab() {
    return InkResponse(
      onTap: () {
        Get.to(AiMainNavScreen());
      },
      radius: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 🟣 Rotating ring
          ScaleTransition(
            scale: Tween(begin: 1.0, end: 1.05).animate(
              CurvedAnimation(
                parent: _portalController,
                curve: Curves.easeInOut,
              ),
            ),
            child: RotationTransition(
              turns: _portalController,
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      Colors.purpleAccent,
                      Colors.blue,
                      Colors.purpleAccent,
                      Colors.green,
                      Colors.purpleAccent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          // 🌌 Actual FAB
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                colors: [
                  Colors.black12,
                  Colors.deepPurple,
                  Colors.orange,
                  Colors.grey,
                  Colors.blueGrey,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepOrange,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Icon(
              Icons.camera_outlined,
              size: 40,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }

  //note: build custom navbar method
  Widget _buildCustomNavBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      surfaceTintColor: Colors.blueGrey.shade900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.dashboard_outlined, 0, 'Templates'),
          _navItem(Icons.manage_search_outlined, 1, 'Explore'),
          const SizedBox(width: 56),
          _navItem(Icons.collections_outlined, 2, 'Stickers'),
          _navItem(Icons.account_circle_outlined, 3, 'Profile'),
        ],
      ),
    );
  }

  //note: nav items
  Widget _navItem(IconData icon, int index, String label) {
    final isActive = currentIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.purple : Colors.blueGrey.shade600,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isActive ? Colors.purple : Colors.blueGrey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
