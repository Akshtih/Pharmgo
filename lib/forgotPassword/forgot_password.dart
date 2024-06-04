import 'package:flutter/material.dart';
import 'package:pharmgo/widgets/app_button_widget.dart';
import 'package:pharmgo/widgets/app_input_textfield_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Reset Your Password',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              AppInputTextfieldPassword(
                  controller: _passwordController1,
                  title: "New Password",
                  hitText: "Enter New Password"),
              const SizedBox(
                height: 22,
              ),
              AppInputTextfieldPassword(
                  controller: _passwordController2,
                  title: "Confirm New Password",
                  hitText: "Enter New Password"),
              const SizedBox(
                height: 44,
              ),
              AppButtonWidget(
                title: "Reset Password",
                titleColor: Colors.white,
                buttonBackgroundColor: Colors.cyan,
                buttonBorderColor: Colors.transparent,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
