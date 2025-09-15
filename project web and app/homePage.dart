// HomePage.dart

import 'package:flutter/material.dart';
import "MyJournalPage.dart";
import 'my_profile_page.dart';
import 'ChatbotPage.dart'; // Add this line to import your chatbot page

class AppColors {
  static const Color primaryGreen = Color(0xFF2C6C63);
  static const Color primaryPurple = Color(0xFF5A487B);
  static const Color backgroundColor = Color(0xFFF5F5F5);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mental Wellness App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

// تحويل الصفحة إلى StatefulWidget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // 0 يمثل علامة تبويب Home

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // أنت بالفعل في الصفحة الرئيسية، لا حاجة للتنقل
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyJournalPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyProfilePage()),
        );
        break;
      case 3:
      // صفحة الإعدادات - لم يتم التنفيذ بعد
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.green[900], size: 40),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
       
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 100,),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black,),
              title: const Text('My Profile', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.sentiment_satisfied_alt, color: Colors.black,),
              title: const Text('Chatbot AI', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Navigate to the ChatbotPage from the Drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatbotPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_rounded, color: Colors.black,),
              title: const Text('My Journal', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context); // لإغلاق الـ Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyJournalPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.self_improvement, color: Colors.black,),
              title: const Text('Breathing Exercise', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black,),
              title: const Text('Settings', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: AppColors.primaryPurple,),
              title: const Text('Log out', style: TextStyle(color: AppColors.primaryPurple, fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hey there!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Monday 15, 2025',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'How are you feeling today ?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildFeelingButtons(context),
              const SizedBox(height: 12),
              _buildQuoteCard(),
              const SizedBox(height: 12),
              _buildJournalButton(context),
              const SizedBox(height: 12),
              _buildBreathingCard(),
            ],
          ),
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
        onTap: _onItemTapped, // ربط وظيفة التنقل
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the ChatbotPage from the FAB
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatbotPage()),
          );
        },
        backgroundColor: AppColors.primaryGreen,
        child: const Icon(Icons.smart_toy, color: Colors.white, size: 30),
      ),
    );
  }

  // الدوال الأخرى (_buildFeelingButtons, _showEmotionDialog, etc.) تبقى كما هي...

  Widget _buildFeelingButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _EmotionIcon(
          label: 'Happy',
          icon: Icons.sentiment_very_satisfied,
          color: Colors.green,
          onTap: () => _showEmotionDialog(
            context,
            'Happy',
            Icons.sentiment_very_satisfied,
            Colors.green,
            "Happiness can increase your energy levels, strengthen your immune system, and boost your overall well-being. Share a smile with someone today!",
          ),
        ),
        _EmotionIcon(
          label: 'Calm',
          icon: Icons.brightness_6,
          color: AppColors.primaryPurple,
          onTap: () => _showEmotionDialog(
            context,
            'Calm',
            Icons.brightness_6,
            AppColors.primaryPurple,
            "Feeling calm helps reduce stress and improve your concentration. Try a few deep breaths to center yourself and find your inner balance.",
          ),
        ),
        _EmotionIcon(
          label: 'Angry',
          icon: Icons.sentiment_very_dissatisfied,
          color: Colors.red,
          onTap: () => _showEmotionDialog(
            context,
            'Angry',
            Icons.sentiment_very_dissatisfied,
            Colors.red,
            "It's okay to feel angry. When you do, take a moment to pause. Stepping back can help you respond thoughtfully instead of reacting impulsively.",
          ),
        ),
        _EmotionIcon(
          label: 'Sad',
          icon: Icons.sentiment_dissatisfied,
          color: Colors.blue,
          onTap: () => _showEmotionDialog(
            context,
            'Sad',
            Icons.sentiment_dissatisfied,
            Colors.blue,
            "Sadness is a natural part of life. Remember to be kind to yourself and reach out to someone you trust. You don't have to go through this alone.",
          ),
        ),
        _EmotionIcon(
          label: 'Mindful',
          icon: Icons.self_improvement,
          color: AppColors.primaryGreen,
          onTap: () => _showEmotionDialog(
            context,
            'Mindful',
            Icons.self_improvement,
            AppColors.primaryGreen,
            "Mindfulness means being fully present in the moment. It can help calm your mind, reduce anxiety, and bring a sense of peace to your day.",
          ),
        ),
      ],
    );
  }

  void _showEmotionDialog(BuildContext context, String label, IconData icon, Color color, String description) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Icon(
                  icon,
                  color: color,
                  size: 50,
                ),
                const SizedBox(height: 16),
                Text(
                  '$label !',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'YOUTUBE LINK',
                    style: TextStyle(
                      color: color,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuoteCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.primaryPurple.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              "\"It is better to conquer yourself than to win a thousand battles\"",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.format_quote, color: Colors.white.withOpacity(0.8), size: 36),
        ],
      ),
    );
  }

  Widget _buildJournalButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyJournalPage()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book, color: Colors.white, size: 28),
            SizedBox(width: 10),
            Text(
              'My journal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreathingCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const Stack(
        alignment: Alignment.bottomRight,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Do you make your breathing exercise today?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Let's make it now! ->",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.self_improvement,
                size: 80,
                color: Colors.white,
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Icon(
              Icons.smart_toy,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmotionIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const _EmotionIcon({
    required this.label,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, size: 32, color: color),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}