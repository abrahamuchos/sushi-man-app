import 'package:flutter/material.dart';
import 'package:sushi_man/themes/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool opacity;

  const MyButton(
      {super.key,
      required this.text,
      required this.onTap, this.opacity = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: opacity ? MyColors.secondary : MyColors.primary,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
