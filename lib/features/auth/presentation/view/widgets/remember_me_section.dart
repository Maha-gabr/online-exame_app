import 'package:flutter/material.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_text_style.dart';
class RememberMeSection extends StatelessWidget {
  const RememberMeSection({
    super.key,
    required this.rememberMe,
    required this.onRememberMeChanged,
    required this.onForgotPassword,
  });

  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;
  final VoidCallback onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) {
            if (value != null) {
              onRememberMeChanged(value);
            }
          },
        ),
        Text(
          AppStrings.rememberMe,
          style: AppTextStyle.reg14lightGrey.copyWith(
            color: AppColors.black,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onForgotPassword,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            AppStrings.forgotPassword,
            style: AppTextStyle.reg14lightGrey.copyWith(
              color: AppColors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}