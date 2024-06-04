import 'package:flutter/material.dart';
import 'package:pharmgo/widgets/app_button_widget.dart';
import 'package:pharmgo/widgets/app_input_textfield_widget.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({Key? key}) : super(key: key);

  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
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
                'Delivery Details',
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
              AppInputTextfieldWidget(
                  controller: null,
                  title: "Address",
                  hitText: "Enter Your Address"),
              const SizedBox(
                height: 22,
              ),
              AppInputTextfieldWidget(
                  controller: null,
                  title: "Contact Info",
                  hitText: "Enter Your Contact Info"),
              const SizedBox(
                height: 44,
              ),
              AppButtonWidget(
                title: "Submit",
                titleColor: Colors.white,
                buttonBackgroundColor: Colors.cyan,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  Navigator.pushNamed(context, "/paymentPage");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
