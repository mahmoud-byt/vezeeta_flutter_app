import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Cities.dart';
import 'package:get_storage/get_storage.dart';

class Specialities extends StatefulWidget {
  Specialities({super.key});

  @override
  State<Specialities> createState() => _SpecialitiesState();
}

class _SpecialitiesState extends State<Specialities> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Speciality').snapshots();

  late int indexx;
  List<IconData> icons = [
    FontAwesomeIcons.hands,
    FontAwesomeIcons.tooth,
    FontAwesomeIcons.brain,
    FontAwesomeIcons.earListen,
    Icons.child_care,
    FontAwesomeIcons.brain,
    FontAwesomeIcons.bone,
    Icons.woman,
  ];

  final Box = GetStorage();
  @override
  void initState() {
    super.initState();
    indexx = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: const Text('Select specility'),
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
                indexx++;
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return GestureDetector(
                    onTap: () {
                      if (Box.read('prev') == 'ask') {
                        Get.back();
                      } else if (Box.read('prev') == null) {
                        Get.to(() => Cities());
                      }

                      Box.write('speciality', data['Name']);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListTile(
                                leading: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      icons[indexx],
                                      color: Colors.blue[600],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 15,
                                      height: 3,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                                title: Text(data['Name'])),
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
