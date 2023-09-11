import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<_AuthOptions?> _selectedAuthOption =
      ValueNotifier<_AuthOptions?>(null);

  @override
  void dispose() {
    _selectedAuthOption.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Simple Auth'),
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isAuthenticated = state.isAuthenticated;

            return ListView(
              padding: const EdgeInsets.all(8),
              children: [
                if (!isAuthenticated) ...[
                  ValueListenableBuilder<_AuthOptions?>(
                    valueListenable: _selectedAuthOption,
                    builder: (context, value, child) {
                      Widget widget;
                      switch (value) {
                        case _AuthOptions.otpLogin:
                          widget = const _OtpLogin();
                          break;
                        case _AuthOptions.passwordLogin:
                          widget = _EmailPasswordInputs(
                            actionButtonBuilder: (context, form) {
                              return LinearProgressBuilder(
                                action: (_) async {
                                  final email = form.control('email').value;
                                  final password =
                                      form.control('password').value;

                                  if (email != null && password != null) {
                                    await _signupOrLogin(
                                      context: context,
                                      email: email,
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
                          );
                        case _AuthOptions.register:
                          widget = _EmailPasswordInputs(
                            actionButtonBuilder: (context, form) {
                              return LinearProgressBuilder(
                                action: (_) async {
                                  final email = form.control('email').value;
                                  final password =
                                      form.control('password').value;

                                  if (email != null && password != null) {
                                    await _signupOrLogin(
                                      context: context,
                                      email: email,
                                      password: password,
                                      isSigningUp: true,
                                    );
                                  }
                                },
                                builder: (context, action, error) {
                                  return ElevatedButton(
                                    onPressed: action,
                                    child: const Text('Register'),
                                  );
                                },
                              );
                            },
                          );
                        default:
                          widget = _AuthOptionList(
                            onSelected: (selectedAuthOption) =>
                                _selectedAuthOption.value = selectedAuthOption,
                          );
                      }

                      return Column(
                        children: [
                          if (value != null)
                            TextButton(
                              onPressed: () {
                                _selectedAuthOption.value = null;
                              },
                              child: const Text('Reset Login Options'),
                            ),
                          const SizedBox(
                            height: 8,
                          ),
                          widget,
                        ],
                      );
                    },
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
                ],
              ],
            );
          },
        ),
      );

  Future<void> _signupOrLogin({
    required BuildContext context,
    required bool isSigningUp,
    required String email,
    required String password,
  }) async {
    final authCubit = context.read<AuthCubit>();
    if (isSigningUp) {
      await authCubit.registerOrInviteUser(
        userIdentityRequest: UserIdentityRequest(
          email: email,
          password: password,
        ),
      );
    }

    await authCubit.obtainTokenAndLogin(
      tokenObtainRequest: TokenObtainRequest(
        email: email,
        password: password,
      ),
    );
  }
}

class _AuthOptionList extends StatelessWidget {
  const _AuthOptionList({required this.onSelected});
  final Function(_AuthOptions selectedAuthOption) onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            onSelected(_AuthOptions.otpLogin);
          },
          child: const Text('OTP Login'),
        ),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(
          onPressed: () {
            onSelected(_AuthOptions.passwordLogin);
          },
          child: const Text('Password Login'),
        ),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(
          onPressed: () {
            onSelected(_AuthOptions.register);
          },
          child: const Text('Register'),
        ),
      ],
    );
  }
}

class _EmailPasswordInputs extends StatelessWidget {
  const _EmailPasswordInputs({
    required this.actionButtonBuilder,
  });

  final Widget Function(BuildContext context, FormGroup form)
      actionButtonBuilder;

  FormGroup get _form => FormGroup({
        'email': FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
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
                formControlName: 'email',
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validationMessages: {
                  ValidationMessage.required: (_) => 'Email must not be empty',
                  ValidationMessage.email: (_) =>
                      'Must be a valid email address',
                }),
            const SizedBox(
              height: 8,
            ),
            ReactiveTextField(
              formControlName: 'password',
              keyboardType: TextInputType.number,
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

class _OtpLogin extends StatefulWidget {
  const _OtpLogin();

  @override
  State<_OtpLogin> createState() => _OtpLoginState();
}

class _OtpLoginState extends State<_OtpLogin> {
  FormGroup get _form => FormGroup({
        'email': FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        'otp': FormControl<String?>(),
      });

  final ValueNotifier<bool> _hasRequestedOtp = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _hasRequestedOtp.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: () => _form,
        builder: (context, form, child) {
          return Column(
            children: [
              ReactiveTextField(
                  formControlName: 'email',
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validationMessages: {
                    ValidationMessage.required: (_) =>
                        'Email must not be empty',
                    ValidationMessage.email: (_) =>
                        'Must be a valid email address',
                  }),
              const SizedBox(
                height: 8,
              ),
              ValueListenableBuilder(
                valueListenable: _hasRequestedOtp,
                builder: (context, value, child) => value == true
                    ? ReactiveTextField(
                        formControlName: 'otp',
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'OTP',
                        ),
                      )
                    : const SizedBox(),
              ),
              const SizedBox(
                height: 8,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _hasRequestedOtp,
                builder: (context, value, child) => value == true
                    ? LinearProgressBuilder(
                        action: (_) async {
                          final email = form.control('email').value;
                          final otp = form.control('otp').value;

                          final authCubit = context.read<AuthCubit>();
                          if (email != null && otp != null) {
                            await authCubit.obtainTokenAndLogin(
                              tokenObtainRequest: TokenObtainRequest(
                                email: email,
                                otp: otp,
                              ),
                            );
                          }
                        },
                        builder: (context, action, error) => ElevatedButton(
                          onPressed: action,
                          child: const Text('Login'),
                        ),
                      )
                    : LinearProgressBuilder(
                        action: (_) async {
                          if (form.valid) {
                            final email = form.control('email').value;
                            if (email != null) {
                              await context.read<AuthCubit>().requestOTP(
                                    otpObtainRequest:
                                        OTPObtainRequest(email: email),
                                  );
                              _hasRequestedOtp.value = true;
                            }
                          } else {
                            form.markAllAsTouched();
                          }
                        },
                        builder: (context, action, error) => ElevatedButton(
                          onPressed: action,
                          child: const Text('Request OTP'),
                        ),
                      ),
              ),
            ],
          );
        });
  }
}

enum _AuthOptions {
  register,
  otpLogin,
  passwordLogin,
}
