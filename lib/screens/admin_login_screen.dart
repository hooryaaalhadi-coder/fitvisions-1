import 'package:flutter/material.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() =>
      _AdminLoginScreenState();
}

class _AdminLoginScreenState
    extends State<AdminLoginScreen> {

  static const bg = Color(0xFFD3D9CC);
  static const brown = Color(0xFF6B504E);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bg,

      body: Center(
        child: SizedBox(
          width: 310,

          child: SingleChildScrollView(
            child: Column(
              children: [

                Image.asset(
                  'images/fv.png',
                  width: 180,
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(28),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(55),
                  ),

                  child: Column(
                    children: [

                      const Text(
                        'ADMIN LOGIN',
                        style: TextStyle(fontSize: 22),
                      ),

                      const SizedBox(height: 25),

                      TextField(
                        controller: emailController,

                        decoration: const InputDecoration(
                          hintText: 'Admin Email',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 18),

                      TextField(
                        controller: passwordController,
                        obscureText: true,

                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: 160,
                        height: 45,

                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/adminDashboard',
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: brown,
                          ),

                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/adminForgot',
                          );
                        },

                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: brown),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}