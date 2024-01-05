import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kite_mobility/util/color_palette.dart';
import 'package:kite_mobility/view_model/sign_in_viewmodel.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final signInViewModel = Get.put(SignInViewModel());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.delete<SignInViewModel>;
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icons/ic_back.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Let\'s get you started ',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Your next trip awaits ',
                    style: TextStyle(
                        fontSize: 16,
                        height: 1.1,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'EMAIL ADDRESS ',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                TextFormField(
                  controller: signInViewModel.email.value,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email id';
                    } else if (!value.isEmail) {
                      return 'Please enter valid email id';
                    }
                    return null;
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 28),
                  child: const Text(
                    'PASSWORD ',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    controller: signInViewModel.password.value,
                    obscureText: true,
                    decoration:
                        const InputDecoration(border: UnderlineInputBorder()),
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 28),
                  child: const Text(
                    'Forgot Password? ',
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorPalette.primaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signInViewModel.signIn();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        backgroundColor: Colors.black,
                        // Set button color here
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
