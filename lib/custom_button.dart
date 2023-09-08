import 'package:flutter/material.dart';
import 'package:task_one/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      onTap: onTap,
      child: Ink(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Center(
            child: Text(
          'Open GitHub',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
