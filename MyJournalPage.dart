// my_journal_page.dart

import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'my_profile_page.dart';


class AppColors {
  static const Color primaryGreen = Color(0xFF2C6C63);
  static const Color primaryPurple = Color(0xFF5A487B);
  static const Color backgroundColor = Color(0xFFF5F5F5);
}

class MyJournalPage extends StatefulWidget {
  const MyJournalPage({super.key});

  @override
  State<MyJournalPage> createState() => _MyJournalPageState();
}

class _MyJournalPageState extends State<MyJournalPage> {
  int _selectedIndex = 1; // 1 represents the Journal tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        // Already on the Journal page, no action needed
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyProfilePage()),
        );
        break;
      case 3:
      // Settings Page - Not implemented yet
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // The default back button appears automatically
        // when the page is not the root of the navigation stack.
        // We can remove the custom leading icon to enable it.
        // leading: Builder(...) // No longer needed
        title: const Text(
          'My Journal',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.smart_toy,
              color: Colors.green[900],
              size: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // مثال على ملاحظة واحدة
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Note Title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.primaryPurple,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // وظيفة إضافة ملاحظة جديدة
        },
        backgroundColor: AppColors.primaryPurple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}