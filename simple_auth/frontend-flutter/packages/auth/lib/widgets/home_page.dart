import 'dart:io';

import 'package:auth/constants.dart';
import 'package:auth/router/router.dart';
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

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  FormGroup get _form => FormGroup({
        'email': FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        'otp': FormControl<String?>(),
      });
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('DF Auth Example'),
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isAuthenticated = state.isAuthenticated;

            return ListView(
              padding: const EdgeInsets.all(kPadding),
              children: [
                if (!isAuthenticated)
                  ReactiveFormBuilder(
                    form: () => _form,
                    builder: (context, formGroup, child) =>
                        const _OtpLoginInputs(),
                  )
                else ...[
                  const Text('Authenticated'),
                  const SizedBox(height: kPadding),
                  SelectableText('Token: ${state.token}'),
                  const SizedBox(
                    height: kPadding,
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
}

class _OtpLoginInputs extends StatefulWidget {
  const _OtpLoginInputs({super.key});

  @override
  State<_OtpLoginInputs> createState() => _OtpLoginInputsState();
}

class _OtpLoginInputsState extends State<_OtpLoginInputs> {
  final ValueNotifier<bool> _hasRequestedOtp = ValueNotifier<bool>(false);

  @override
  void initState() {
    _hasRequestedOtp.addListener(_hasOtpRequestedListener);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _hasRequestedOtp.dispose();
  }

  void _hasOtpRequestedListener() {
    final form = ReactiveForm.of(context) as FormGroup;
    if (_hasRequestedOtp.value == true) {
      form.control('otp').setValidators([
        Validators.required,
        Validators.minLength(6),
        Validators.maxLength(6),
      ]);
    } else {
      form.control('otp').setValidators([]);
      form.control('otp').markAsUntouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;

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
              ValidationMessage.email: (_) => 'Must be a valid email address',
            }),
        const SizedBox(
          height: kPadding,
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
                  validationMessages: {
                    ValidationMessage.required: (_) => 'OTP must not be empty',
                    ValidationMessage.minLength: (_) => 'OTP must be 6 digits',
                    ValidationMessage.maxLength: (_) => 'OTP must be 6 digits',
                  },
                )
              : const SizedBox(),
        ),
        const SizedBox(
          height: kPadding,
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
                      await authCubit.loginWithEmailOTP(email: email, otp: otp);
                    }
                  },
                  builder: (context, action, error) => ElevatedButton(
                    onPressed: action,
                    child: const Text('Login'),
                  ),
                )
              : LinearProgressBuilder(
                  action: (_) async {
                    final email = form.control('email').value;
                    if (email != null) {
                      await context.read<AuthCubit>().requestOTP(email: email);
                      _hasRequestedOtp.value = true;
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
  }
}

class _SocialLoginButtons extends StatelessWidget {
  const _SocialLoginButtons({super.key});

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
              builder: (context, action, error) => SizedBox(
                width: double.infinity,
                child: GoogleSignInButton(
                  onPressed: action,
                ),
              ),
            ),
          const SizedBox(
            height: kPadding,
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
              height: kPadding,
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
            height: kPadding,
          ),
        ],
      );
}
