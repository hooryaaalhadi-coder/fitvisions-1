import 'package:flutter/material.dart';
import '../widgets/custom_back_button.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

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

                const CustomBackButton(),

                Image.asset(
                  'images/fv.png',
                  width: 160,
                ),

                const SizedBox(height: 30),

                const Text(
                  'Choose Your\nSubscription',

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                  ),
                ),

                const SizedBox(height: 40),

                subscriptionCard(
                  context,
                  price: '7 OMR',
                  duration: 'For 6 Months',
                ),

                const SizedBox(height: 28),

                subscriptionCard(
                  context,
                  price: '3 OMR',
                  duration: 'For 2 Months',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget subscriptionCard(
    BuildContext context, {

    required String price,
    required String duration,
  }) {

    return Container(
      width: 250,

      padding:
          const EdgeInsets.symmetric(
        vertical: 24,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),

        borderRadius:
            BorderRadius.circular(45),
      ),

      child: Column(
        children: [

          Text(
            price,

            style: const TextStyle(
              fontSize: 26,
              fontWeight:
                  FontWeight.bold,

              color: brown,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            duration,

            style: const TextStyle(
              fontSize: 17,
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: 135,
            height: 42,

            child: ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(
                  context,
                  '/payment',
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
                'Choose',

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
    );
  }
}