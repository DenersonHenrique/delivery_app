import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import 'register_state.dart';
import 'register_controller.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/widgets/app_bar_widget.dart';
import '../../core/ui/base_state/base_state.dart';
import '../../core/widgets/delivery_button_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEditingController = TextEditingController();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  @override
  void dispose() {
    _nameEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao registrar usuário');
          },
          success: () {
            hideLoader();
            showSuccess('Cadastro realizado.');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o  seu cadastro.',
                    style:
                        context.textStyles.textMedium.copyWith(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                    controller: _nameEditingController,
                    validator: Validatorless.required('Nome obrigatório'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    controller: _emailEditingController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    controller: _passwordEditingController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Senha obrigatória'),
                        Validatorless.min(6, 'Mínimo de 6 caracteres'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirmar senha',
                    ),
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Confirmar senha obrigatória'),
                        Validatorless.compare(
                          _passwordEditingController,
                          'As senhas inseridas são diferentes',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: DeliveryButtonWidget(
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                            _nameEditingController.text,
                            _emailEditingController.text,
                            _passwordEditingController.text,
                          );
                        }
                      },
                      label: 'CADASTRAR',
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
