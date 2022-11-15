import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    this.width = 254,
    this.height = 56, required this.title, required this.onTap}) : super(key: key);

  final double width;
  final double height;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: Styles.primaryColor
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
