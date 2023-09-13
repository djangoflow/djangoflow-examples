import 'package:auth_2fa/api_repository.dart';
import 'package:auth_2fa/main.dart';
import 'package:dio/dio.dart';
import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_bloc/flutter_list_bloc.dart';
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
          title: const Text('Auth 2FA'),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) => state.whenOrNull(
            authenticated: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Authenticated'),
                ),
              );
              context.read<UsersUsersDataBloc>().load(
                    const UsersUsersRetrieveFilter(id: '0'),
                  );
              return null;
            },
            unauthenticated: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Unauthenticated'),
                ),
              );
              context.read<UsersUsersDataBloc>().clear();
              return null;
            },
          ),
          listenWhen: (previous, current) =>
              current.isAuthenticated || current.isUnauthenticated,
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
                                    );
                                  }
                                },
                                onError: (error) async {
                                  await _onEmailPasswordLoginError(error, form);
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
                  const _TwoFactorSwitch(),
                  const SizedBox(
                    height: 8,
                  ),
                  const _OtpDeviceListView(),
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

  Future<void> _onEmailPasswordLoginError(Object error, FormGroup form) async {
    final authCubit = context.read<AuthCubit>();
    if (error is DioException) {
      if (error.response?.statusCode == 401) {
        final errorsJson = (error.response?.data
            as Map<String, dynamic>?)?['errors'] as List<dynamic>?;
        if (errorsJson != null) {
          final twoFaError = errorsJson.firstWhere(
              (element) => element['code'] == '2fa_required',
              orElse: () => -1);
          if (twoFaError != -1) {
            final otpDevicesJson = twoFaError['extra_data']['devices'];

            if (otpDevicesJson != null) {
              debugPrint(otpDevicesJson.toString());
              final otpDevices = <OTPDevice>[];
              for (final otpDeviceJson in otpDevicesJson) {
                otpDevices.add(
                  OTPDevice.fromJson(
                    otpDeviceJson,
                  ),
                );
              }

              final selectedValue = await showModalBottomSheet<OTPDevice>(
                context: context,
                builder: (context) => _OtpDeviceSelector(
                  availableOtpDevices: otpDevices,
                ),
              );

              if (selectedValue != null && selectedValue.id != null) {
                if (context.mounted) {
                  await authCubit.requestOTP(
                    otpObtainRequest: OTPObtainRequest(
                      email: selectedValue.name,
                    ),
                  );
                  if (context.mounted) {
                    final code = await showModalBottomSheet<String>(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => _OtpDeviceConfirmation(
                        deviceId: selectedValue.id.toString(),
                      ),
                    );
                    if (code != null) {
                      final email = form.control('email').value;
                      final password = form.control('password').value;
                      if (email != null &&
                          password != null &&
                          context.mounted) {
                        await _signupOrLogin(
                          context: context,
                          email: email,
                          password: password,
                          otp: code,
                        );
                      }
                    }
                  }
                }
              }
            }
          } else {
            throw error;
          }
        }
      }
    } else {
      throw error;
    }
  }

  Future<void> _signupOrLogin({
    required BuildContext context,
    bool isSigningUp = false,
    required String email,
    required String password,
    String? otp,
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
        otp: otp,
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

class _OtpDeviceListView extends StatelessWidget {
  const _OtpDeviceListView();

  @override
  Widget build(BuildContext context) {
    return ListViewBlocBuilder<OtpListBloc, OTPDevice,
        AuthOtpDevicesListFilter>(
      create: (context) => OtpListBloc()..load(),
      headerBuilder: (context, state) => const _AddOtpDeviceInputs(),
      emptyBuilder: (context, state) => const Text('No 2FA Devices'),
      loadingBuilder: (context, state) => const Text('Loading...'),
      loadingItemsCount: 1,
      errorBuilder: (context, state) =>
          const Text('Failed to load 2FA Devices'),
      withRefreshIndicator: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, state, index, item) => Card(
        margin: EdgeInsets.zero,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          key: ValueKey(item.id),
          title: Text(item.name ?? 'No Name'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.type.name),
              if (item.confirmed != true) ...[
                const SizedBox(
                  height: 8,
                ),
                LinearProgressBuilder(
                  action: (_) async {
                    final deviceName = item.name;
                    final deviceId = item.id;

                    if (deviceName == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Device name is null'),
                        ),
                      );
                      return;
                    }

                    if (deviceId == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Device id is null'),
                        ),
                      );
                      return;
                    }

                    final authCubit = context.read<AuthCubit>();
                    final otpListBloc = context.read<OtpListBloc>();

                    await authCubit.requestOTP(
                      otpObtainRequest: OTPObtainRequest(
                        email: deviceName,
                      ),
                    );
                    if (context.mounted) {
                      final otp = await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => _OtpDeviceConfirmation(
                          deviceId: deviceId.toString(),
                        ),
                      );
                      if (otp != null && otp is String) {
                        await otpListBloc.confirmOtpDevice(
                          id: deviceId.toString(),
                          type: item.type.name,
                          otpDeviceConfirmRequest: OTPDeviceConfirmRequest(
                            otp: otp,
                          ),
                        );
                      }
                    } else {
                      throw Exception('Context is not mounted');
                    }
                  },
                  onSuccess: () => context.read<OtpListBloc>().reload(),
                  builder: (context, action, error) => TextButton.icon(
                    onPressed: action,
                    icon: const Icon(Icons.check),
                    label: const Text('Confirm this device'),
                  ),
                ),
              ],
            ],
          ),
          trailing: IconButton(
            onPressed: () async {
              final id = item.id;
              if (id != null) {
                final cubit = context.read<OtpListBloc>();
                await cubit.destroy(
                  type: item.type.name,
                  id: id.toString(),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('id is null'),
                  ),
                );
              }
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
      shrinkWrap: true,
    );
  }
}

class _AddOtpDeviceInputs extends StatelessWidget {
  const _AddOtpDeviceInputs();

  FormGroup get _form => fb.group({
        'device_name': FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        'device_type': FormControl<TypeEnum>(
          validators: [
            Validators.required,
          ],
        ),
      });

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => _form,
      builder: (context, formGroup, child) {
        return Column(
          children: [
            ReactiveTextField(
              formControlName: 'device_name',
              decoration: const InputDecoration(
                labelText: 'Email/Phone',
              ),
              validationMessages: {
                ValidationMessage.required: (_) => 'Name must not be empty',
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ReactiveDropdownField<TypeEnum>(
              formControlName: 'device_type',
              decoration: const InputDecoration(
                labelText: 'Device Type',
              ),
              items: TypeEnum.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 8,
            ),
            LinearProgressBuilder(
              action: (_) async {
                final cubit = context.read<OtpListBloc>();
                final deviceName = formGroup.control('device_name').value;
                final deviceType = formGroup.control('device_type').value;

                if (deviceName != null && deviceType != null) {
                  await cubit.create(
                    oTPDeviceRequest: OTPDeviceRequest(
                      type: deviceType,
                      name: deviceName,
                    ),
                  );
                } else {
                  formGroup.markAllAsTouched();
                }
              },
              builder: (context, action, error) => ElevatedButton(
                onPressed: action,
                child: const Text('Add 2FA Device'),
              ),
            ),
          ],
        );
      },
    );
  }
}

enum _AuthOptions {
  register,
  otpLogin,
  passwordLogin,
}

class OtpListBloc extends AuthOtpDevicesListBloc {
  AuthApi get _authApi => ApiRepository.instance.auth;

  Future<void> confirmOtpDevice({
    required String id,
    required String type,
    required OTPDeviceConfirmRequest otpDeviceConfirmRequest,
  }) async {
    await _authApi.authOtpDevicesConfirmCreate(
      id: id,
      type: type,
      oTPDeviceConfirmRequest: otpDeviceConfirmRequest,
    );

    super.reload();
  }
}

class _OtpDeviceConfirmation extends StatelessWidget {
  final String deviceId;
  const _OtpDeviceConfirmation({required this.deviceId});
  FormGroup get _form => fb.group(
        {
          'otp': FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(6),
              Validators.maxLength(6),
            ],
          ),
        },
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Input OTP to confirm the device!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 8,
            ),
            ReactiveFormBuilder(
              form: () => _form,
              builder: (context, formGroup, child) {
                return Column(
                  children: [
                    ReactiveTextField(
                      formControlName: 'otp',
                      decoration: const InputDecoration(
                        labelText: 'OTP',
                      ),
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'OTP must not be empty',
                        ValidationMessage.minLength: (_) =>
                            'OTP must be 6 digits',
                        ValidationMessage.maxLength: (_) =>
                            'OTP must be 6 digits',
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Builder(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            if (formGroup.valid) {
                              final otp = formGroup.control('otp').value;

                              if (otp != null) {
                                Navigator.pop(context, otp);
                              }
                            } else {
                              formGroup.markAllAsTouched();
                            }
                          },
                          child: const Text('Confirm'),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TwoFactorSwitch extends StatelessWidget {
  const _TwoFactorSwitch();

  @override
  Widget build(BuildContext context) {
    return DataBlocBuilder<UsersUsersDataBloc, User, UsersUsersRetrieveFilter>(
      itemBuilder: (context, state) => SwitchListTile(
        key: ValueKey(state.data?.is2faEnabled),
        title: const Text('2FA Enabled'),
        value: state.data?.is2faEnabled ?? false,
        onChanged: (value) async {
          final usersDataBloc = context.read<UsersUsersDataBloc>();
          await usersDataBloc.partialUpdate(
            id: defaultUserId,
            patchedUserRequest: PatchedUserRequest(
              is2faEnabled: value,
            ),
          );
          usersDataBloc.load();
        },
      ),
      loadingBuilder: (context, state) => const Text('Loading'),
      emptyBuilder: (context, state) => const Text('No User Data'),
      builder: (context, state, itemBuilder) => itemBuilder(context),
    );
  }
}

class _OtpDeviceSelector extends StatelessWidget {
  const _OtpDeviceSelector({
    this.availableOtpDevices = const <OTPDevice>[],
  });
  final List<OTPDevice> availableOtpDevices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Please select a 2FA device to verify your identity',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: availableOtpDevices.length,
            itemBuilder: (context, index) {
              final otpDevice = availableOtpDevices[index];
              return Card(
                margin: EdgeInsets.zero,
                child: ListTile(
                  title: Text(otpDevice.name ?? 'No Name'),
                  subtitle: Text(otpDevice.type.name),
                  onTap: () {
                    Navigator.pop(context, otpDevice);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
