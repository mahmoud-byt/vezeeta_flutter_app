import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vezeeta_app/view/pages/Doctors.dart';

import '../HomeVisit.dart';

class Cities extends StatelessWidget {
  Cities({super.key});

  final Box = GetStorage();

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('City').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: const Text('Select city'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return GestureDetector(
                    onTap: () {
                      switch (Box.read('gesture')) {
                        case 0:
                          Get.to(() => DoctorsPage());
                          break;
                        case 3:
                          Get.to(() => HomeVisit());
                      }
                      Box.write('city', data['Name']);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListTile(title: Text(data['Name'])),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            )
                          ],
                        )));
              }).toList(),
            );
          },
        ));
  }
}
