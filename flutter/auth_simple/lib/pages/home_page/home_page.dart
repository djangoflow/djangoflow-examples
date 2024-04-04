import 'dart:async';
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_auth_google/djangoflow_auth_google.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../core/routes/app_router.gr.dart';
import '../../core/routes/router.dart';

@RoutePage()
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

  Future<void> onNavigate() async {
    await router.replace(const DashboardRoute());
  }

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
                  ValueListenableBuilder<_AuthOptions?>(
                    valueListenable: _selectedAuthOption,
                    builder: (context, value, child) {
                      Widget widget;
                      switch (value) {
                        case _AuthOptions.otpLogin:
                          widget = const _OtpLogin();
                          break;
                        case _AuthOptions.passwordLogin:
                          widget = _UsernamePasswordInputs(
                            actionButtonBuilder: (context, form) {
                              return LinearProgressBuilder(
                                action: (_) async {
                                  final username =
                                      form.control('username').value;
                                  final password =
                                      form.control('password').value;

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
                          );
                        case _AuthOptions.register:
                          widget = _UsernamePasswordInputs(
                            actionButtonBuilder: (context, form) {
                              return LinearProgressBuilder(
                                action: (_) async {
                                  final username =
                                      form.control('username').value;
                                  final password =
                                      form.control('password').value;

                                  if (username != null && password != null) {
                                    await _signupOrLogin(
                                      context: context,
                                      username: username,
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
                  const SizedBox(
                    height: 8,
                  ),
                  const _SocialLoginButtons(),
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
                    onPressed: onNavigate,
                    child: const Text('Go dashboard'),
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

    // Navigate to dashboard
    onNavigate();
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
                },
              ),
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
                  ValidationMessage.required: (_) =>
                      'Password must not be empty',
                },
              ),
              actionButtonBuilder.call(context, form),
            ],
          );
        },
      );
}

class _OtpLogin extends StatefulWidget {
  const _OtpLogin();

  @override
  State<_OtpLogin> createState() => _OtpLoginState();
}

class _OtpLoginState extends State<_OtpLogin> {
  FormGroup get _form => FormGroup({
        'username': FormControl<String>(
          validators: [
            Validators.required,
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
              formControlName: 'username',
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              validationMessages: {
                ValidationMessage.required: (_) => 'Username must not be empty',
              },
            ),
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
                        final username = form.control('username').value;
                        final otp = form.control('otp').value;

                        final authCubit = context.read<AuthCubit>();
                        if (username != null && otp != null) {
                          await authCubit.obtainTokenAndLogin(
                            tokenObtainRequest: TokenObtainRequest(
                              username: username,
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
                          final username = form.control('username').value;
                          if (username != null) {
                            await context.read<AuthCubit>().requestOTP(
                                  otpObtainRequest:
                                      OTPObtainRequest(username: username),
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
      },
    );
  }
}

class _SocialLoginButtons extends StatelessWidget {
  const _SocialLoginButtons();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (kIsWeb)
            GoogleSignInWebButton(
              configurationWrapper: GSIButtonConfigWrapper(
                type: GSIWrapperButtonType.standard,
                size: GSIWrapperButtonSize.large,
                shape: GSIWrapperButtonShape.pill,
                theme: Theme.of(context).brightness == Brightness.light
                    ? GSIWrapperButtonTheme.filledBlue
                    : GSIWrapperButtonTheme.filledBlack,
                text: GSIWrapperButtonText.continueWith,
                minimumWidth: 400,
              ),
              onSignIn: (googleSignInAccount) async {
                final authCubit = context.read<AuthCubit>();
                final gAuth = await googleSignInAccount?.authentication;

                if (gAuth != null && gAuth.accessToken != null) {
                  await authCubit.loginWithSocialProvider(
                    socialTokenObtainRequest: SocialTokenObtainRequest(
                      provider: ProviderEnum.googleOauth2,
                      accessToken: gAuth.accessToken!,
                    ),
                  );
                } else {
                  throw Exception('Google Sign In failed - no token');
                }
              },
              googleSignIn: (context
                      .read<AuthCubit>()
                      .socialLogins
                      .getSocialLoginByProvider(
                        ProviderEnum.googleOauth2,
                      ) as GoogleSocialLogin)
                  .googleSignIn,
            )
          else
            LinearProgressBuilder(
              action: (_) async {
                final authCubit = context.read<AuthCubit>();
                final socialLogin =
                    authCubit.socialLogins.getSocialLoginByProvider(
                  ProviderEnum.googleOauth2,
                );

                final result = await authCubit
                    .authenticateWithSocialProvider<GoogleSignInAccount>(
                  socialLogin.type,
                );

                if (result == null) {
                  throw Exception('Google Sign In failed');
                } else {
                  final googleSignInAuthentication =
                      await result.authentication;
                  final accessToken = googleSignInAuthentication.accessToken;

                  if (accessToken == null) {
                    throw Exception('Google Sign In failed - no token');
                  }
                  await authCubit.loginWithSocialProvider(
                    socialTokenObtainRequest: SocialTokenObtainRequest(
                      provider: socialLogin.type.provider,
                      accessToken: accessToken,
                    ),
                  );
                }
              },
              builder: (context, action, error) => GoogleSignInButton(
                onPressed: action,
              ),
            ),
          const SizedBox(
            height: 8,
          ),
          LinearProgressBuilder(
            action: (_) async {
              final authCubit = context.read<AuthCubit>();
              final socialLogin =
                  authCubit.socialLogins.getSocialLoginByProvider(
                ProviderEnum.facebook,
              );

              final result =
                  (await authCubit.authenticateWithSocialProvider<LoginResult>(
                socialLogin.type,
              ));
              if (result == null) {
                throw Exception('Facebook Sign In failed');
              } else {
                if (result.status == LoginStatus.cancelled) {
                  return;
                } else if (result.status == LoginStatus.failed) {
                  throw Exception('Facebook Sign In failed');
                } else if (result.status == LoginStatus.success) {
                  final accessToken = result.accessToken?.token;
                  if (accessToken == null) {
                    throw Exception('Facebook Sign In failed - no token');
                  }

                  await authCubit.loginWithSocialProvider(
                    socialTokenObtainRequest: SocialTokenObtainRequest(
                      provider: socialLogin.type.provider,
                      accessToken: accessToken,
                    ),
                  );
                }
              }
            },
            builder: (context, action, error) => ElevatedButton(
              onPressed: action,
              child: const Text('Continue with Facebook'),
            ),
          ),
          if (kIsWeb != true && Platform.isIOS) ...[
            const SizedBox(
              height: 8,
            ),
            LinearProgressBuilder(
              action: (_) async {
                final authCubit = context.read<AuthCubit>();
                final socialLogin = authCubit.socialLogins
                    .getSocialLoginByProvider(ProviderEnum.appleId);

                final result = (await authCubit.authenticateWithSocialProvider<
                    AuthorizationCredentialAppleID>(
                  socialLogin.type,
                ));
                if (result == null) {
                  throw Exception('Apple Sign In failed');
                } else {
                  if (result.identityToken == null) {
                    throw Exception('Apple Sign In failed - no token');
                  }
                  final accessToken = result.identityToken!;
                  await authCubit.loginWithSocialProvider(
                    socialTokenObtainRequest: SocialTokenObtainRequest(
                      provider: socialLogin.type.provider,
                      accessToken: accessToken,
                      firstName: result.givenName,
                      lastName: result.familyName,
                    ),
                  );
                }
              },
              builder: (context, action, error) => ElevatedButton(
                onPressed: action,
                child: const Text('Continue with Apple'),
              ),
            ),
          ],
          const SizedBox(
            height: 8,
          ),
          LinearProgressBuilder(
            action: (_) async {
              const providerEnum = ProviderEnum.discord;
              final authCubit = context.read<AuthCubit>();
              final socialLogin =
                  authCubit.socialLogins.getSocialLoginByProvider(providerEnum);
              final result =
                  await authCubit.authenticateWithSocialProvider<String>(
                socialLogin.type,
              );

              if (result != null) {
                await authCubit.loginWithSocialProvider(
                  socialTokenObtainRequest: SocialTokenObtainRequest(
                    provider: providerEnum,
                    accessToken: result,
                  ),
                );
              }
            },
            builder: (context, action, error) => ElevatedButton(
              onPressed: action,
              child: const Text('Continue with Discord'),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      );
}

enum _AuthOptions {
  register,
  otpLogin,
  passwordLogin,
}
