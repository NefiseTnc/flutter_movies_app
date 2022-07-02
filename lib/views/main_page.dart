import 'package:flutter/material.dart';
import 'package:flutter_movies_app/constants/app_constants.dart';
import 'package:flutter_movies_app/views/cast_page.dart';
import 'package:flutter_movies_app/views/home_page.dart';
import 'package:flutter_movies_app/views/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _BottomNavigationBarPage();
}

class _BottomNavigationBarPage extends State<MainPage> {
  List bodyList = [const HomePage(), const SearchPage(), const CastPage()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: AppConstants.primaryColor,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_rounded),
            label: 'Cast',
          ),
        ],
      ),
    );
  }
}
