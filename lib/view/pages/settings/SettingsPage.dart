import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vezeeta_app/controller/locale_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  LangController _langController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Settings')),
      body: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Container(
                    height: 170,
                    color: Colors.black38,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(Icons.close)),
                            Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text("Language")),
                            )
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              _langController.changeLang('en');
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: const Text(
                                'English',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              _langController.changeLang('ar');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: const Text('عربى',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            )),
                      ],
                    ),
                  );
                });
          },
          child: Column(
            children: [
              ListTile(
                  leading: Icon(
                    Icons.language_outlined,
                    color: Colors.blue[600],
                  ),
                  title: const Text('App language'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded)),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 1,
                color: Colors.grey,
              )
            ],
          )),
    );
  }
}
