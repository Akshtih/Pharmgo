import 'package:flutter/material.dart';
import 'package:pharmgo/widgets/app_button_widget.dart';
import 'package:pharmgo/widgets/app_input_textfield_widget.dart';

class Labtests extends StatefulWidget {
  const Labtests({Key? key}) : super(key: key);

  @override
  _LabtestsState createState() => _LabtestsState();
}

class _LabtestsState extends State<Labtests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black87,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "images/test.png",
                  height: 400,
                  width: 500,
                ),
                const SizedBox(
                  height: 22,
                ),
                AppInputTextfieldWidget(
                    controller: null,
                    title: "Select Test",
                    hitText: "Select Your Test"),
                const SizedBox(
                  height: 44,
                ),
                AppButtonWidget(
                  title: "Confirm Address for Lab Test",
                  titleColor: Colors.white,
                  buttonBackgroundColor: Colors.cyan,
                  buttonBorderColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pushNamed(context, "/deliveryDetails");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
