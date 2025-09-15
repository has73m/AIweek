import 'package:flutter/material.dart';
import 'package:src/GuideScreen2.dart'; // تأكد من أن هذا المسار صحيح

class GuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // الأيقونة والجملة العلوية
            Icon(Icons.medical_information_sharp, size: 100, color: Colors.green[900]),
            SizedBox(height: 15),
            Text(
              'Who Is Mental Health Support',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            // -- التعديل هنا: كل جملة في مستطيل منفصل --
            // تم استبدال البوكس الكبير بمجموعة من المستطيلات الصغيرة
            guidelineItem('1. Practice mindfulness daily.'),
            SizedBox(height: 15),
            guidelineItem('2. Maintain a balanced diet.'),
            SizedBox(height: 15),
            guidelineItem('3. Exercise regularly.'),
            SizedBox(height: 15),
            guidelineItem('4. Get enough sleep.'),
            SizedBox(height: 15),
            guidelineItem('5. Talk to someone you trust.'),
          ],
        ),
      ),
      // -- التعديل هنا: إضافة الزر العائم --
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // الانتقال إلى الصفحة الثانية Guide2
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Guidescreen2()),
          );
        },
        label: Text(
          'Next',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.arrow_forward, color: Colors.white),
        backgroundColor: Colors.green[900],
      ),
    );
  }

  // ويدجت لتسهيل تكرار تصميم المستطيلات
  Widget guidelineItem(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18), // تم تصغير حجم الخط قليلاً ليناسب التصميم
      ),
    );
  }
}