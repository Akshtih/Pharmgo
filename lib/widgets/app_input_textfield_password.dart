// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppInputTextfieldPassword extends StatefulWidget {
  AppInputTextfieldPassword(
      {Key? key,
      required this.controller,
      required this.title,
      required this.hitText})
      : super(key: key);
  TextEditingController? controller;
  final String title;
  final String hitText;

  @override
  State<AppInputTextfieldPassword> createState() =>
      _AppInputTextfieldPasswordState();
}

class _AppInputTextfieldPasswordState extends State<AppInputTextfieldPassword> {
  bool isVisibilityOff = true;
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
          widget.title,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: isVisibilityOff,
          controller: widget.controller,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.cyan)),
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isVisibilityOff = !(isVisibilityOff);
                  });
                },
                child: isVisibilityOff
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              hintText: widget.hitText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        ),
      ],
    );
  }
}
