import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  IconData? icon;
  bool isNumber = false;
  bool? isEmail = false;
  VoidCallback? onPressed;
  final void Function(String)? onChanged;
  final String? Function(String? value)? validation;
  CustomTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.icon,
      required this.isNumber,
      this.isEmail,
      this.onPressed,
      this.validation,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: controller,
                  onChanged: onChanged,
                validator: validation ??
                    (value) {
                      if (value == null || value.isEmpty) {
                        return "Textfield tidak boleh kosong";
                      } else if (isEmail == true) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (emailValid == false) {
                          return "Format Email tidak valid";
                        }
                      } else if (isNumber == true) {
                        String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                        RegExp regExp = RegExp(patttern);
                        if (value.isEmpty) {
                          return 'Textfield tidak boleh kosong';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Nomor telepon tidak valid';
                        }
                      }
                      return null;
                    },
                decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
            ),
          ],
        ));
  }
}
