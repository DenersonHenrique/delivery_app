import 'package:flutter/material.dart';

import 'core/di/provider.dart';
import 'pages/home/home_router.dart';
import 'pages/auth/login_router.dart';
import 'pages/splash/splash_page.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/register/resgiter_router.dart';
import 'pages/product_detail/product_detail_router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      child: MaterialApp(
        title: 'Delivery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/login': (context) => LoginRouter.page,
          '/register': (context) => RegisterRouter.page,
          '/product-detail': (context) => ProductDetailRouter.page,
        },
      ),
    );
  }
}
