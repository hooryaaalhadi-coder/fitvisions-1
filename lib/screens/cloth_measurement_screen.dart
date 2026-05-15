import 'package:flutter/material.dart';

class ClothMeasurementScreen
    extends StatelessWidget {

  const ClothMeasurementScreen({
    super.key,
  });

  static const bg =
      Color(0xFFD3D9CC);

  static const brown =
      Color(0xFF5E4747);

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

                const SizedBox(height: 10),

                Align(
                  alignment:
                      Alignment.centerLeft,

                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 34,
                    ),

                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                  ),
                ),

                Container(
                  width: 235,
                  height: 88,

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),

                  child: Center(
                    child: Image.asset(
                      'images/fv.png',
                      width: 145,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                const Text(
                  'Enter your\nMeasurements',

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 17,
                    fontWeight:
                        FontWeight.bold,
                    height: 1.1,
                  ),
                ),

                const SizedBox(height: 25),

                Expanded(
                  child: Container(
                    width: 290,

                    padding:
                        const EdgeInsets.fromLTRB(
                      26,
                      38,
                      26,
                      20,
                    ),

                    decoration: BoxDecoration(
                      color:
                          const Color(
                        0xFFF4F4F4,
                      ),

                      borderRadius:
                          BorderRadius.circular(
                        58,
                      ),
                    ),

                    child: Column(
                      children: [

                        row(
                          'Height',
                          '175    cm',
                        ),

                        row(
                          'Weight',
                          '55    kg',
                        ),

                        row(
                          'Chest',
                          '96    cm',
                        ),

                        row(
                          'Waist',
                          '75    cm',
                        ),

                        row(
                          'Hips',
                          '75    cm',
                        ),

                        row(
                          'Upload\nphoto',
                          '',
                        ),

                        const Spacer(),

                        SizedBox(
                          width: 135,
                          height: 43,

                          child: ElevatedButton(
                            onPressed: () {

                              Navigator.pushNamed(
                                context,
                                '/subscription',
                              );
                            },

                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  brown,

                              elevation: 0,

                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                  7,
                                ),
                              ),
                            ),

                            child: const Text(
                              'Continue',

                              style: TextStyle(
                                color:
                                    Colors.white,

                                fontWeight:
                                    FontWeight
                                        .bold,
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

      bottomNavigationBar:
          bottomNav(context),
    );
  }

  Widget row(
    String label,
    String hint,
  ) {

    return Padding(
      padding:
          const EdgeInsets.only(
        bottom: 16,
      ),

      child: Row(
        children: [

          SizedBox(
            width: 72,

            child: Text(
              label,

              style: const TextStyle(
                fontSize: 15,
                height: 1.05,
              ),
            ),
          ),

          Expanded(
            child: SizedBox(
              height: 29,

              child: TextField(
                textAlign:
                    TextAlign.center,

                decoration:
                    InputDecoration(
                  hintText: hint,

                  hintStyle:
                      const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),

                  contentPadding:
                      const EdgeInsets
                          .symmetric(
                    vertical: 2,
                  ),

                  filled: true,
                  fillColor:
                      Colors.white,

                  border:
                      const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.zero,

                    borderSide:
                        BorderSide(
                      color:
                          Colors.black54,
                    ),
                  ),

                  enabledBorder:
                      const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.zero,

                    borderSide:
                        BorderSide(
                      color:
                          Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNav(
    BuildContext context,
  ) {

    return BottomNavigationBar(
      currentIndex: 0,

      selectedItemColor:
          Colors.black,

      unselectedItemColor:
          Colors.black87,

      backgroundColor:
          Colors.white,

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
    );
  }
}