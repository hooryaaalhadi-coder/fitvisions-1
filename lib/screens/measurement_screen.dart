import 'package:flutter/material.dart';

class MeasurementScreen extends StatelessWidget {
  const MeasurementScreen({super.key});

  static const bg = Color(0xFFD3D9CC);
  static const brown = Color(0xFF6B504E);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bg,

      appBar: AppBar(
        backgroundColor: brown,
        foregroundColor: Colors.white,
        title: const Text('Measurement'),
      ),

      body: Center(
        child: SizedBox(
          width: 320,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              field('Height'),
              const SizedBox(height: 15),

              field('Weight'),
              const SizedBox(height: 15),

              field('Chest'),
              const SizedBox(height: 15),

              field('Waist'),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: brown,
                ),

                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget field(String hint) {

    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}