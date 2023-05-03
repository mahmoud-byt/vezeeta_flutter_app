import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vezeeta_app/view/pages/Authentication/userData.dart';

class EnterYourMail extends StatefulWidget {
  const EnterYourMail({super.key});

  @override
  State<EnterYourMail> createState() => _EnterYourMailState();
}

class _EnterYourMailState extends State<EnterYourMail> {
  @override
  void initState() {
    super.initState();
    _disabledButton = true;
  }

  final _myKey = GlobalKey<FormState>();
  late bool _disabledButton;
  void checkValidation() {
    if (_myKey.currentState!.validate()) {
      setState(() {
        _disabledButton = false;
      });
    } else {
      setState(() {
        _disabledButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Your Email',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                  key: _myKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (v) => checkValidation(),
                        validator: (String? value) {
                          RegExp re = RegExp(r"\w+\@\w+\.\w+");
                          if (value == null) {
                            return '';
                          } else if (!re.hasMatch(value)) {
                            return '';
                          }
                          return null;
                        },
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(fontSize: 14),
                            label: const Text('Email *'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            errorStyle: const TextStyle(color: Colors.blue)),
                      ),
                      GestureDetector(
                        onTap: !_disabledButton
                            ? () => Get.to(() => UserDataPage())
                            : null,
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _disabledButton
                                  ? Colors.grey
                                  : Colors.blue[600]),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
