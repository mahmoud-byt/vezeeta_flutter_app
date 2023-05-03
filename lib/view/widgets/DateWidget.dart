import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:vezeeta_app/view/widgets/dateAndTime.dart';

class DateWidget extends StatelessWidget {
  DateWidget({super.key});
  var Box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 20),
            width: 80,
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5))),
                    width: 100,
                    padding: EdgeInsets.all(3),
                    child: Text(
                        '${DateFormat('E d/M').format(DateTime.now().add(Duration(days: index)))}')),
                Container(
                  height: 80,
                  width: 98,
                  decoration: const BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.grey, width: 1),
                          right: BorderSide(color: Colors.grey, width: 1))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        '06:00 PM',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'To',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        '12:00 AM',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Box.write(
                        'dateSelected',
                        DateFormat('E d/M')
                            .format(DateTime.now().add(Duration(days: index))));
                    Get.to(() => MyDateAndTime());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    width: 100,
                    child: Text('Book'),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
