import 'package:flutter/material.dart';
import 'admin_dashboard_screen.dart';

class AdminSystemScreen extends StatelessWidget {
  const AdminSystemScreen({super.key});

  static const bg = Color(0xFFD3D9CC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),

            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 38),

            const Text(
              'Manage System',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 32),

            Container(
              width: 285,
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Text(
                    'Clothes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),
                  const SizedBox(height: 16),
                  row(Icons.add_box, 'Add'),
                  row(Icons.edit_square, 'Edit'),
                  row(Icons.delete, 'Delete'),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: 285,
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Text(
                    'feedback',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),
                  const SizedBox(height: 16),
                  row(Icons.flag, 'View Issues'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: adminBottomNav(context, 2),
    );
  }

  Widget row(IconData icon, String title) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 23),
          const SizedBox(width: 25),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Serif',
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 30,
          ),
        ],
      ),
    );
  }
}