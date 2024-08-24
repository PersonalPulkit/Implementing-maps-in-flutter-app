import 'package:flutter/material.dart';
import 'package:noti/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DashboardProvider>(builder: (BuildContext context, DashboardProvider value, Widget? child) {
        return IndexedStack(
          index: value.getScreenIndex,
          children: value.getScreens,
        );
      },),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<DashboardProvider>().getScreenIndex,
        onTap: (index){
          context.read<DashboardProvider>().setScreenIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Collections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
