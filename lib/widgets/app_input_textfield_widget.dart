// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppInputTextfieldWidget extends StatelessWidget {
  AppInputTextfieldWidget(
      {Key? key,
      required this.controller,
      required this.title,
      required this.hitText})
      : super(key: key);
  TextEditingController? controller;
  final String title;
  final String hitText;
/*
title
hinttext
controller
 */

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          controller: controller,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.cyan)),
              hintStyle: const TextStyle(color: Colors.white),
              hintText: hitText,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        ),
      ],
    );
  }
}
