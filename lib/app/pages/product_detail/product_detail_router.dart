import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_detail_page.dart';
import 'product_detail_controller.dart';

class ProductDetailRouter {
  ProductDetailRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailController(),
          ),
        ],
        builder: (context, child) {
          final arguments = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return ProductDetailPage(
            product: arguments['product'],
            order: arguments['order'],
          );
        },
      );
}
