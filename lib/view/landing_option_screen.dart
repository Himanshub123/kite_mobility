import 'package:flutter/material.dart';
import 'package:kite_mobility/util/color_palette.dart';
import 'package:kite_mobility/view/sign_in_page.dart';

class LandingOptionScreen extends StatelessWidget {
  const LandingOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/splash_back.png'), // Your image path
            fit: BoxFit.cover,
          ),
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Login or Sign Up',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'It\'s time to get \nyou moving ',
                    style: TextStyle(
                        fontSize: 28,
                        height: 1.1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      backgroundColor: ColorPalette.primaryColor,
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New user ',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Sign Up?',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
