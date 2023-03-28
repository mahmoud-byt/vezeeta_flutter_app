import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  GridItem({super.key, required this.imageUrl, required this.text,this.onTap});
  String text;
  String imageUrl;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.black26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 40,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
