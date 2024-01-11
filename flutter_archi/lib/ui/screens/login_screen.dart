import 'package:flutter/material.dart';

import 'login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel _viewModel;
  const LoginScreen(this._viewModel, {Key? key}) : super(key: key);

  _loggedInButtonPressed() {
    _viewModel.loginUser();
  }

  _isPasswordOK(value) {
    if (value == null || value.isEmpty || !value.contains("ok")) {
      return "Le mot de passe n'est pas correct !";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedBuilder(
              animation: _viewModel,
              builder: (context, child) {
                final errorMessage = _viewModel.errorMessage;
                return Column(
                  children: [
                    TextFormField(
                      onChanged: _viewModel.emailChanged,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [
                        AutofillHints.username,
                        AutofillHints.email
                      ],
                      decoration: InputDecoration(
                          labelText: "Email",
                          errorText: _viewModel.emailErrorMessage),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains("ok")) {
                          return "Le mot de passe n'est pas correct !";
                        }
                        return null;
                      },
                      onChanged: _viewModel.passwordChanged,
                      obscureText: true,
                      autofillHints: const [AutofillHints.password],
                      decoration: InputDecoration(
                          labelText: "Mot de passe",
                          errorText: _viewModel.passwordErrorMessage),
                    ),
                    const SizedBox(height: 8),
                    if (_viewModel.isLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      Center(
                        child: ElevatedButton(
                            onPressed: _loggedInButtonPressed,
                            child: const Text("Se connecter")),
                      ),
                    if (errorMessage != null)
                      Text(
                        errorMessage,
                        style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      )
                  ],
                );
              })),
    );
  }
}
