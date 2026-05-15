import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_back_button.dart';

class PhoneResetScreen extends StatefulWidget {
  const PhoneResetScreen({super.key});

  @override
  State<PhoneResetScreen> createState() => _PhoneResetScreenState();
}

class _PhoneResetScreenState extends State<PhoneResetScreen> {
  static const bg = Color(0xFFD3D9CC);
  static const brown = Color(0xFF5E4747);

  final phoneController = TextEditingController();
  final codeController = TextEditingController();

  bool codeSent = false;
  bool loading = false;
  String verificationId = '';

  Future<void> sendCode() async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty) {
      showMessage('Please enter phone number');
      return;
    }

    if (!RegExp(r'^[0-9]{8}$').hasMatch(phone)) {
      showMessage('Oman phone number must be 8 digits');
      return;
    }

    try {
      setState(() => loading = true);

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+968$phone',
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {
          showMessage('Phone auto verified');
        },
        verificationFailed: (FirebaseAuthException e) {
          showMessage('Firebase phone error: ${e.code} - ${e.message}');
        },
        codeSent: (String vId, int? resendToken) {
          setState(() {
            verificationId = vId;
            codeSent = true;
          });

          showMessage(
            'Code sent. If you use test number, enter the test code from Firebase.',
          );
        },
        codeAutoRetrievalTimeout: (String vId) {
          verificationId = vId;
        },
      );
    } catch (e) {
      showMessage('Firebase error: $e');
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  Future<void> verifyCode() async {
    final code = codeController.text.trim();

    if (code.isEmpty) {
      showMessage('Please enter verification code');
      return;
    }

    if (verificationId.isEmpty) {
      showMessage('Please press Send Code first');
      return;
    }

    try {
      setState(() => loading = true);

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      if (!mounted) return;

      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Phone Verified'),
            content: const Text(
              'Your phone number has been verified.\n\nNow login again or use the email reset link to change password.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showMessage('Invalid code: ${e.code} - ${e.message}');
    } catch (e) {
      showMessage('Firebase error: $e');
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: brown,
        duration: const Duration(seconds: 6),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomBackButton(),
                  Image.asset('images/fv.png', width: 180),
                  const SizedBox(height: 30),
                  Container(
                    width: 295,
                    padding: const EdgeInsets.fromLTRB(26, 25, 26, 28),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(58),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'PHONE RESET',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'Enter your phone number to receive a verification code.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 22),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Phone Number'),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 34,
                          child: TextField(
                            controller: phoneController,
                            enabled: !codeSent,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              prefixText: '+968 ',
                              hintText: '91234567',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        if (codeSent) ...[
                          const SizedBox(height: 18),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Verification Code'),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 34,
                            child: TextField(
                              controller: codeController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: '123456',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 24),
                        SizedBox(
                          width: 150,
                          height: 42,
                          child: ElevatedButton(
                            onPressed: loading
                                ? null
                                : codeSent
                                    ? verifyCode
                                    : sendCode,
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
                                : Text(
                                    codeSent ? 'Verify' : 'Send Code',
                                    style: const TextStyle(color: Colors.white),
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
      ),
    );
  }
}