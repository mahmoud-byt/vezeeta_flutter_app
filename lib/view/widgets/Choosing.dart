import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class Chooose extends StatelessWidget {
  Chooose(
      {super.key,
      required this.text1,
      required this.text2,
      required this.ontap});
  String text1;
  String text2;
  Function(String value) ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: CustomRadioButton(
        width: MediaQuery.of(context).size.width / 2.5,
        enableShape: true,
        padding: 10,
        // defaultSelected: text1,
        elevation: 0,
        unSelectedColor: Colors.black12,
        buttonLables: [
          text1,
          text2,
        ],
        buttonValues: [
          text1,
          text2,
        ],
        absoluteZeroSpacing: false,
        margin: EdgeInsets.only(right: 10),
        selectedBorderColor: Colors.blue,
        buttonTextStyle: const ButtonTextStyle(
            selectedColor: Colors.blue,
            unSelectedColor: Colors.grey,
            textStyle: TextStyle(fontSize: 13)),
        radioButtonValue: (val) {
          ontap(val);
        },
        selectedColor: Colors.black12,
      ),
    );
  }
}
