import 'package:blog/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog/auth/presentation/bloc/auth_event.dart';
import 'package:blog/auth/presentation/bloc/auth_state.dart';
import 'package:blog/core/theme/app_theme.dart';
import 'package:blog/core/widget/dialog/error_dialog.dart';
import 'package:blog/core/widget/misc/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Bejelentkezés képernyő.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// Bejelentkezés képernyőhöz [State].
class _LoginScreenState extends State<LoginScreen> {
  /// E-mail controller
  final TextEditingController _email = TextEditingController(text: 'demo@kfonix.hu');

  /// Password controller
  final TextEditingController _password = TextEditingController(text: 'xxx');

  /// Űrlaphoz key.
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ErrorDialog.showErrorDialog(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return LoadingIndicator();
            }

            return Row(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 450),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Blog ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'X',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 45.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.errorColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32.0),
                            TextFormField(
                              controller: _email,
                              decoration: InputDecoration(hintText: 'E-mail', counterText: ''),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'E-mail kitöltése kötelező!';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 12.0),
                            TextFormField(
                              controller: _password,
                              obscureText: true,
                              decoration: InputDecoration(hintText: 'Jelszó', counterText: ''),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Jelszó kitöltése kötelező!';
                                } else if (value.length < 3) {
                                  return 'Jelszó minimum három hosszú kell legyen!';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 32.0),
                            TextButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  context.read<AuthBloc>().add(
                                    AuthSignInEvent(email: _email.text, password: _password.text),
                                  );
                                  _email.clear();
                                  _password.clear();
                                }
                              },
                              child: Text('Bejelentkezés'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
