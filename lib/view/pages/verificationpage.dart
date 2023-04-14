import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({super.key,required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
               const Icon(
                  Icons.check_circle_outlined,
                  color: Colors.green,
                  size: 40,
                ),
               const Text(
                  'شكرا لك',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  text,
                  style:const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
    );
  }
}
