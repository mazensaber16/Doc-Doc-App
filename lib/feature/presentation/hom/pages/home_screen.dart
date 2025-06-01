import 'package:doc_doc/core/utils/app_assets.dart';
import 'package:doc_doc/core/utils/app_colors.dart';
import 'package:doc_doc/feature/presentation/hom/tabs/home_tab/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../tabs/calender_tab/calender_tab.dart';
import '../tabs/chat_tab/chat_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    HomeTab(),
    const ChatTab(),
    const CalenderTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],

      floatingActionButton: SizedBox(
        height: 80.h,
        width: 80.w,
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            //Todo: Implement search functionality
          },
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34.r),
          ),
          child: Icon(Icons.search, color: Colors.white, size: 30.sp),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home
              IconButton(
                onPressed: () {
                  setState(() => selectedIndex = 0);
                },
                icon: buildNavItem(index: 0, image: AssetsManager.homeIcon),
              ),

              // Chat
              IconButton(
                onPressed: () {
                  setState(() => selectedIndex = 1);
                },
                icon: buildNavItem(index: 1, image: AssetsManager.messageIcon),
              ),

              SizedBox(width: 20.w),

              // Calendar
              IconButton(
                onPressed: () {
                  setState(() => selectedIndex = 2);
                },
                icon:
                buildNavItem(index: 2, image: AssetsManager.calenderIcon),
              ),

              GestureDetector(
                onTap: () {
                 // Todo: Navigate to user profile or settings
                },
                child: CircleAvatar(
                  radius: 16.r,
                  backgroundImage: const AssetImage(AssetsManager.doctorAnime),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem({required int index, required String image}) {
    return ImageIcon(
      AssetImage(image),
      color: selectedIndex == index ? AppColors.primaryColor : Colors.grey,
      size: 26.sp,
    );
  }
}
