import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({Key? key, this.Lone, this.Htwo, this.isObscure = false, this.onChanged}) : super(key: key);

  final String? Lone;
  final String? Htwo;
  final bool isObscure;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: isObscure,
      decoration: InputDecoration(
          labelText: Lone,
          hintText: Htwo,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 5,
                color: Colors.black87,
                style: BorderStyle.solid,
              ))),
      autofocus: true,
      keyboardType: TextInputType.multiline,
    );
  }
}
