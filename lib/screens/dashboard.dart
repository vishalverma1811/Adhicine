import 'package:flutter/material.dart';
import 'package:medicine_ui/assets/icon_assets.dart';
import 'package:medicine_ui/screens/add.dart';
import 'package:medicine_ui/screens/home.dart';
import 'package:medicine_ui/screens/report.dart';
import 'package:medicine_ui/theme/app_color.dart';

class Dashboard extends StatefulWidget {
  final int initialIndex;
  const Dashboard({super.key, this.initialIndex = 0});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> screens = [
    const Home(),
    const Add(),
    const Report(),
  ];

  final List<String> _titles = ["Home", "", "Report"];

  final List<String> _icons = [
    IconAssets.home,
    IconAssets.add,
    IconAssets.report,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) async {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: AppColors.buttonColor,
        unselectedItemColor: AppColors.subtextColor,
        showUnselectedLabels: true,
        items: List.generate(_titles.length, (index) {
          return BottomNavigationBarItem(
            icon: _buildIcon(index),
            label: _titles[index],
          );
        }),
      ),
    );
  }

  Widget _buildIcon(int index) {
    return Image.asset(
      _icons[index],
      color: index == 1
          ? null 
          : (_currentIndex == index
              ? AppColors.buttonColor
              : AppColors.subtextColor),
    );
  }
}
