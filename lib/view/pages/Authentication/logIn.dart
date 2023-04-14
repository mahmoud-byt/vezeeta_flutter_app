import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vezeeta_app/view/pages/Authentication/EnterYorMail.dart';
import 'package:vezeeta_app/view/pages/homePage.dart';
import '../../../controller/services/loginServices.dart';
import '../../widgets/loginButton.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://png.pngtree.com/background/20210714/original/pngtree-vector-design-background-medical-instruments-for-vaccine-picture-image_1204718.jpg'))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                  minHeight: 200, maxHeight: double.infinity),
              child: Container(
                height: 400,
                margin: const EdgeInsets.only(top: 50),
                color: Colors.black87,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'create an account',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'continue with',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      cursorColor: Colors.grey,
                      controller: _phoneNumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(fontSize: 14),
                        hintText: "Phone number*",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.grey)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      // onTap: () async {
                      //   await FirebaseAuth.instance.verifyPhoneNumber(
                      //     phoneNumber: '+201280048455',
                      //     verificationCompleted:
                      //         (PhoneAuthCredential credential) async {},
                      //     verificationFailed: (FirebaseAuthException e) {
                      //       print(e.code);
                      //     },
                      //     codeSent: (String verificationId,
                      //         int? resendToken) async {
                      //       Get.to(
                      //           () => numberVerification(verificationId));
                      //     },
                      //     codeAutoRetrievalTimeout:
                      //         (String verificationId) {},
                      //   );
                      // },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue[600]),
                        child: const Text(
                          'continue with phone number',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 1,
                          color: Colors.grey,
                        ),
                        Text('or'),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 1,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    LoginButton(
                      onTap: () async {
                        try {
                          await FirebaseService().signInWithFacebook();
                        } catch (e) {
                          print(e);
                        }
                        if (FirebaseAuth.instance.currentUser != null) {
                          Get.to(HomePage());
                        }
                      },
                      icon: FontAwesomeIcons.facebook,
                      iconColor: Colors.blue,
                      text: 'Facebook',
                    ),
                    LoginButton(
                      onTap: () async {
                        try {
                          await FirebaseService().signInWithGoogle();
                        } catch (e) {
                          print(e);
                        }
                        if (FirebaseAuth.instance.currentUser != null) {
                          Get.to(HomePage());
                        }
                      },
                      iconColor: Colors.red,
                      icon: FontAwesomeIcons.google,
                      text: 'Google',
                    ),
                    LoginButton(
                      iconColor: Colors.white,
                      icon: FontAwesomeIcons.envelope,
                      text: 'Email',
                      onTap: (){
                        Get.to(()=>EnterYourMail());
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
