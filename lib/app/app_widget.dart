import 'package:flutter/material.dart';

import 'core/di/provider.dart';
import 'pages/auth/login_page.dart';
import 'pages/home/home_router.dart';
import 'pages/splash/splash_page.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/product_detail/product_detail_router.dart';
import 'pages/register/register_page.dart';

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
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/product-detail': (context) => ProductDetailRouter.page,
        },
      ),
    );
  }
}
