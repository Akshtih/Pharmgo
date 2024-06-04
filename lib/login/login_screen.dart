import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmgo/widgets/app_button_widget.dart';
import 'package:pharmgo/widgets/app_input_textfield_password.dart';
import 'package:pharmgo/widgets/app_input_textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text, password: _passwordController.text);
      // pop loading circle
      if (context.mounted) Navigator.pop(context);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "/auth");
    } on FirebaseAuthException catch (e) {
      // pop loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      resizeToAvoidBottomInset: false,
      // ignore: sized_box_for_whitespace
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Login',
                style: TextStyle(fontSize: 34, color: Colors.cyan),
              ),
              AppInputTextfieldWidget(
                  controller: _emailcontroller,
                  title: "Email",
                  hitText: "username@gmail.com"),
              const SizedBox(
                height: 22,
              ),
              AppInputTextfieldPassword(
                  controller: _passwordController,
                  title: "Password",
                  hitText: "password"),
              const SizedBox(
                height: 22,
              ),
              AppButtonWidget(
                title: "Login",
                titleColor: Colors.white,
                buttonBackgroundColor: Colors.cyan,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  login();
                },
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.cyan),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/forgotPassword");
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
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
            ],
          ),
        ),
      ),
    );
  }

  void displayMessageToUser(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }
}
