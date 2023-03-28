import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BookingCard extends StatelessWidget {
  BookingCard(
      {super.key,
      required this.head,
      required this.body,
      required this.buttonText,
      required this.imageUrl});
  String head;
  String body;
  String buttonText;
  String imageUrl;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black26,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(head, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                Text(body, style: const TextStyle(color: Colors.grey)),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width / 2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue.withOpacity(0.3)),
                      child: Text(
                        buttonText,
                        style: TextStyle(color: Colors.blue[600]),
                      )),
                )
              ],
            ),
          ),
          Image(
            image: AssetImage(imageUrl),
            width: MediaQuery.of(context).size.width / 4,
          )
        ],
      ),
    );
  }
}
