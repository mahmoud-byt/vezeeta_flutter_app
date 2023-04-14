import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vezeeta_app/view/widgets/DateWidget.dart';
import 'PaymentPage.dart';

class reservationPage extends StatelessWidget {
  reservationPage(
      {super.key,
      this.description,
      this.imgUrl,
      this.doctorName,
      this.rate,
      required this.fees,
      this.location,
      this.waitingTime});
  String? imgUrl;
  String? doctorName;
  String? description;
  double? rate;
  int fees;
  String? location;
  String? waitingTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Doctor Profile'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.black38,
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(imgUrl ??= 'Not found')),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Doctor',
                                style: TextStyle(
                                    color: Colors.blue[600], fontSize: 14),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                doctorName!,
                                style: TextStyle(
                                    color: Colors.blue[600],
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            description ??= 'specialist in this field',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: List.generate(
                                5,
                                (i) => Icon(
                                      Icons.star,
                                      size: 14,
                                      color: i <= rate!.round() - 1
                                          ? Colors.yellow
                                          : Colors.grey,
                                    )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.black38,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.moneyBillWave,
                            color: Colors.blue[600],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${fees.toString()} EGP',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationPin,
                            color: Colors.blue[600],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            location!,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            DateWidget(),
            const SizedBox(
              height: 20,
            ),
            
          ],
        ));
  }
}
