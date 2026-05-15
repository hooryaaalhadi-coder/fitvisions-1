import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const bg = Color(0xFFD3D9CC);
  static const brown = Color(0xFF5E4747);
  static const purple = Color(0xFF51227D);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: user == null
            ? const Center(
                child: Text('No user logged in'),
              )
            : FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final data =
                      snapshot.data?.data() as Map<String, dynamic>?;

                  final firstName = data?['firstName'] ?? '';
                  final lastName = data?['lastName'] ?? '';
                  final email = data?['email'] ?? user.email ?? '';
                  final phone = data?['phone'] ?? '';

                  final fullName = '$firstName $lastName'.trim();

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 70),

                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 35),

                        Container(
                          width: 315,
                          padding: const EdgeInsets.fromLTRB(
                            22,
                            28,
                            22,
                            22,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F4F4),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Edit :',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 15),

                                      Text(
                                        fullName.isEmpty
                                            ? 'User Name'
                                            : fullName,
                                        style: const TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      Text(
                                        email,
                                        style: const TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      Text(
                                        phone.isEmpty
                                            ? '+968 --------'
                                            : '+968 $phone',
                                        style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 25),

                              menuBox([
                                menuRow(
                                  icon: Icons.history,
                                  text: 'My History',
                                  onTap: () {
                                    Navigator.pushNamed(context, '/history');
                                  },
                                ),
                                menuRow(
                                  icon: Icons.workspace_premium,
                                  text: 'Subscription',
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/subscription');
                                  },
                                ),
                                menuRow(
                                  icon: Icons.payment,
                                  text: 'Payment',
                                  onTap: () {
                                    Navigator.pushNamed(context, '/payment');
                                  },
                                  isLast: true,
                                ),
                              ]),

                              const SizedBox(height: 18),

                              menuBox([
                                darkModeRow(),
                                menuRow(
                                  icon: Icons.language,
                                  text: 'Language',
                                  onTap: () {},
                                ),
                                menuRow(
                                  icon: Icons.help,
                                  text: 'Help & support',
                                  onTap: () {},
                                ),
                                menuRow(
                                  icon: Icons.phone,
                                  text: 'Contact Us',
                                  onTap: () {},
                                  isLast: true,
                                ),
                              ]),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: 150,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () async {
                              await AuthService.logout();

                              if (!context.mounted) return;

                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/',
                                (route) => false,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: brown,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: bottomNav(context),
    );
  }

  Widget menuBox(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget menuRow({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(
                  bottom: BorderSide(
                    color: Colors.black26,
                  ),
                ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: [
            Icon(
              icon,
              color: purple,
              size: 28,
            ),
            const SizedBox(width: 22),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Serif',
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 36,
            ),
          ],
        ),
      ),
    );
  }

  Widget darkModeRow() {
    return Container(
      height: 52,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black26),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          const Icon(
            Icons.dark_mode,
            color: purple,
            size: 28,
          ),
          const SizedBox(width: 22),
          const Expanded(
            child: Text(
              'Dark Mode',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Serif',
              ),
            ),
          ),
          Switch(
            value: true,
            activeColor: purple,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget bottomNav(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/tryOnMethod');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/profile');
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/history');
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Text(
            '🏠',
            style: TextStyle(fontSize: 28),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Text(
            '👤',
            style: TextStyle(fontSize: 28),
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Text(
            '🕘',
            style: TextStyle(fontSize: 28),
          ),
          label: 'History',
        ),
      ],
    );
  }
}