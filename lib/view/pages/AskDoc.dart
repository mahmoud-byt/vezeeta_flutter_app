import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vezeeta_app/view/pages/searching/specialities.dart';

import '../widgets/Choosing.dart';

class AskDoctor extends StatefulWidget {
  const AskDoctor({super.key});

  @override
  State<AskDoctor> createState() => _AskDoctorState();
}

class _AskDoctorState extends State<AskDoctor> {
  @override
  void initState() {
    super.initState();
    box.write('prev', 'ask');
  }

  CollectionReference questions =
      FirebaseFirestore.instance.collection('Questions');
  GlobalKey<FormState> _MyKey = GlobalKey();
  TextEditingController _quesController = TextEditingController();
  TextEditingController _quesDescController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  var box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            box.write('prev', null);
            Get.back();
          },
        ),
        title: const Text('Ask a doctor'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _MyKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(Specialities());
                  },
                  child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Choose speciality'),
                          Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  controller: _quesController,
                  minLines: 1,
                  maxLength: 50,
                  decoration: InputDecoration(
                      hintText: "Your question *",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  controller: _quesDescController,
                  minLines: 5,
                  maxLines: 8,
                  maxLength: 250,
                  decoration: InputDecoration(
                      hintText: "Question description *",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'The question is for',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Chooose(
                  text1: "For you",
                  text2: "for another person",
                  ontap: (val) {
                    box.write('person', val);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Gender',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Chooose(
                  text1: "Male",
                  text2: "Female",
                  ontap: (val2) {
                    box.write('Gender', val2);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'How old are you ?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Required';
                    }
                    return null;
                  },
                  minLines: 1,
                  controller: _ageController,
                  decoration: InputDecoration(
                      hintText: "Your age *",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Map<String, dynamic> question = {
                      'title': _quesController.text,
                      'description': _quesDescController.text,
                      'age': int.parse(_ageController.text),
                      'Speciality': box.read('speciality'),
                      'person': box.read('person'),
                      "Gender": box.read('Gender')
                    };
                    if (_MyKey.currentState!.validate()) {
                      questions
                          .add(question)
                          .then((value) => print("User Added"))
                          .catchError(
                              (error) => print("Failed to add user: $error"));
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(7)),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
