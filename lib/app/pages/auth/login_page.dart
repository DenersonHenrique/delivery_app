import 'package:delivery_app/app/pages/auth/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import 'login_controller.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/widgets/app_bar_widget.dart';
import '../../core/ui/base_state/base_state.dart';
import '../../core/widgets/delivery_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            login: () => showLoader(),
            loginError: () {
              hideLoader();
              showError('Login ou senha inválidos.');
            },
            error: () {
              hideLoader();
              showError('Erro ao realizar login.');
            },
            success: () {
              hideLoader();
              showSuccess('Autenticação realizada com sucesso');
              Navigator.pop(context, true);
            });
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textStyles.textTitle,
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
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                        ),
                        controller: _passwordEditingController,
                        validator: Validatorless.required('Senha obrigatória'),
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
                              controller.signIn(
                                _emailEditingController.text,
                                _passwordEditingController.text,
                              );
                            }
                          },
                          label: 'ENTRAR',
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não possui uma conta',
                        style: context.textStyles.textBold,
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/register'),
                        child: Text(
                          'Cadastre-se',
                          style: context.textStyles.textBold.copyWith(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
