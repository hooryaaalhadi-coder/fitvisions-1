import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() =>
      _PaymentScreenState();
}

class _PaymentScreenState
    extends State<PaymentScreen> {

  static const bg = Color(0xFFD3D9CC);
  static const brown = Color(0xFF5E4747);

  final holderController =
      TextEditingController();

  final cardController =
      TextEditingController();

  final expiryController =
      TextEditingController();

  final cvvController =
      TextEditingController();

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

            const SizedBox(height: 10),

            const Text(
              'Payment',

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: 300,

              padding:
                  const EdgeInsets.fromLTRB(
                20,
                28,
                20,
                30,
              ),

              decoration: BoxDecoration(
                color:
                    const Color(0xFFF4F4F4),

                borderRadius:
                    BorderRadius.circular(45),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      cardImage(
                        'images/p1.png',
                      ),

                      cardImage(
                        'images/p2.png',
                      ),

                      cardImage(
                        'images/p3.png',
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  label(
                    'Card Holder Name',
                  ),

                  field(
                    controller:
                        holderController,

                    hint: 'John Doe',
                  ),

                  const SizedBox(height: 18),

                  label('Card Number'),

                  field(
                    controller:
                        cardController,

                    hint:
                        '000 000 000 00',

                    keyboard:
                        TextInputType.number,
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: [

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            label(
                              'Expiry Date',
                            ),

                            field(
                              controller:
                                  expiryController,

                              hint: '04/28',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            label('CVV'),

                            field(
                              controller:
                                  cvvController,

                              hint: '0000',

                              keyboard:
                                  TextInputType
                                      .number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: 135,
              height: 46,

              child: ElevatedButton(
                onPressed: () {

                  Navigator.pushNamed(
                    context,
                    '/avatar',
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
                  'Pay',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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

  Widget cardImage(String image) {

    return Container(
      width: 78,
      height: 32,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(8),

        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black12,
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(5),

        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget label(String text) {

    return Padding(
      padding:
          const EdgeInsets.only(
        left: 10,
        bottom: 6,
      ),

      child: Text(
        text,

        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget field({
    required TextEditingController
        controller,

    required String hint,

    TextInputType keyboard =
        TextInputType.text,
  }) {

    return SizedBox(
      height: 48,

      child: TextField(
        controller: controller,
        keyboardType: keyboard,

        decoration: InputDecoration(
          hintText: hint,

          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),

          filled: true,
          fillColor:
              const Color(0xFFECEFF7),

          contentPadding:
              const EdgeInsets.symmetric(
            horizontal: 18,
          ),

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(25),

            borderSide:
                const BorderSide(
              color: Colors.black54,
            ),
          ),

          enabledBorder:
              OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(25),

            borderSide:
                const BorderSide(
              color: Colors.black54,
            ),
          ),

          focusedBorder:
              OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(25),

            borderSide:
                const BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}