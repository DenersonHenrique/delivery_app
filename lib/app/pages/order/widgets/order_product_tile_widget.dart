import 'package:flutter/material.dart';

import '../../../dto/order_product_dto.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/widgets/increment_decrement_button_widget.dart';

class OrderProductTileWidget extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTileWidget({
    super.key,
    required this.index,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image.network(
            'https://burgerx.com.br/assets/img/galeria/burgers/x-burger.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'X-Burguer',
                    style: context.textStyles.textRegular.copyWith(
                      fontSize: 16.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '19,90',
                        style: context.textStyles.textMedium.copyWith(
                          fontSize: 14.0,
                          color: context.colors.secondary,
                        ),
                      ),
                      IncrementDecrementButtonWidget.compact(
                        amount: 2,
                        incrementTap: () {},
                        decrementTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
