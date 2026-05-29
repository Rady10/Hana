import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  const CustomButton({super.key, this.text, this.backgroundColor, this.textColor, this.onPressed, this.padding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: WidgetStateProperty.resolveWith(
                (state) => state.contains(WidgetState.disabled) ? backgroundColor?.withOpacity(0.5) : backgroundColor,
              ),
              foregroundColor: WidgetStateProperty.resolveWith(
                (state) => state.contains(WidgetState.disabled) ? textColor?.withOpacity(0.5) : textColor,
              ),
              padding: WidgetStatePropertyAll(padding),  
          ),
          child: Text(text ?? '')
      ),
    );
  }
}