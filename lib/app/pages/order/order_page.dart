import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../models/product_model.dart';
import 'widgets/order_field_widget.dart';
import '../../dto/order_product_dto.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/widgets/app_bar_widget.dart';
import 'widgets/order_product_tile_widget.dart';
import 'widgets/payment_types_field_widget.dart';
import '../../core/widgets/delivery_button_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  Text(
                    'Carrinho',
                    style: context.textStyles.textTitle,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/trashRegular.png'),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 4,
              (context, index) {
                return Column(
                  children: [
                    OrderProductTileWidget(
                      index: index,
                      orderProduct: OrderProductDto(
                        product: ProductModel.fromMap({}),
                        amount: 10,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do pedido',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16.0),
                      ),
                      Text(
                        r'R$ 200,00',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                OrderFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Digite um endereço',
                  validator: Validatorless.required('m'),
                  title: 'Endereço de entrega',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                OrderFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Digite o CPF',
                  validator: Validatorless.required('m'),
                  title: 'CPF',
                ),
                const PaymentTypesFieldWidget(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DeliveryButtonWidget(
                    width: double.infinity,
                    height: 48,
                    onPressed: () {},
                    label: 'FINALIZAR',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
