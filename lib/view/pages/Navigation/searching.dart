import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vezeeta_app/view/widgets/bookingCard.dart';
import 'package:vezeeta_app/view/widgets/gridItem.dart';
import 'package:vezeeta_app/view/widgets/searchInput.dart';

class Searching extends StatelessWidget {
  Searching({super.key});
  List<String> imagesUrls = [
    'assets/images.jpg',
    'assets/download (2).jpg',
    'assets/download.jpg',
    'assets/download (1).jpg',
  ];
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
                      return GridItem(
                          imageUrl: imagesUrls[i],
                          text: [
                            'Clinic Visit',
                            'Pharmacy',
                            'Doctor Call',
                            'Home Visit'
                          ][i]);
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              SearchingInput(
                  headLine: 'Book Clinic Appointment',
                  placeholder: 'Search for Speciality,Doctor or Hospital'),
              const SizedBox(
                height: 20,
              ),
              SearchingInput(
                  headLine: 'Order Medicines',
                  placeholder: 'What are you looking for ? '),
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
                      onTap: () {},
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
