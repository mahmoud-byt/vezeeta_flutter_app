import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton(
      {super.key, required this.icon, required this.text, this.onTap});
  IconData icon;
  String text;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.black38,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      icon,
                      color: Colors.blue[600],
                    ),
                  ),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}
