import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_challenge/providers/upcomming_weather_provider.dart';
import 'package:second_challenge/screens/current_weather_screen.dart';
import 'package:second_challenge/screens/upcomming_weather_day.dart';

import '../providers/current_weather_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/";

  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _onTabSelected(0);
                    },
                    child: Container(
                      color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                      child: const Center(
                        child: Text(
                          'Daily',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _onTabSelected(1);
                    },
                    child: Container(
                      color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                      child: const Center(
                        child: Text(
                          'Upcoming 2 weeks',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                Container(
                  color: Colors.white,
                  child: Center(
                    child: ChangeNotifierProvider<CurrentWeatherProvider>(
                      create: (context) => CurrentWeatherProvider(),
                      child: const CurrentWeatherScreen(),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: ChangeNotifierProvider<UpcommingWeatherProvider>(
                      create: (context) => UpcommingWeatherProvider(),
                      child: const UpcommingWeatherScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
