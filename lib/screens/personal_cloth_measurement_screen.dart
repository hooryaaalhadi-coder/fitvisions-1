import 'package:flutter/material.dart';

class PersonalClothMeasurementScreen extends StatelessWidget {
  const PersonalClothMeasurementScreen({super.key});

  static const bg = Color(0xFFD3D9CC);
  static const brown = Color(0xFF5E4747);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 320,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                Image.asset(
                  'images/fv.png',
                  width: 145,
                ),

                const SizedBox(height: 22),

                const Text(
                  'Enter your\nMeasurements',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),

                const SizedBox(height: 18),

                Expanded(
                  child: Container(
                    width: 290,
                    padding: const EdgeInsets.fromLTRB(26, 34, 26, 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(58),
                    ),
                    child: Column(
                      children: [
                        row('Height', '175    cm'),
                        row('Weight', '55    kg'),
                        row('Chest', '96    cm'),
                        row('Waist', '75    cm'),
                        row('Hips', '75    cm'),
                        row('Upload\nphoto', ''),
                        row('Personal\nphoto', ''),

                        const Spacer(),

                        SizedBox(
                          width: 135,
                          height: 43,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/avatar');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: brown,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: const Text(
                              'Generate',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNav(context),
    );
  }

  Widget row(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            child: Text(
              label,
              style: const TextStyle(fontSize: 15, height: 1.05),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 29,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 2),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNav(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black87,
      backgroundColor: Colors.white,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Text('🏠', style: TextStyle(fontSize: 24)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Text('🕘', style: TextStyle(fontSize: 24)),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Text('👤', style: TextStyle(fontSize: 24)),
          label: 'Profile',
        ),
      ],
    );
  }
}