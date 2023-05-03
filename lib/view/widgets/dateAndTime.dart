import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../pages/confirmationPage.dart';

class MyDateAndTime extends StatelessWidget {
  @override
  var Box = GetStorage();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: Text('Choose a time slot'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: 13,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 60,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Box.write(
                      'timeSelected',
                      DateFormat.jm().format(DateTime(22, 10, 1995, 18, 00)
                          .add(Duration(minutes: index * 30))));
                  Get.to(() => ConfirmationPage());
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue,
                  ),
                  child: Text(
                      '${DateFormat.jm().format(DateTime(22, 10, 1995, 18, 00).add(Duration(minutes: index * 30)))}'),
                ),
              );
            },
          ),
        ));
  }
}
