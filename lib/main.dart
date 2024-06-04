import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmgo/auth/auth.dart';
import 'package:pharmgo/deliveryDetails/delivery_details.dart';
import 'package:pharmgo/firebase_options.dart';
import 'package:pharmgo/forgotPassword/forgot_password.dart';
import 'package:pharmgo/home/home_screen.dart';
import 'package:pharmgo/login/login_screen.dart';
import 'package:pharmgo/models/cart.dart';
import 'package:pharmgo/pages/cart_page.dart';
import 'package:pharmgo/paymentPage/payment_page.dart';
import 'package:pharmgo/profilePage/profile_page.dart';
import 'package:pharmgo/signup/signup_screen.dart';
import 'package:pharmgo/splash%20screen/splash_screen.dart';
import 'package:pharmgo/successPage/success_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
          theme: ThemeData.dark().copyWith(
            bottomNavigationBarTheme:
                BottomNavigationBarTheme.of(context).copyWith(
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.black,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          routes: {
            "/loginScreen": (context) => const LoginScreen(),
            "/signupScreen": (context) => const SignupScreen(),
            "/forgotPassword": (context) => const ForgotPassword(),
            "/homeScreen": (context) => const HomeScreen(),
            "/auth": (context) => const Auth(),
            "/deliveryDetails": (context) => const DeliveryDetails(),
            "/paymentPage": (context) => const PaymentPage(),
            "/success": (context) => const SuccessPage(),
            "/cart": (context) => const CartPage(),
            "/profile": (context) => const ProfilePage(),
          }),
    );
  }
}
