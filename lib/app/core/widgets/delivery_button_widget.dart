import 'package:flutter/material.dart';

class DeliveryButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double? height;

  const DeliveryButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
        ),
      ),
    );
  }
}
