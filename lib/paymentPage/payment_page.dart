import 'package:flutter/material.dart';
import 'package:pharmgo/widgets/app_button_widget.dart';
import 'package:pharmgo/widgets/app_input_textfield_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Payment Page',
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
                height: 50,
              ),
              Image.asset(
                "images/payment.png",
                height: 400,
                width: 500,
              ),
              const SizedBox(
                height: 22,
              ),
              AppInputTextfieldWidget(
                  controller: null,
                  title: "Transaction ID",
                  hitText: "Enter Your Transaction ID"),
              const SizedBox(
                height: 44,
              ),
              AppButtonWidget(
                title: "Confirm Payment",
                titleColor: Colors.white,
                buttonBackgroundColor: Colors.cyan,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  Navigator.pushNamed(context, "/success");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
