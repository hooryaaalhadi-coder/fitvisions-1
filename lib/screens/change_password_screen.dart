import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/custom_back_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  static const bg = Color(0xFFD3D9CC);
  static const brown = Color(0xFF5E4747);

  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirm = true;
  bool loading = false;

  Future<void> changePassword() async {
    final password = passwordController.text.trim();
    final confirm = confirmController.text.trim();

    if (password.isEmpty || confirm.isEmpty) {
      showMessage('Please fill all fields');
      return;
    }

    if (!AuthService.isValidPassword(password)) {
      showMessage(
        'Password must be 8-15 chars with uppercase, lowercase, and special character',
      );
      return;
    }

    if (password != confirm) {
      showMessage('Passwords do not match');
      return;
    }

    try {
      setState(() => loading = true);

      await AuthService.changePassword(password);

      if (!mounted) return;

      showMessage('Password changed successfully');
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      showMessage(e.toString());
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: brown),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

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
                Image.asset('images/fv.png', width: 180),
                const SizedBox(height: 25),
                Container(
                  width: 295,
                  padding: const EdgeInsets.fromLTRB(26, 24, 26, 28),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(58),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'CHANGE PASSWORD',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('New Password'),
                      ),
                      const SizedBox(height: 5),
                      passwordField(
                        controller: passwordController,
                        hide: hidePassword,
                        onTap: () {
                          setState(() => hidePassword = !hidePassword);
                        },
                      ),
                      const SizedBox(height: 16),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Confirm Password'),
                      ),
                      const SizedBox(height: 5),
                      passwordField(
                        controller: confirmController,
                        hide: hideConfirm,
                        onTap: () {
                          setState(() => hideConfirm = !hideConfirm);
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Password: 8-15 chars, uppercase, lowercase, special character',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, color: Colors.black54),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: 135,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: loading ? null : changePassword,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: brown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child: loading
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Continue',
                                  style: TextStyle(color: Colors.white),
                                ),
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

  Widget passwordField({
    required TextEditingController controller,
    required bool hide,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 34,
      child: TextField(
        controller: controller,
        obscureText: hide,
        decoration: InputDecoration(
          hintText: 'Aa@12345',
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              hide ? Icons.visibility_off : Icons.visibility,
              size: 18,
            ),
            onPressed: onTap,
          ),
        ),
      ),
    );
  }
}