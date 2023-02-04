import 'package:flutter/material.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';

class IncrementDecrementButtonWidget extends StatelessWidget {
  const IncrementDecrementButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '-',
              style: context.textStyles.textMedium.copyWith(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            '1',
            style: context.textStyles.textMedium.copyWith(
              fontSize: 18,
              color: context.colors.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '+',
              style: context.textStyles.textMedium.copyWith(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
