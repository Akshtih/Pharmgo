import 'package:flutter/material.dart';
import 'package:pharmgo/widgets/app_button_widget.dart';
// ignore: depend_on_referenced_packages

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      // ignore: sized_box_for_whitespace
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("images/logo.png"),
          AppButtonWidget(
            title: "Login",
            titleColor: Colors.white,
            buttonBackgroundColor: Colors.cyan,
            buttonBorderColor: Colors.transparent,
            onPressed: () {
              Navigator.of(context).pushNamed("/loginScreen");
            },
          ),
          const SizedBox(
            height: 24,
          ),
          AppButtonWidget(
            onPressed: () {
              Navigator.of(context).pushNamed("/signupScreen");
            },
            title: "Sign Up",
            titleColor: Colors.black,
            buttonBackgroundColor: Colors.white,
            buttonBorderColor: Colors.black,
          ),
        ]),
      ),
    );
  }
}

/*

1. Image widget
2. Text 
3. text
4. Button
5.Button
6. text 

 */