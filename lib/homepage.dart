import 'package:flutter/material.dart';
import 'package:lms_system/profile.dart';
import 'package:lms_system/schedules_page.dart';

import 'LecturePdfPage.dart';
import 'markspage.dart';

class UniqueMainPage extends StatefulWidget {
  @override
  _UniqueMainPageState createState() => _UniqueMainPageState();
}

class _UniqueMainPageState extends State<UniqueMainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
   LectureMaterialsPage(), // Replace with actual Lecture Materials page
    SchedulesPage(), // Replace with actual Lecture Schedules page
    MarksPage(), // Replace with actual Exams/Assignment Marks page
   AccountPage(), // Replace with actual Account page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: Center(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online_rounded),
            label: 'Materials',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_rounded),
            label: 'Schedules',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_rounded),
            label: 'Marks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Account',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
