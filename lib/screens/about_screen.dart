import 'package:flutter/material.dart';
import '../widgets/custom_back_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const bg = Color(0xFFD3D9CC);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bg,

      body: SafeArea(
        child: Column(
          children: [

            const CustomBackButton(),

            const SizedBox(height: 20),

            Image.asset(
              'images/fv.png',
              width: 170,
            ),

            const SizedBox(height: 30),

            Container(
              width: 310,

              padding: const EdgeInsets.all(28),

              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),

                borderRadius:
                    BorderRadius.circular(45),
              ),

              child: const Column(
                children: [

                  Text(
                    'ABOUT US',

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 24),

                  Text(
                    'FitVisions is a smart virtual try-on application that helps users visualize clothes before purchasing them.\n\nThe application combines measurements, clothing images, and avatar generation to create a modern shopping experience.',

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}