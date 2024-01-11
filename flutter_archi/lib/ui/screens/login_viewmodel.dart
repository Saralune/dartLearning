import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _emailErrorMessage;
  String? _passwordErrorMessage;
  String? _errorMessage;

  String? get passwordErrorMessage => _passwordErrorMessage;
  String? get emailErrorMessage => _emailErrorMessage;
  String? _email;
  String? _password;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  bool get _minimalInputIsValid =>
      _email != null &&
      _password != null &&
      _emailErrorMessage == null &&
      _passwordErrorMessage == null;

  void loginUser() async {
    final email = _email;
    final password = _password;

    if (email != null && password != null) {
      if (email.contains("@") == false) {
        _emailErrorMessage = "L'email ne contient pas d' \"@\"";
        notifyListeners();
      }
      if (password.isEmpty) {
        _passwordErrorMessage = "Le mot de passe ne doit pas être vide.";
        notifyListeners();
      }

      if (_minimalInputIsValid) {
        _isLoading = true;
        notifyListeners();
        await Future.delayed(const Duration(seconds: 2));
        _isLoading = false;
        //_errorMessage = "Login attempt with $email and $password";
        _errorMessage = password == "ok"
            ? "Bienvenue $email !"
            : "Impossible de retrouver votre compte...";
        notifyListeners();
      }
    }
    notifyListeners();
  }

  void emailChanged(String newEmail) {
    _email = newEmail;
    _emailErrorMessage = null;
  }

  void passwordChanged(String newPassword) {
    _password = newPassword;
    _passwordErrorMessage = null;
  }
}
