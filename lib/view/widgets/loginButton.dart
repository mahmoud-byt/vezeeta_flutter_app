import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton(
      {super.key,
      required this.text,
      required this.icon,
      this.onTap,
      required this.iconColor});
  String text;
  IconData icon;
  Color iconColor;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.grey[800]),
        child: Row(children: [
          Icon(
            icon,
            color: iconColor,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
