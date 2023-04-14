import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/DoctorWidget.dart';

class DoctorsPage extends StatelessWidget {
  DoctorsPage({super.key});

  final Box = GetStorage();

  List<DocumentSnapshot> documents = [];

  @override
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _doctorsStream = FirebaseFirestore.instance
        .collection('Doctor')
        .where('Speciality', isEqualTo: Box.read('speciality'))
        .where('City', isEqualTo: Box.read('city'))
        .snapshots();
    return Scaffold(
        body: SafeArea(
      child: StreamBuilder<QuerySnapshot>(
        stream: _doctorsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child:  CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              return DoctorWidget(
                img: data['ImgUrl'],
                DoctorName: data['Name'],
                about: data['About'],
                Rate: data['Rate'],
                fees: data['ExaminationFees'],
                location: data['Location'],
                waiting: data['Waitingtime'],
              );
            },
          );
        },
      ),
    ));
  }
}
