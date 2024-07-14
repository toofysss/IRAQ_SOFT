import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  const CustomCardHome({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardTheme.color!,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 2,
            offset: const Offset(0, 0),
            color: Theme.of(context).cardTheme.shadowColor!,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
