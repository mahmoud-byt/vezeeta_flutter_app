import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vezeeta_app/view/pages/homePage.dart';

class numberVerification extends StatefulWidget {
  numberVerification(verificationId);

  @override
  State<numberVerification> createState() => _numberVerificationState();
}

class _numberVerificationState extends State<numberVerification> {
  final TextEditingController _NumberVerifiedController =
      TextEditingController();

  String? verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.grey,
              controller: _NumberVerifiedController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 14),
                hintText: "Phone number*",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.grey)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId!,
                    smsCode: _NumberVerifiedController.text);
                await FirebaseAuth.instance.signInWithCredential(credential);
                if (FirebaseAuth.instance.currentUser != null) {
                  Get.to(HomePage());
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue[600]),
                child: const Text(
                  'continue with phone number',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
