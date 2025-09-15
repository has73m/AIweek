import 'package:flutter/material.dart';
import 'package:src/GuideScreen.dart';
import 'package:src/homePage.dart';

class Guidescreen2 extends StatelessWidget {
  const Guidescreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back arrow
              GestureDetector(
                onTap: () {
                  // Using pop to go back to the previous screen
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back, size: 30),
              ),
              const SizedBox(height: 20),

              // Large icon
              const Center(
                child: Icon(
                  Icons.medical_information,
                  size: 100,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),

              // Text under the icon
              const Center(
                child: Text(
                  'You have successfully completed the guide!', // Translated text
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),

              // Using the same design as the first page for the containers
              guidelineItem('Understand your mental needs.'), // Translated text
              const SizedBox(height: 15),
              guidelineItem('Set achievable goals.'), // Translated text
              const SizedBox(height: 15),
              guidelineItem(
                'Start with small steps towards change.',
              ), // Translated text
              const SizedBox(height: 40),

              // Enthusiastic welcome phrase
              const Center(
                child: Text(
                  'We are happy to have you! Get ready for a journey towards better mental health.', // Translated text
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const Spacer(),

              // Navigation buttons: Prev and Next
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Prev button
                  TextButton.icon(
                    onPressed: () {
                      GuideScreen();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.green[900]),
                    label: Text(
                      'Prev',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Next button
                  // Finish button (corrected from Next)
                  TextButton.icon(
                    onPressed: () {
                      // -- التعديل هنا --
                      // استخدام pushReplacement للانتقال إلى الصفحة الرئيسية ومنع الرجوع إلى الدليل
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    label: Text(
                      'Finish', // تم تصحيح الخطأ الإملائي
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green[900],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Same widget from the first page to maintain design consistency
  Widget guidelineItem(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.05),
        border: Border.all(color: Colors.green, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18)),
    );
  }
}
