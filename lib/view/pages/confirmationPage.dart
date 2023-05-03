import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vezeeta_app/view/pages/verificationpage.dart';

import 'PaymentPage.dart';

class ConfirmationPage extends StatelessWidget {
  ConfirmationPage({super.key});
  TextEditingController _quesController = TextEditingController();
  TextEditingController _NumController = TextEditingController();
  var Box = GetStorage();
  CollectionReference booking =
      FirebaseFirestore.instance.collection('bookings');
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirmation'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person_2_outlined,
                          size: 25,
                          color: Colors.blue[600],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 120,
                          width: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required';
                                  }
                                  return null;
                                },
                                controller: _quesController,
                                minLines: 1,
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required';
                                  }
                                  return null;
                                },
                                controller: _NumController,
                                minLines: 1,
                                decoration: InputDecoration(
                                  hintText: "Phone Number",
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 25,
                          color: Colors.blue[600],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Box.read('timeSelected'),
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              Box.read('dateSelected'),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        Get.to(() => VerificationPage(
                              text: 'لقد تم حجز ميعاد بنجاح',
                            ));
                        booking
                            .add({
                              'name': _quesController.text,
                              'mobile': _NumController.text,
                              'isPayed': false,
                              'dateSelected': Box.read('dateSelected'),
                              'timeSelected': Box.read('timeSelected'),
                              'doctor': Box.read('docname')
                            })
                            .then((value) => print("appointment Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'Pay In Clinic',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                        if (_key.currentState!.validate()) {
                        Get.to(() => PaymentPage(
                            fees: Box.read('fees'),
                          ));
                        booking
                            .add({
                              'name': _quesController.text,
                              'mobile': _NumController.text,
                              'isPayed': true,
                              'dateSelected': Box.read('dateSelected'),
                              'timeSelected': Box.read('timeSelected'),
                              'doctor': Box.read('docname')
                            })
                            .then((value) => print("appointment Added"))
                            .catchError(
                                (error) => print("Failed to add user: $error"));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FontAwesomeIcons.paypal,
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'PayPal',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
