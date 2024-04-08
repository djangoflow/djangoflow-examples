import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../rooms_page/rooms_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Auth Simple'),
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isAuthenticated = state.isAuthenticated;

            return ListView(
              padding: const EdgeInsets.all(8),
              children: [
                if (!isAuthenticated) ...[
                  Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      _UsernamePasswordInputs(
                        actionButtonBuilder: (context, form) {
                          return LinearProgressBuilder(
                            action: (_) async {
                              final username = form.control('username').value;
                              final password = form.control('password').value;

                              if (username != null && password != null) {
                                await _signupOrLogin(
                                  context: context,
                                  username: username,
                                  password: password,
                                  isSigningUp: false,
                                );
                              }
                            },
                            builder: (context, action, error) {
                              return ElevatedButton(
                                onPressed: action,
                                child: const Text('Login'),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ] else ...[
                  const Text('Authenticated'),
                  const SizedBox(height: 8),
                  SelectableText('Token: ${state.token}'),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await context.read<AuthCubit>().logout();
                    },
                    child: const Text('Logout'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (_) => const RoomsPage(),
                        ),
                      );
                    },
                    child: const Text('Start'),
                  ),
                ],
              ],
            );
          },
        ),
      );

  Future<void> _signupOrLogin({
    required BuildContext context,
    required bool isSigningUp,
    required String username,
    required String password,
  }) async {
    final authCubit = context.read<AuthCubit>();
    if (isSigningUp) {
      await authCubit.registerOrInviteUser(
        userIdentityRequest: UserIdentityRequest(
          username: username,
          password: password,
        ),
      );
    }

    await authCubit.obtainTokenAndLogin(
      tokenObtainRequest: TokenObtainRequest(
        username: username,
        password: password,
      ),
    );
  }
}

class _UsernamePasswordInputs extends StatelessWidget {
  const _UsernamePasswordInputs({
    required this.actionButtonBuilder,
  });

  final Widget Function(BuildContext context, FormGroup form)
      actionButtonBuilder;

  FormGroup get _form => FormGroup({
        'username': FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        'password': FormControl<String?>(
          validators: [
            Validators.required,
          ],
        ),
      });

  @override
  Widget build(BuildContext context) => ReactiveFormBuilder(
      form: () => _form,
      builder: (context, form, child) {
        return Column(
          children: [
            ReactiveTextField(
                formControlName: 'username',
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validationMessages: {
                  ValidationMessage.required: (_) =>
                      'Username must not be empty',
                }),
            const SizedBox(
              height: 8,
            ),
            ReactiveTextField(
              formControlName: 'password',
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              validationMessages: {
                ValidationMessage.required: (_) => 'Password must not be empty',
              },
            ),
            actionButtonBuilder.call(context, form),
          ],
        );
      });
}
