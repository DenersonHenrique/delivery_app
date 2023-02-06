import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/client/custom_dio.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/auth/auth_repository_impl.dart';

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
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            dio: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
