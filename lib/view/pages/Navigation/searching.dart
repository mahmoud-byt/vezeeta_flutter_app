
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vezeeta_app/view/pages/searching/specialities.dart';
import 'package:vezeeta_app/view/widgets/bookingCard.dart';
import 'package:vezeeta_app/view/widgets/gridItem.dart';
import 'package:vezeeta_app/view/widgets/searchInput.dart';

import '../AskDoc.dart';

class Searching extends StatelessWidget {
  Searching({super.key});
  List<String> imagesUrls = [
    'assets/images.jpg',
    'assets/download (2).jpg',
    'assets/download.jpg',
    'assets/download (1).jpg',
  ];
  final Box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 120),
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Box.write('gesture', i);
                          switch (i) {
                            case 0:
                              Get.to(() => Specialities());
                              break;
                            case 3:
                              Get.to(() => Specialities());
                              break;
                          }
                        },
                        child: GridItem(
                            imageUrl: imagesUrls[i],
                            text: [
                              "1".tr,
                              "2".tr,
                              "3".tr,
                              "4".tr,
                            ][i]),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              SearchingInput(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Specialities()));
                  },
                  headLine: '5'.tr,
                  placeholder: '6'.tr),
              const SizedBox(
                height: 20,
              ),
              SearchingInput(headLine: '7'.tr, placeholder: '8'.tr),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26,
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.question_answer,
                      color: Colors.blue[600],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Have a Medical Question ? ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Ask a doctor for free and get a response in 24 hours',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AskDoctor());
                      },
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue.withOpacity(0.3)),
                          child: Text(
                            'Ask now',
                            style: TextStyle(color: Colors.blue[600]),
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BookingCard(
                  onTap: () {
                    Box.write('gesture', 3);
                    Get.to(() => Specialities());
                  },
                  head: 'Home Visit',
                  body:
                      'Choose the speciality,and the doctor will visit you at home',
                  buttonText: 'Book Visit',
                  imageUrl: 'assets/doctor.png'),
              const SizedBox(
                height: 20,
              ),
              BookingCard(
                  head: 'Doctor Call',
                  body:
                      'Schedule a voice or vedio call with a specialized doctor',
                  buttonText: 'Book Now',
                  imageUrl:
                      'assets/lady-talking-doctor-via-video-call-smartphone-indoor-sick-lady-talking-doctor-online-via-video-call-smartphone-203570608.jpg'),
            ],
          )),
    ));
  }
}
