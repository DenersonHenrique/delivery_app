import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';
import 'home_controller.dart';
import 'widgets/product_tile.dart';
import '../../models/product_model.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      product: ProductModel(
                        id: 0,
                        name: 'X-Salada',
                        description:
                            'Lanche acompanha pão, hambúguer, mussarela, alface, tomate e maionese',
                        price: 10.0,
                        image:
                            'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800',
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
