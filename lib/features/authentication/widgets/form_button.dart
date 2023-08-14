import 'package:douyin_clone/constants/sizes.dart';
import 'package:douyin_clone/utils.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: disabled
                ? isDarkMode(context)
                    ? Colors.grey.shade800
                    : Colors.grey.shade300
                : Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
          duration: const Duration(milliseconds: 300),
          child: Text(
            'Next',
            style: TextStyle(
              color: disabled ? Colors.grey.shade400 : Colors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
