import 'package:delivery_app/app/core/config/client/custom_dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatelessWidget {
  final Widget child;

  const ProviderWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
      ],
      child: child,
    );
  }
}
