import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/config/env/env.dart';
import '../../core/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButtonWidget(
            width: 200,
            height: 200,
            label: Env.instance['backend_base_url'] ?? '',
            onPressed: () {},
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'teste'),
          ),
        ],
      ),
    );
  }
}
