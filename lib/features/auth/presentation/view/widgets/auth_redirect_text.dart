import 'package:flutter/material.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_text_style.dart';
class AuthRedirectText extends StatelessWidget {
  const AuthRedirectText({
    super.key,
    required this.actionText,
    required this.onTap,
  });

  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
      AppStrings.alreadyHaveAnAccount,
      style: AppTextStyle.reg16Black,),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
    style: AppTextStyle.reg16Primary.copyWith(
    decoration: TextDecoration.underline,
    ),
          ),
        ),
      ],
    );
  }
}