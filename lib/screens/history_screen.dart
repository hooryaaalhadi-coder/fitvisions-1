import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const bg = Color(0xFFD3D9CC);

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

            const SizedBox(height: 20),

            const Text(
              'History',

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            item(
              image: 'images/fv1.png',
              title: 'White Dishdasha',
              date: 'Apr 21, 2025',
            ),

            item(
              image: 'images/fv2.png',
              title: 'Casual Outfit',
              date: 'Apr 18, 2025',
            ),

            item(
              image: 'images/fv3.png',
              title: 'Black Abaya',
              date: 'Apr 15, 2025',
            ),

            const Spacer(),

            Container(
              width: 220,
              height: 45,

              decoration: BoxDecoration(
                color:
                    const Color(0xFFF4F4F4),

                borderRadius:
                    BorderRadius.circular(30),
              ),

              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Text(
                    'View Details',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(width: 28),

                  Icon(
                    Icons.arrow_forward_ios,
                    size: 34,
                    color: Colors.brown,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),
          ],
        ),
      ),

      bottomNavigationBar:
          BottomNavigationBar(

        currentIndex: 1,

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

            Navigator.pushNamed(
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

  Widget item({
    required String image,
    required String title,
    required String date,
  }) {

    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 14,
      ),

      width: 300,
      height: 95,

      padding:
          const EdgeInsets.symmetric(
        horizontal: 18,
      ),

      decoration: BoxDecoration(
        color:
            const Color(0xFFF4F4F4),

        borderRadius:
            BorderRadius.circular(28),
      ),

      child: Row(
        children: [

          Image.asset(
            image,
            width: 60,
            height: 70,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.w500,
                  ),
                ),

                Text(
                  date,

                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 34,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}