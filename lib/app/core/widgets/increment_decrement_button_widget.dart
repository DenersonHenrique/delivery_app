import 'package:flutter/material.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';

class IncrementDecrementButtonWidget extends StatelessWidget {
  final bool _compact;
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  const IncrementDecrementButtonWidget({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = false;

  const IncrementDecrementButtonWidget.compact({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: decrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '-',
                style: context.textStyles.textMedium.copyWith(
                  fontSize: _compact ? 15 : 22,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: context.textStyles.textMedium.copyWith(
              fontSize: _compact ? 16 : 18,
              color: context.colors.secondary,
            ),
          ),
          InkWell(
            onTap: incrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '+',
                style: context.textStyles.textMedium.copyWith(
                  fontSize: _compact ? 15 : 22,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
