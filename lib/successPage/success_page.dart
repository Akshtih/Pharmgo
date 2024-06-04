import 'package:flutter/material.dart';
import 'package:pharmgo/widgets/app_button_widget.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.asset(
          'images/Sucess.jpg',
        ),
        const SizedBox(
          height: 100,
        ),
        AppButtonWidget(
          title: "Back to Home",
          titleColor: Colors.white,
          buttonBackgroundColor: Colors.cyan,
          buttonBorderColor: Colors.transparent,
          onPressed: () {
            Navigator.pushNamed(context, "/homeScreen");
          },
        ),
      ],
    ));
  }
}
