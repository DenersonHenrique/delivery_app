import 'package:flutter/material.dart';

import '../../core/config/env/env.dart';
import '../../core/constants/app_string.dart';
import '../../core/constants/asset_images.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/widgets/delivery_button_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  AssetImages.snackSplash,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(0.30),
                  ),
                  Image.asset(AssetImages.logo),
                  const SizedBox(
                    height: 80,
                  ),
                  DeliveryButtonWidget(
                    onPressed: () => Navigator.of(context).popAndPushNamed(
                      '/home',
                    ),
                    label: AppString.accessBtnLabel,
                    width: context.percentWidth(0.60),
                    height: 35,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
