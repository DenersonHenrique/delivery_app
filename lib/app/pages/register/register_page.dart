import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import 'register_state.dart';
import 'register_controller.dart';
import '../../core/constants/app_string.dart';
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
  bool _showPassword = false;
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
                    AppString.registerTitleText,
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    AppString.registerSubtitleText,
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: AppString.nameLabel,
                    ),
                    controller: _nameEditingController,
                    validator: Validatorless.required(
                      AppString.nameRequiredValidation,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: AppString.emailLabel,
                    ),
                    controller: _emailEditingController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(
                          AppString.emailRequiredValidation,
                        ),
                        Validatorless.email(
                          AppString.emailFormateValidation,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => TextFormField(
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        labelText: AppString.passwordLabel,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                        ),
                      ),
                      controller: _passwordEditingController,
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required(
                            AppString.passwordRequiredValidation,
                          ),
                          Validatorless.min(
                            6,
                            AppString.passwordLengthValidation,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => TextFormField(
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        labelText: AppString.confirmPasswordLabel,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                        ),
                      ),
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required(
                            AppString.confirmPasswordValidation,
                          ),
                          Validatorless.compare(
                            _passwordEditingController,
                            AppString.comparePasswordValidation,
                          ),
                        ],
                      ),
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
                      label: AppString.registerBtnLabel,
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
