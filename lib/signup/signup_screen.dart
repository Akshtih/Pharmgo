// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmgo/widgets/app_button_widget.dart';
import 'package:pharmgo/widgets/app_input_textfield_password.dart';
import 'package:pharmgo/widgets/app_input_textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  //method to create account
  void createAccount() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // make sure passwords match
    if (_passwordController.text != _confirmpasswordController.text) {
      // pop loading circle
      Navigator.pop(context);
      // show error message to user
      displayMessageToUser("Passwords don't match", context);
    }
    // try creating the user
    else {
      try {
        //create user
        // ignore: unused_local_variable
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailcontroller.text,
                password: _passwordController.text);

        // pop loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // pop loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // display error message to user
        displayMessageToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text("Sign up"),
      //   elevation: 0,
      //   surfaceTintColor: Colors.black87,
      // ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/logo.png"),
                const SizedBox(
                  height: 0,
                ),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.cyan),
                ),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  "Create an account",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.cyan),
                ),
                const Text("Create your account to fully experience the app",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: Colors.cyan)),
                const SizedBox(
                  height: 22,
                ),
                AppInputTextfieldWidget(
                    controller: _namecontroller,
                    title: "Name",
                    hitText: "User name"),
                const SizedBox(
                  height: 22,
                ),
                AppInputTextfieldWidget(
                    controller: _emailcontroller,
                    title: "Email Address",
                    hitText: "username@gmail.com"),
                const SizedBox(
                  height: 22,
                ),
                AppInputTextfieldPassword(
                    controller: _passwordController,
                    title: "Password",
                    hitText: "enter password"),
                const SizedBox(
                  height: 22,
                ),
                AppInputTextfieldPassword(
                    controller: _confirmpasswordController,
                    title: "Confirm Password",
                    hitText: "confirm password"),
                const SizedBox(
                  height: 22,
                ),
                AppButtonWidget(
                  onPressed: () {
                    createAccount();
                  }, //
                  title: "Create Account",
                  titleColor: Colors.white,
                  buttonBackgroundColor: Colors.cyan,
                  buttonBorderColor: Colors.transparent,
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButtonWidget(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/loginScreen");
                  },
                  title: "Login",
                  titleColor: Colors.black,
                  buttonBackgroundColor: Colors.white,
                  buttonBorderColor: Colors.black,
                ),
                const SizedBox(height: 20)
              ],
            ),
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
