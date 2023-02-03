import 'package:delivery_app/app/pages/home/home_router.dart';
import 'package:flutter/material.dart';

import 'core/di/provider.dart';
import 'pages/splash/splash.dart';
import 'core/ui/theme/theme_config.dart';

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
        },
      ),
    );
  }
}
