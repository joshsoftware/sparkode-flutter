import 'package:flutter/material.dart';

import '../../utility/constants/colors.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {Key? key,
      required this.title,
      this.isObscured = false,
      required this.onChanged})
      : super(key: key);
  final Function(String) onChanged;
  final String title;
  final bool isObscured;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: AppColors.white, fontWeight: FontWeight.w800),
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.gray24,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.comet)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.comet)),
          hintText: title,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: AppColors.comet, fontWeight: FontWeight.w700)),
      obscureText: isObscured,
      onChanged: onChanged,
    );
  }
}
