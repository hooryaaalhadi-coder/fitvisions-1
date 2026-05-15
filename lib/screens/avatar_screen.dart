import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  static const bg = Color(0xFFD3D9CC);
  static const brown = Color(0xFF5E4747);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bg,

      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerLeft,

              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 34,
                ),
              ),
            ),

            Image.asset(
              'images/fv.png',
              width: 145,
            ),

            const SizedBox(height: 12),

            const Text(
              'Generating Avatar',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Image.asset(
              'images/fv1.png',
              width: 135,
              height: 280,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                actionButton(
                  text: 'Edit',
                ),

                const SizedBox(width: 14),

                actionButton(
                  text: 'Download',
                ),
              ],
            ),

            const SizedBox(height: 22),

            SizedBox(
              width: 135,
              height: 43,

              child: ElevatedButton(
                onPressed: () {

                  Navigator.pushNamed(
                    context,
                    '/feedback',
                  );
                },

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor: brown,
                  elevation: 0,

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(7),
                  ),
                ),

                child: const Text(
                  'Continue',

                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar:
          BottomNavigationBar(

        currentIndex: 0,

        selectedItemColor:
            Colors.black,

        unselectedItemColor:
            Colors.black87,

        backgroundColor:
            Colors.white,

        type:
            BottomNavigationBarType.fixed,

        onTap: (index) {

          if (index == 0) {

            Navigator.pushReplacementNamed(
              context,
              '/tryOnMethod',
            );

          } else if (index == 1) {

            Navigator.pushNamed(
              context,
              '/history',
            );

          } else if (index == 2) {

            Navigator.pushNamed(
              context,
              '/profile',
            );
          }
        },

        items: const [

          BottomNavigationBarItem(
            icon: Text(
              '🏠',
              style:
                  TextStyle(fontSize: 24),
            ),

            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Text(
              '🕘',
              style:
                  TextStyle(fontSize: 24),
            ),

            label: 'History',
          ),

          BottomNavigationBarItem(
            icon: Text(
              '👤',
              style:
                  TextStyle(fontSize: 24),
            ),

            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget actionButton({
    required String text,
  }) {

    return SizedBox(
      width: 128,
      height: 43,

      child: ElevatedButton(
        onPressed: () {},

        style:
            ElevatedButton.styleFrom(
          backgroundColor: brown,
          elevation: 0,

          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(7),
          ),
        ),

        child: Text(
          text,

          style: const TextStyle(
            color: Colors.white,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }
}