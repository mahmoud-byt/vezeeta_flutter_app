import 'package:flutter/material.dart';

class SearchingInput extends StatelessWidget {
  SearchingInput({super.key,required this.headLine,required this.placeholder});
  String headLine;
  String placeholder;
  @override
  Widget build(BuildContext context) {
    return Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black26),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        headLine,
                        
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintStyle: const TextStyle(fontSize: 14),
                            hintText:
                                placeholder,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.black12))),
                      )
                    ]),
              );
  }
}