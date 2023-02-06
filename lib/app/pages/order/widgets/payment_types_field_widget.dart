import 'package:flutter/material.dart';

import '../../../core/ui/styles/text_styles.dart';

class PaymentTypesFieldWidget extends StatelessWidget {
  const PaymentTypesFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forma de pagamento',
            style: context.textStyles.textRegular.copyWith(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
