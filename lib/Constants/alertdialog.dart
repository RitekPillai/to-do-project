import 'package:flutter/material.dart';
import 'package:practice/Constants/app_colors.dart';

class AlertdialogPage extends StatelessWidget {
  final TextEditingController Controller;
  Function()? onchanged;

  AlertdialogPage(
      {super.key, required this.Controller, required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: PrimaryColor.gray,
      content: TextField(
        controller: Controller,
        cursorColor: const Color(0xfff7b30e),
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff7b40e)),
          ),
          hintText: "eg:Working on a App",
          hintStyle: TextStyle(
            color: Color(0xff535353),
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: onchanged,
            child: Text(
              "Done",
              style: TextStyle(color: PrimaryColor.org, fontSize: 17),
            ))
      ],
    );
  }
}
