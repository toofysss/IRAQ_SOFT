import 'package:flutter/material.dart';

class ButtonDesign extends StatelessWidget {
  final Function()? onTap;
  final String title;
  const ButtonDesign({required this.onTap, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: const ButtonStyle(
          padding: WidgetStatePropertyAll(
        EdgeInsets.all(15),
      )),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

// ############## Notes ##################
class ButtonIconDesign extends StatelessWidget {
  final Function()? onTap;
  final IconData iconData;
  const ButtonIconDesign(
      {required this.iconData, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Icon(
          iconData,
          size: MediaQuery.of(context).size.width / 20,
          color: Theme.of(context).iconTheme.color,
        ));
  }
}
