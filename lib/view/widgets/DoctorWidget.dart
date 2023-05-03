import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';

import '../pages/reservationPage.dart';

var Box = GetStorage();

class DoctorWidget extends StatelessWidget {
  DoctorWidget(
      {super.key,
      this.img,
      this.DoctorName,
      this.Rate,
      this.about,
      this.location,
      required this.fees,
      this.waiting});
  String? img;
  String? DoctorName;
  double? Rate;
  String? about;
  String? location;
  int fees;
  String? waiting;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(img ??= 'Not found')),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Container(
                  child: Column(
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
                            DoctorName!,
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
                        about ??= 'specialist in this field',
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
                                  color: i <= Rate!.round() - 1
                                      ? Colors.yellow
                                      : Colors.grey,
                                )),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          Container(
            color: Colors.black38,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.stethoscope,
                      color: Colors.blue[600],
                      size: 14,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      about ??= 'specialist in this field',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.moneyBill1Wave,
                      color: Colors.blue[600],
                      size: 14,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      '${fees.toString()} EGP',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.locationDot,
                      size: 14,
                      color: Colors.blue[600],
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      location!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.clock,
                      size: 14,
                      color: Colors.blue[600],
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      'waiting time : ${waiting!}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Box.write('fees', fees);
                    Box.write('docname', DoctorName);
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => reservationPage(
                                  description: about,
                                  doctorName: DoctorName,
                                  imgUrl: img,
                                  rate: Rate,
                                  fees: fees,
                                  location: location,
                                )));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red[600]),
                    child: const Text(
                      'Book',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
