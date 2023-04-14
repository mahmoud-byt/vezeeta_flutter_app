import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vezeeta_app/controller/services/loginServices.dart';
import 'package:vezeeta_app/view/pages/Authentication/logIn.dart';
import 'package:vezeeta_app/view/pages/settings/SettingsPage.dart';
import 'package:vezeeta_app/view/widgets/profileButtons.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  List<String> texts = [
    'My Account',
    'My Questions',
    'Favourites',
    'Settings',
    'Logout'
  ];

  List<IconData> icons = [
    Icons.person_3_outlined,
    Icons.question_mark_outlined,
    Icons.favorite_outline,
    Icons.settings,
    Icons.logout
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                );
              },
              shrinkWrap: true,
              itemBuilder: (_, i) {
                return ProfileButton(
                    onTap: () {
                      switch (i) {
                        case 3:
                          Get.to(() => SettingsPage());
                          break;
                        case 4:
                          FirebaseService().logOut();
                          Get.to(() => Login());
                          break;
                      }
                    },
                    icon: icons[i],
                    text: texts[i]);
              },
              itemCount: texts.length,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.facebook_sharp,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Terms of Use",
                            style: TextStyle(color: Colors.grey),
                          )),
                      const Text('.'),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Privacy Policy",
                            style: TextStyle(color: Colors.grey),
                          )),
                    ],
                  ),
                  const Text(
                    '11.14.1',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
