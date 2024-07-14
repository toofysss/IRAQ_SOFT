import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData? iconData;
  final FocusNode? focusNode;
  final Function(String)? onTap;

  const CustomTextField({
    this.focusNode,
    required this.controller,
    required this.hint,
    this.iconData,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onTap,
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      maxLines: null,
      decoration: InputDecoration(
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        filled: true,
        label: Text(hint, style: Theme.of(context).textTheme.bodySmall),
        suffix: iconData == null ? const SizedBox() : Icon(iconData),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(width: .5, color: Theme.of(context).primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(width: .5, color: Theme.of(context).primaryColor)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }
}
