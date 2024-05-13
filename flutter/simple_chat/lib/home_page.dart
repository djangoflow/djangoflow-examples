import 'package:dio/dio.dart';
import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:simple_chat/simple_chat_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Simple'),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        bloc: context.read<AuthCubit>(),
        listener: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (state.isAuthenticated) {
              _redirectToChatRoomsPage(context);
              return;
            }
            _redirectToLoginPage(context);
          });
        },
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(8),
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
          );
        },
      ),
    );
  }

  void _redirectToChatRoomsPage(BuildContext context) =>
      Navigator.pushReplacementNamed(context, SimpleChatRoutes.chatRooms.route);

  void _redirectToLoginPage(BuildContext context) =>
      Navigator.pushReplacementNamed(context, SimpleChatRoutes.home.route);

  Future<void> _signupOrLogin({
    required BuildContext context,
    required bool isSigningUp,
    required String username,
    required String password,
  }) async {
    try {
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
    } on DioException catch (error) {
      if (error.response == null) {
        _showErrorSnackBar('Something went wrong.');
        rethrow;
      }

      final data = Map.from(error.response?.data);
      final isAuthenticationFailed =
          data.values.first.first['code'] == 'authentication_failed';
      if (isAuthenticationFailed) {
        _showErrorSnackBar('Incorrect username or password.');
      }
    } catch (_) {
      _showErrorSnackBar('Something went wrong.');
    }
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      final snackBar = SnackBar(content: Text('$message Please try again'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class _UsernamePasswordInputs extends StatelessWidget {
  const _UsernamePasswordInputs({
    required this.actionButtonBuilder,
  });

  final Widget Function(BuildContext context, FormGroup form)
      actionButtonBuilder;

  FormGroup get _form => FormGroup(
        {
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
        },
      );

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
