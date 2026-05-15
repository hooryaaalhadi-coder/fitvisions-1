import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() =>
      _FeedbackScreenState();
}

class _FeedbackScreenState
    extends State<FeedbackScreen> {

  static const bg = Color(0xFFD3D9CC);
  static const brown = Color(0xFF5E4747);

  final feedbackController =
      TextEditingController();

  int selectedStars = 5;

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

            const SizedBox(height: 35),

            const Text(
              'Feedback',

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 28),

            Container(
              width: 300,
              height: 390,

              padding:
                  const EdgeInsets.fromLTRB(
                24,
                30,
                24,
                25,
              ),

              decoration: BoxDecoration(
                color:
                    const Color(0xFFF4F4F4),

                borderRadius:
                    BorderRadius.circular(45),
              ),

              child: Column(
                children: [

                  const Text(
                    'Rate Your Experience',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: List.generate(
                      5,

                      (index) {

                        return GestureDetector(
                          onTap: () {

                            setState(() {
                              selectedStars =
                                  index + 1;
                            });
                          },

                          child: Icon(
                            Icons.star,

                            size: 42,

                            color:
                                index <
                                        selectedStars
                                    ? Colors.amber
                                    : Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Align(
                    alignment:
                        Alignment.centerLeft,

                    child: Text(
                      'Write the feedback :',

                      style: TextStyle(
                        fontSize: 14,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    width: double.infinity,
                    height: 140,

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                      ),
                    ),

                    child: TextField(
                      controller:
                          feedbackController,

                      maxLines: null,

                      expands: true,

                      decoration:
                          const InputDecoration(
                        border:
                            InputBorder.none,

                        contentPadding:
                            EdgeInsets.all(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: 135,
                    height: 44,

                    child: ElevatedButton(
                      onPressed: () {

                        Navigator.pushNamed(
                          context,
                          '/history',
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
                              BorderRadius
                                  .circular(7),
                        ),
                      ),

                      child: const Text(
                        'Submit',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Your feedback helps us improve\nthe app !!',

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
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
}